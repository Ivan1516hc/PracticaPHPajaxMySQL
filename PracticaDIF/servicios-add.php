<?php

include('Connection.php');

if(isset($_POST['nombre'])) {
  echo $_POST['nombre'] . ', ' . $_POST['descripcion'];
  $servicio_nombre = $_POST['nombre'];
  $servicio_descripcion = $_POST['descripcion'];
  $query = "INSERT into servicios (nombre, descripcion) VALUES ('$servicio_nombre', '$servicio_descripcion')";
  $result = mysqli_query($connection, $query);

  if (!$result) {
    die('onsulta Fallida.');
  }

  echo "Servicio agregado correctamente";  

}

?>