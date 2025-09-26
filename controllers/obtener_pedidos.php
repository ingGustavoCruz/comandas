<?php
session_start();
include '../config/conexion.php';

if (!isset($_SESSION['usuario'])) {
    session_unset();
    session_destroy();
    header("Location: login.php");
    exit();
}

try {
    $stmt = $conexion->prepare("
       SELECT 
    ordenes.id_orden,  
    ordenes.estado,
    usuarios.nombre AS usuario_nombre, 
    ordenes.fecha_orden, 
    GROUP_CONCAT(CONCAT(detalle_orden.cantidad, ' ', productos.nombre_producto) ORDER BY productos.nombre_producto SEPARATOR '<br>') AS productos_detalle, 
    ordenes.total
FROM 
    ordenes
JOIN 
    detalle_orden ON ordenes.id_orden = detalle_orden.id_orden
JOIN 
    productos ON detalle_orden.id_producto = productos.id_producto
JOIN 
    usuarios ON ordenes.id_usuario = usuarios.id_usuario
WHERE 
    ordenes.estado IN ('En preparación', 'Leída')
GROUP BY 
    ordenes.id_orden, usuarios.nombre, ordenes.fecha_orden, ordenes.total;



    ");
    $stmt->execute();
    $ordenes = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (Exception $e) {
    echo 'Error: ' . $e->getMessage();
    exit();
}

// Generar el HTML

if (count($ordenes) > 0): ?>
    <?php foreach ($ordenes as $orden): ?>
        <div class="card-order <?= $orden['estado'] === 'Leída' ? 'active' : '' ?>" data-id="<?= $orden['id_orden']; ?>">
            <div class="face front">
                <img src="img/order.jpg" alt="">
                <h3>Pedido #<?= $orden['id_orden']; ?></h3>
            </div>

            <div class="face back">
                <span id="order-number">Pedido #<?= $orden['id_orden']; ?></span>
                <h3><?= $orden['usuario_nombre']; ?></h3>
                <p><?= $orden['productos_detalle']; ?></p>
                <div class="link">
                    <a href="#" class="complete-order" data-id="<?= $orden['id_orden']; ?>">Completado</a>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
<?php else: ?>
    <p>No hay órdenes en preparación en este momento.</p>
<?php endif; ?>