<?php
//Importar la conexion a phpMyAdmin
include ('Connection.php');

//Guardar los datos del metodo POST en una variable
$search = $_POST['search']; 
    //Verificar que no este vacio
    if(!empty($search)){
        //Realizar consulta
        $query ="Select * from servicios where nombre LIKE '$search%'";
        //Ejectutar consulta y guardar los resultados
        $result = mysqli_query($connection,$query);
        //Verificar que lleguen resultados
        if(!$result){
            //Indicar porque no llegaron los resultados
            die('Error de consulta'.mysqli_error($connection));
        }
        //Descomponer el resultado en arreglo
        $json = array();
        while($row = mysqli_fetch_array($result)){
            $json[]=array(
                'nombre' => $row['nombre'],
                'descripcion' => $row['descripcion'],
                'id' => $row['id'],
                'activo' => $row['activo']
            );
        }
        //convertir Json en string para mandarlo al frontend
        $jsonstring = json_encode($json);
        echo $jsonstring;
    }
?>