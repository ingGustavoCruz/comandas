document.getElementById('close-sesion').addEventListener('click', function() {
    fetch('./config/logout.php', { method: 'POST' })
        .then(response => {
            if (response.ok) {
                // Redirige al usuario después de cerrar sesión
                window.location.href = './login.php';
            }
        })
        .catch(error => console.error('Error:', error));
});