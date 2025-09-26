<?php
session_start();
include 'config/conexion.php';

if (isset($_SESSION['palco'])) {
    $palco = $_SESSION['palco'];
} else {
    session_unset();
    session_destroy();
    header("Location: login.php");
    exit();
}

// Preparar la consulta para obtener el usuario basado en el nombre de usuario (palco)
$smtPalco = $conexion->prepare("SELECT * FROM usuarios WHERE id_usuario = :palco");
$smtPalco->bindParam(':palco', $palco, PDO::PARAM_STR); // Usar PDO::PARAM_STR ya que 'usuario' es una cadena
$smtPalco->execute();
$usuario = $smtPalco->fetch(PDO::FETCH_ASSOC);

// Opcional: mostrar los resultados obtenidos
if ($usuario) {
    $nombre = $usuario['nombre'];
} else {
    session_unset();
    session_destroy();
    header("Location: login.php");
    exit();
}

$smt = $conexion->prepare("SELECT * FROM productos");
$smt->execute();
$productos = $smt->fetchAll(PDO::FETCH_ASSOC);

$smtCategoria = $conexion->prepare("SELECT * FROM categorias");
$smtCategoria->execute();
$categorias = $smtCategoria->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $nombre ?></title>
    <link rel="shortcut icon" href="img/toluca.png" type="image/x-icon">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="css/dashboard.css">
</head>

<body>



    <!-- header -->
    <!-- <i id="close-sesion" class="fa-solid fa-power-off"></i> -->
    <i id="close-sesion" class="fa-solid fa-right-from-bracket" title="SALIR"></i>

    <input type="checkbox" name="cart" id="cart" checked>
    <label for="cart" class="label-cart">
        <i class="fa-solid fa-cart-shopping"></i>
        <span class="cart-count" id="cart-count">0</span> <!-- Contador de productos -->

    </label>

    <h3 class="logo">ЯK • TOLUCA | <?= $nombre ?></h3>

    <!-- sidebar -->
    <!-- <nav class="sidebar">
        <div class="sidebar-menu">
            <i class="fa-solid fa-magnifying-glass"></i>
            <a href="#">Search</a>
        </div>
        <div class="sidebar-menu">
            <i class="fa-solid fa-house"></i>
            <a href="#">Home</a>
        </div>
        <div class="sidebar-menu">
            <i class="fa-solid fa-heart"></i>
            <a href="#">Favs</a>
        </div>
        <div class="sidebar-menu">
            <i class="fa-solid fa-user"></i>
            <a href="#">Profile</a>
        </div>
        <div class="sidebar-menu">
            <i class="fa-solid fa-gear"></i>
            <a href="#">Settings</a>
        </div>
    </nav> -->

    <!-- main dashboard -->
    <main class="dashboard">
        <div class="dashboard-banner">
            <img src="img/banner.jpg" alt="">
            <div class="banner-promo">
                <h1><span>Diablos Rojos</span>
                    De la cocina a tu Palco</h1>
            </div>
        </div>

        <h3 class="dashboard-title">Nuestros Productos</h3>
        <div class="dashboard-menu">
            <a href="#" class="active" data-categoria="todos">TODOS</a>
            <!-- <a href="#" data-categoria="favoritos">FAVORITOS</a> -->
            <?php foreach ($categorias as $categoria): ?>
                <a href="#" data-categoria="<?= htmlspecialchars($categoria['id_categoria']); ?>"><?= htmlspecialchars($categoria['nombre_categoria']); ?></a>
            <?php endforeach; ?>
        </div>

        <div class="dashboard-content">
            <?php foreach ($productos as $producto): ?>
                <div class="dashboard-card" data-id="<?= $producto['id_producto']; ?>"
                    data-name="<?= htmlspecialchars($producto['nombre_producto']); ?>"
                    data-price="<?= $producto['precio']; ?>"
                    data-img="<?= urlencode($producto['img_producto']); ?>"
                    data-categoria="<?= htmlspecialchars($producto['id_categoria']); ?>">

                    <img src="img/<?php echo urlencode($producto['img_producto']) . '.jpg'; ?>" alt="" class="card-image">
                    <div class="card-detail">
                        <h4><?= htmlspecialchars($producto['nombre_producto']); ?>
                            <span>$<?= number_format($producto['precio'], 2); ?></span>
                        </h4>
                        <p><?= htmlspecialchars($producto['descripcion_producto']); ?></p>
                        <p class="card-time">
                            <i class="fa-solid fa-cart-plus"></i><span>Agregar 1</span>
                        </p>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>


    </main>

    <!-- order dashboard -->
    <div class="dashboard-order">
        <h3>Orden</h3>
        <div class="order-address">
            <p>Diablos Rojos</p>
            <h4>Toluca - Palcos</h4>
        </div>
        <!-- <div class="order-time">
            <i class="fa-solid fa-clock"></i> 30 mins
        </div> -->

        <div class="order-wrapper">
            <!-- Los productos se agregarán dinámicamente aquí -->
        </div>

        <hr class="divider">
        <div class="order-total">
            <p>Subtotal <span>$</span></p>
            <!-- <p>IVA (16%) <span>$</span></p>
            <p>Entrega <span>$</span></p> -->

            <!-- <div class="order-promo">
                <input type="text" name="" id="" class="input-promo" placeholder="Coidgo Promocional">
                <button class="button-promo">Aplicar</button>
            </div> -->

            <hr class="divider">
            <p>Total <span id="total">$</span></p>
        </div>

        <button class="checkout" id="check-order">
            Confirmar
        </button>
    </div>

</body>

<script src="js/categories.js"></script>

<script src="js/cart.js"></script>

<script src="js/logout.js"></script>

</html>