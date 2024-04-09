<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "taller01";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

function execute_query($sql) {
    global $conn;
    if ($conn->query($sql) === TRUE) {
        return true;
    } else {
        return false;
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    $table = $_GET['table']; 
    
    $allowed_tables = array("Tabla1", "Tabla2", "Tabla3", "Tabla4");
    if (!in_array($table, $allowed_tables)) {
        http_response_code(400); 
        echo json_encode(array("message" => "Tabla no válida"));
        exit;
    }
    
    $columns = implode(', ', array_keys($data));
    $values = "'" . implode("', '", $data) . "'";
    $sql = "INSERT INTO $table ($columns) VALUES ($values)";
    
    if (execute_query($sql)) {
        http_response_code(201); 
        echo json_encode(array("message" => "Registro creado exitosamente"));
    } else {
        http_response_code(500); 
        echo json_encode(array("message" => "Error al crear el registro: " . $conn->error));
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['table']) && isset($_GET['id'])) {
    $table = $_GET['table'];
    $id = $_GET['id'];

    switch ($table) {
        case 'Tabla1':
            $sql = "SELECT t1.*, t2.nombre_producto, t2.descripcion_producto, t2.precio_producto,
            t4.id as empleado_id, t4.nombre_empleado, t4.apellido_empleado 
                    FROM Tabla1 t1
                    INNER JOIN Tabla2 t2 ON t1.tabla2_id = t2.id
                    LEFT JOIN Tabla4 t4 ON t2.id = t4.tabla2_id
                    WHERE t1.id = $id
                    LIMIT 1";
            break;
            case 'Tabla4':
                $sql = "SELECT t4.*, t2.nombre_producto, t2.descripcion_producto, t2.precio_producto,
                t1.id as cliente_id, t1.nombre_cliente, t1.apellido_cliente
                        FROM Tabla4 t4
                        INNER JOIN Tabla2 t2 ON t4.tabla2_id = t2.id
                        LEFT JOIN Tabla1 t1 ON t2.id = t1.tabla2_id
                        WHERE t4.id = $id
                        LIMIT 1";
                break;
        case 'Tabla2':
            $sql = "SELECT nombre_producto, descripcion_producto, precio_producto FROM Tabla2 WHERE id = $id LIMIT 1";
            break;
        case 'Tabla3':
            $sql = "SELECT t3.*, t1.id as cliente_id, t1.nombre_cliente, t1.apellido_cliente,
            t2.nombre_producto, t2.descripcion_producto, t2.precio_producto,
            t4.id as empleado_id, t4.nombre_empleado, t4.apellido_empleado 
                    FROM Tabla2 t2 
                    JOIN Tabla3 t3 ON t2.id = t3.tabla2_id 
                    LEFT JOIN Tabla1 t1 ON t2.id = t1.tabla2_id
                    LEFT JOIN Tabla4 t4 ON t2.id = t4.tabla2_id
                    WHERE t3.id = $id";
            break;
        default:
            $sql = "SELECT * FROM $table WHERE id = $id LIMIT 1";
    }

    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        if ($table === 'Tabla3') {
            $rows = array();
            while ($row = $result->fetch_assoc()) {
                $rows[] = $row;
            }
            http_response_code(200); 
            echo json_encode($rows);
        } else {
            $row = $result->fetch_assoc();
            http_response_code(200); 
            echo json_encode($row);
        }
    } else {
        http_response_code(302);
        echo json_encode(array("message" => "No se encontró el registro en la tabla $table"));
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    $data = json_decode(file_get_contents('php://input'), true);

    $table = $_GET['table']; 
    $id = $data['id']; 
    unset($data['id']);
    
    $set_clause = "";
    foreach ($data as $column => $value) {
        $set_clause .= "$column = '$value', ";
    }
    $set_clause = rtrim($set_clause, ", "); 
    $sql = "UPDATE $table SET $set_clause WHERE id = $id";
    
    if (execute_query($sql)) {
        http_response_code(200); 
        echo json_encode(array("message" => "Registro actualizado exitosamente"));
    } else {
        http_response_code(302);
        echo json_encode(array("message" => "Error al actualizar el registro: " . $conn->error));
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $table = $_GET['table'];
    
    $id = $_GET['id'];
    
    $sql = "DELETE FROM $table WHERE id = $id";

    if (execute_query($sql)) {
        http_response_code(200); 
        echo json_encode(array("message" => "Registro eliminado exitosamente"));
    } else {
        http_response_code(302); 
        echo json_encode(array("message" => "Error al eliminar el registro: " . $conn->error));
    }
}

$conn->close();

?>
