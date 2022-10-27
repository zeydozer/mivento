<?php setlocale(LC_ALL, 'tr_TR') ?>
<!doctype html>
<html lang="tr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>Mivento Assessment</title>
  </head>
  <body>
    <div class="container mt-4">
      <div class="row justify-content-center">
        <div class="col-md-5">
          <form class="needs-validation" novalidate>
            <div class="mb-3">
              <label for="campaign-name" class="form-label">Kampanya Adı</label>
              <input type="text" class="form-control" id="campaign-name" required />
            </div>
            <div class="mb-3">
              <select class="form-select" required id="campaign-date">
                <option selected disabled value="">Tarih Seçin</option>
                <?php for ($i = intval(date('m')); $i <= 12; $i++) : ?>
                  <option value="<?php echo date('Y-m', mktime(0, 0, 0, $i, 1, date('Y'))) ?>">
                    <?php echo date('F Y', mktime(0, 0, 0, $i, 1, date('Y'))) ?>
                  </option>
                <?php endfor ?>
              </select>
            </div>
            <div class="mb-3">
              <label for="campaign-file" class="form-label">Dosya Yükleyin</label>
              <input class="form-control" type="file" id="campaign-file" required />
            </div>
            <div class="d-grid">
              <button class="btn btn-primary btn-block" type="submit">Yükle</button>
            </div>
          </form>
          <div class="alert mt-4 alert-danger d-none"></div>
          <div class="alert mt-4 alert-success d-none"></div>
          <div class="alert mt-4 alert-info d-none"></div>
        </div>
      </div>
    </div>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <!-- Example starter JavaScript for disabling form submissions if there are invalid fields -->
    <script src="index.js?step=11"></script>
  </body>
</html>
