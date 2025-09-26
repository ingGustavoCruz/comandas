<?php
session_start();
session_unset();
session_destroy();

// Opcional: puedes devolver un mensaje JSON para verificar el éxito
echo json_encode(['success' => true]);
exit();
