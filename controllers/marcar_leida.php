<?php
session_start();
include '../config/conexion.php';

if (!isset($_SESSION['usuario'])) {
    session_unset();
    session_destroy();
    header("Location: login.php");
    exit();
}

if (isset($_GET['id'])) {
    $idOrden = $_GET['id'];

    // Preparar y ejecutar la consulta para actualizar el estado de la orden
    $stmt = $conexion->prepare("UPDATE ordenes SET estado = 'Leída' WHERE id_orden = :idOrden");
    $stmt->bindParam(':idOrden', $idOrden, PDO::PARAM_INT);
    $success = $stmt->execute();

    // Enviar una respuesta JSON indicando si la operación fue exitosa
    echo json_encode(['success' => $success]);
    exit();
}
