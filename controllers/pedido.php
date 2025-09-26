<?php
session_start();
include '../config/conexion.php';

if (!isset($_SESSION['palco'])) {
    session_unset();
    session_destroy();
    header("Location: login.php");
    exit();
}

$palco = $_SESSION['palco'];

if (isset($_POST['cart'])) {
    $cart = json_decode($_POST['cart'], true);
    $total = $_POST['total'];

    if (empty($cart) || $total <= 0) {
        echo json_encode(['status' => 'error', 'message' => 'El carrito está vacío o el total es incorrecto.']);
        exit();
    }

    try {
        $conexion->beginTransaction();

        $smtOrden = $conexion->prepare("INSERT INTO ordenes (id_usuario, fecha_orden, total, estado) VALUES (:id_usuario, NOW(), :total, 'En preparación')");
        $smtOrden->bindParam(':id_usuario', $palco);
        $smtOrden->bindParam(':total', $total);
        $smtOrden->execute();

        $id_orden = $conexion->lastInsertId();

        $smtDetalle = $conexion->prepare("INSERT INTO detalle_orden (id_orden, id_producto, cantidad, precio_venta) VALUES (:id_orden, :id_producto, :cantidad, :precio_venta)");

        foreach ($cart as $productId => $producto) {
            $smtDetalle->bindParam(':id_orden', $id_orden);
            $smtDetalle->bindParam(':id_producto', $productId);
            $smtDetalle->bindParam(':cantidad', $producto['quantity']);
            $smtDetalle->bindParam(':precio_venta', $producto['price']);
            $smtDetalle->execute();
        }

        $conexion->commit();
        echo json_encode(['status' => 'success']);
    } catch (Exception $e) {
        $conexion->rollBack();
        echo json_encode(['status' => 'error', 'message' => 'Error al procesar la orden: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'No se recibieron datos del carrito']);
}
