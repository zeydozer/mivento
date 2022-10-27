(function () {
  'use strict';
  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation'),
    button = document.getElementsByClassName('btn-primary')[0],
    defaultText = button.innerHTML;
  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        event.preventDefault();
        if (!form.checkValidity()) {
          event.stopPropagation();
          form.classList.add('was-validated');
        } else {
          // If check validity return true then ..
          form.classList.remove('was-validated');
          button.innerHTML = 'Yükleniyor..';
          postForm();
        }
      }, false);
    });
  // Read inputs and csv file
  let reader = new FileReader(),
    name = document.getElementById('campaign-name'),
    date = document.getElementById('campaign-date'),
    file = {
      dom: document.getElementById('campaign-file'),
      binary: null,
    };
  reader.addEventListener('load', () => {
    file.binary = reader.result;
  });
  if (file.dom.files[0])
    reader.readAsBinaryString(file.dom.files[0]);
  file.dom.addEventListener('change', () => {
    if (reader.readyState === FileReader.LOADING)
      reader.abort();
    reader.readAsBinaryString(file.dom.files[0]);
  });
  // Post form with ajax
  function postForm () {
    // If there is a selected file wait it is read
    if (!file.binary && file.dom.files.length > 0) {
      setTimeout(postForm, 10);
      return;
    }
    let xhr = new XMLHttpRequest(),
      boundary = 'blob',
      data = '';
    if (file.dom.files[0]) {
      data += `--${boundary}\r\n`
        + 'content-disposition: form-data; '
        + `name="${file.dom.id}"; `
        + `filename="${file.dom.files[0].name}"\r\n`
        + `Content-Type: ${file.dom.files[0].type}\r\n\r\n`
        + file.binary + '\r\n';
    }
    data += `--${boundary}\r\n`
      + `content-disposition: form-data; name="${name.id}"\r\n\r\n`
      + name.value + "\r\n";
    data += `--${boundary}\r\n`
      + `content-disposition: form-data; name="${date.id}"\r\n\r\n`
      + date.value + "-01\r\n";
    xhr.open('POST', 'post.php');
    xhr.setRequestHeader('Content-Type', `multipart/form-data; boundary=${boundary}`);
    xhr.onreadystatechange = function (e) {
      if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          let resp = JSON.parse(xhr.response);
          alertMsg(resp.error ? 'danger' : 'success', resp.msg);
        } else alertMsg('danger', 'Oops! Bişeyler ters gitti.');
      } else alertMsg('danger', 'Oops! Bişeyler ters gitti.');
      button.innerHTML = defaultText;
    };
    xhr.send(data);
  }
  // alert message on type
  function alertMsg (type, msg) {
    document.querySelectorAll('.alert').forEach(function (alert) {
      alert.classList.add('d-none');
    });
    let alert = document.getElementsByClassName('alert-'+ type)[0];
    alert.innerHTML = msg;
    alert.classList.remove('d-none');
    setTimeout(() => {
      alert.classList.add('d-none');
    }, 5000);
  }
})();