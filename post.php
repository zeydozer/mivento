<?php

  error_reporting(0);

  require 'vendor/autoload.php';

  class importFile {
    private $db;
    private $file;
    private $post;
    private $datas = [];
    private $extension = 'csv';
    private $resp = ['err' => true];
    
    function __construct ($file, $post) {
      try {
        $name = 'mivento';
        $user = 'root';
        $pass = '';
        $this->db = new PDO('mysql:host=localhost;dbname='. $name, $user, $pass);
        $this->file = $file;
        $this->post = $post;
        $this->import();
      } catch (PDOException $e) {
        $this->resp['msg'] = 'Veritabanı bağlantı hatası: '. $e->getMessage();
      }
    }
    
    private function process () {
      $extension = pathinfo($this->file['name'], PATHINFO_EXTENSION);
      if ($extension != $this->extension) {
        $this->resp['msg'] = "Dosya formatı {$this->extension} değil!";
        return false;
      } else {
        $datas = $columns = [];
        $reader = PHPExcel_IOFactory::createReader($extension)->setDelimiter(';');
        $sheets = $reader->load($this->file['name']);
        $temp = $sheets->getActiveSheet();
        foreach ($temp->getRowIterator() as $row) {
          $cells = $row->getCellIterator();
          $cells->setIterateOnlyExistingCells(false);
          foreach ($cells as $i => $cell) {
            $coord = $cell->getCoordinate();
            if ($row->getRowIndex() == 1)
              $columns[$coord[0]] = $cell->getValue();
            else $datas[$row->getRowIndex()][$columns[$coord[0]]] = $cell->getValue();
          }
        }
        $duplicate = ['phone' => [], 'email' => [], 'employee_id' => []];
        foreach ($datas as $i => $values) {
          foreach ($values as $name => $value) {
            if ($name == 'email') {
              $value = filter_var($value, FILTER_SANITIZE_EMAIL);
              if (!filter_var($value, FILTER_VALIDATE_EMAIL)) {
                $this->resp['msg'] = "Mail adresi doğru değil ({$value}).";
                return false;
              } else $datas[$i]['email'] = $value;
            } else if ($name == 'phone') {
              $value = preg_replace('/[^0-9]/', '', $value);
              if (strlen($value) >= 10) {
                $value = substr($value, -10);
                if ((int) $value[0] != 5) {
                  $this->resp['msg'] = "Telefon numarası doğru değil ({$value}).";
                  return false;
                } else $datas[$i]['phone'] = $value;
              } else {
                $this->resp['msg'] = "Telefon numarası doğru değil ({$value}).";
                return false;
              }
            }
            if (in_array($name, array_keys($duplicate))) {
              if (in_array($value, $duplicate[$name])) {
                $this->resp['msg'] = "Tekil alanlarda tekrar eden veriler var ({$name} {$value}).";
                return false;
              }
              $duplicate[$name][] = $value;
            }
          }
        }
        $this->datas = $datas;
        return true;
      }
    }
    
    private function import () {
      if ($this->process()) {
        $this->db->beginTransaction();
        $sql = "INSERT INTO campaigns(name, date) VALUES(?, ?)";
        $query = $this->db->prepare($sql);
        $query->execute(array_values($this->post));
        if ($query->rowCount() > 0) {
          $campaignId = $this->db->lastInsertId();
          foreach ($this->datas as $i => $row) {
            try {
              $sql = "INSERT INTO users(name, surname, email, employee_id, phone, point, campaigns_id) VALUES(?, ?, ?, ?, ?, ?, ?)";
              $query = $this->db->prepare($sql);
              $query->execute(array_merge(array_values($row), [$campaignId]));
              if ($query->rowCount() == 0) {
                $this->resp['msg'] = 'Veri aktarım hatası: ('. implode(' ', $row) .') '. implode(' ', $this->db->errorInfo());
                $this->db->rollBack();
                return false;
              }
            } catch (PDOException $e) {
              $this->resp['msg'] = 'Veri aktarım hatası: ('. implode(' ', $row) .') '. $e->getMessage();
              $this->db->rollBack();
              return false;
            }
          }
          $this->db->commit();
          $this->resp['err'] = false;
          $this->resp['msg'] = count($this->datas) .' kayıt başarıyla aktarıldı.';
        } else $this->resp['msg'] = 'Kampanya eklenmedi: '. implode(' ', $this->db->errorInfo());
      }
    }
    
    function __destruct () {
      echo json_encode($this->resp);
    }
  }

  new importFile($_FILES['campaign-file'], $_POST);

?>