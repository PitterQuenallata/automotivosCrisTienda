<?php

  if(!empty($routesArray[1])){
    
    if($routesArray[1] == "gestion"){
      include ('modules/gestion.php');
    }else{
      echo '<script>
      window.location = "'.$path.'404";</script>';
    }
  }else{
    include ('modules/listado.php');
  
  }
  
?>

</div>
<script src="<?php echo $path ?>views/assets/js/tables/tables.js"></script>
<script src="<?php echo $path ?>views/assets/js/forms/forms.js"></script>