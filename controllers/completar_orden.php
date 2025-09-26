<?php
session_start();
include '../config/conexion.php';

if (!isset($_SESSION['usuario'])) {
    session_unset();
    session_destroy();
    header("Location: login.php");
    exit();
}

if (isset($_POST['id_orden'])) {
    $idOrden = $_POST['id_orden'];

    // Actualizar el estado de la orden a "Completado"
    $stmt = $conexion->prepare("UPDATE ordenes SET estado = 'Completado' WHERE id_orden = :idOrden");
    $stmt->bindParam(':idOrden', $idOrden, PDO::PARAM_INT);
    $success = $stmt->execute();

    // Enviar respuesta JSON
    echo json_encode(['success' => $success]);
    exit();
}
