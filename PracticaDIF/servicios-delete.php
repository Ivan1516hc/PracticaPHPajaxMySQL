<?php
include('Connection.php');

if(isset($_POST['id'])) {
  $id = $_POST['id'];
  $query = "UPDATE servicios SET activo = 0 WHERE id = '$id'";
  $result = mysqli_query($connection, $query);

  if (!$result) {
    die('Consulta Fallida.');
  }
  echo "Servicio eliminado correctamente";  

}
?>