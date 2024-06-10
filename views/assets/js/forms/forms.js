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
