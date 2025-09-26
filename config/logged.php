<?php
session_start(); 

if (isset($_SESSION['palco'])) {
    header("Location: ./palco.php");
    exit(); 
} else if (isset($_SESSION['usuario'])) {
    header("Location: ./cocina.php");
    exit(); 
} else {
    session_unset();
    session_destroy();
    header("Location: ./login.php");
    exit(); 
}
