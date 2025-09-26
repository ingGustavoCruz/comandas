<?php
session_start();
require 'conexion.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST['usuario'];
    if ($usuario != "administrador" && $usuario != "cocina") {
        $usuario = "palco$usuario";
    }
    echo $usuario;
    $password = $_POST['password'];

    try {
        $stmt = $conexion->prepare("
            SELECT u.password, r.nombre_rol, u.id_usuario 
            FROM usuarios u 
            JOIN roles r ON u.id_rol = r.id_rol
            WHERE u.usuario = :usuario");

        $stmt->bindParam(':usuario', $usuario);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $hashed_password = $row['password'];
            $nombre_rol = $row['nombre_rol'];
            $id = $row['id_usuario'];

            if (password_verify($password, $hashed_password)) {

                switch ($nombre_rol) {
                    case 'palco':
                        $_SESSION['palco'] = $id;
                        header("Location: ../palco.php");
                        break;
                    case 'cocina':
                    case 'administrador':
                        $_SESSION['usuario'] = $id;
                        header("Location: ../cocina.php");
                        break;

                    default:
                        echo "Rol no reconocido.";
                        break;
                }
                exit();
            } else {
                echo "Contraseña incorrecta.";
            }
        } else {
            echo "Usuario no encontrado.";
        }
    } catch (PDOException $e) {
        // Registra el error en un archivo en lugar de mostrarlo
        file_put_contents('error_log.txt', $e->getMessage(), FILE_APPEND);
        echo "Error en la consulta a la base de datos.";
    }
}
