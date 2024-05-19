/*=============================================
Validación Bootstrap 5
=============================================*/
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

/*=============================================
Función para validar datos repetidos
=============================================*/

function validateDataRepeat(event, type){

  if(type == "category"){

    var table = "categories";
    var linkTo = "name_category";

  }

  if(type == "subcategory"){

    var table = "subcategories";
    var linkTo = "name_subcategory";

  }

  if(type == "product"){

    var table = "products";
    var linkTo = "name_product";

  }

  var value = event.target.value;

  var data = new FormData();
  data.append("table", table);
  data.append("equalTo", value);
  data.append("linkTo",linkTo);

  $.ajax({

    url: "/ajax/forms.ajax.php",
    method: "POST",
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    success: function (response){  
      
      if(response == 404){

          validateJS(event, "complete");
  
          createUrl(event, "url_"+type);

          $(".metaTitle").html(value);

      }else{

        $(event.target).parent().addClass("was-validated");
        $(event.target).parent().children(".invalid-feedback").html("Este nombre ya existe en la base de datos");

         event.target.value = "";

        return;
      }

    }

  })

}

/*=============================================
Función para validar formularios
=============================================*/

function validateJS(event, type){

  $(event.target).parent().addClass("was-validated");
  
  if(type == "email"){

    var pattern = /^[.a-zA-Z0-9_]+([.][.a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/;
    
    if(!pattern.test(event.target.value)){

      $(event.target).parent().children(".invalid-feedback").html("El correo electrónico está mal escrito");

      event.target.value = "";

      return;

    }

  }

  if(type == "text"){

    var pattern = /^[A-Za-zñÑáéíóúÁÉÍÓÚ ]{1,}$/;
    
    if(!pattern.test(event.target.value)){

      $(event.target).parent().children(".invalid-feedback").html("El campo solo debe llevar texto");

      event.target.value = "";

      return;

    }

  }

  if(type == "password"){

    var pattern = /^[*\\$\\!\\¡\\?\\¿\\.\\_\\#\\-\\0-9A-Za-z]{1,}$/;
    
    if(!pattern.test(event.target.value)){

      $(event.target).parent().children(".invalid-feedback").html("La contraseña no puede llevar ciertos caracteres especiales");

      event.target.value = "";

      return;

    }

  }

  if(type == "complete"){

    var pattern = /^[-\\(\\)\\=\\%\\&\\$\\;\\_\\*\\"\\'\\#\\?\\¿\\!\\¡\\:\\,\\.\\/\\0-9a-zA-ZñÑáéíóúÁÉÍÓÚ ]{1,}$/;
    
    if(!pattern.test(event.target.value)){

      $(event.target).parent().children(".invalid-feedback").html("La entrada tiene errores de caracteres especiales");

      event.target.value = "";

      return;

    }

  }

}

/*=============================================
Función para recordar email en el login
=============================================*/
function rememberEmail(event){
  
  if(event.target.checked){

    localStorage.setItem("emailAdmin", $('[name="ingUsuario"]').val());
    localStorage.setItem("checkRem", true);

  }else{

    localStorage.removeItem("emailAdmin");
    localStorage.removeItem("checkRem");

  }

}

function getEmail(){

  if(localStorage.getItem("emailAdmin") != null){

    $('[name="ingUsuario"]').val(localStorage.getItem("emailAdmin"));

  }

   if(localStorage.getItem("checkRem") != null && localStorage.getItem("checkRem")){

    $("#remember").attr("checked", true);

  }

}

getEmail();
