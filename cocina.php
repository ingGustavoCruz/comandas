<?php
session_start();
include 'config/conexion.php';

if (isset($_SESSION['usuario'])) {
    $usuario = $_SESSION['usuario'];
} else {
    session_unset();
    session_destroy();
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ЯK • Pedidos</title>

    <link rel="shortcut icon" href="img/toluca.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="css/cocina.css">
</head>

<body>
    <i id="close-sesion" class="fa-solid fa-right-from-bracket" title="SALIR"></i>

    <div id="ordenes">

    </div>

    <script src="js/logout.js"></script>


    <script>
        function obtenerOrdenes() {
            fetch('controllers/obtener_pedidos.php')
                .then(response => response.text())
                .then(data => {
                    document.getElementById('ordenes').innerHTML = data;
                })
                .catch(error => console.error('Error al obtener órdenes:', error));
        }

        setInterval(obtenerOrdenes, 5000);
        obtenerOrdenes();

        function marcarComoLeida(idOrden, cardElement) {
            cardElement.classList.add('active');

            fetch(`controllers/marcar_leida.php?id=${idOrden}`, {
                    method: 'POST'
                })
                .then(response => response.json())
                .then(data => {
                    if (!data.success) {
                        console.error('Error al marcar la orden como leída');
                    }
                })
                .catch(error => console.error('Error:', error));
        }

        document.addEventListener('click', function(event) {
            if (event.target.closest('.card-order')) {
                const cardElement = event.target.closest('.card-order');
                const idOrden = cardElement.getAttribute('data-id');
                marcarComoLeida(idOrden, cardElement);
            }
        });

        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('complete-order')) {
                event.preventDefault(); // Evita que el enlace se comporte como un link

                const idOrden = event.target.getAttribute('data-id');
                const cardElement = event.target.closest('.card-order');

                // Confirmación del usuario
                const confirmacion = confirm('¿Estás seguro de que deseas marcar esta orden como completada?');

                if (confirmacion) {
                    // Solicitud AJAX para completar la orden
                    fetch('controllers/completar_orden.php', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: `id_orden=${idOrden}`
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                // Cambia el estado de la tarjeta visualmente a "completado"
                                cardElement.classList.add('completed');
                                alert('La orden ha sido marcada como completada.');
                            } else {
                                alert('Hubo un problema al completar la orden. Inténtalo de nuevo.');
                            }
                        })
                        .catch(error => console.error('Error:', error));
                }
            }
        });
    </script>
</body>

</html>