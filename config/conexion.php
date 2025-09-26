<?php
// conexion.php
include 'bd.php'; // Incluir el archivo de configuración

try {
    // Crear conexión usando PDO
    $dsn = "mysql:host=$host;dbname=$bd;charset=utf8mb4";
    $opciones = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Modo de error
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Tipo de fetch
        PDO::ATTR_EMULATE_PREPARES => false, // Deshabilitar la emulación de declaraciones preparadas
    ];

    $conexion = new PDO($dsn, $usuario, $contraseña, $opciones);
} catch (PDOException $e) {
    // Registra el error en un archivo en lugar de mostrarlo
    file_put_contents('error_log.txt', $e->getMessage(), FILE_APPEND);
    die("Error en la conexión a la base de datos.");
}
