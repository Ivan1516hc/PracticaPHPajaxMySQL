<?php

include('Connection.php');

if(isset($_POST['id'])) {
  $servicio_nombre = $_POST['nombre']; 
  $servicio_descripcion = $_POST['descripcion'];
  $id = $_POST['id'];
  $query = "UPDATE servicios SET nombre = '$servicio_nombre', descripcion = '$servicio_descripcion' WHERE id = '$id'";
  $result = mysqli_query($connection, $query);

  if (!$result) {
    die('Consulta Fallida.');
  }
  echo "Servicio editado correctamente";  

}

?>
