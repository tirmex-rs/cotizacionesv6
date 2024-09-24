<?php

include('../resources/php/conexion.php');
require_once('../fpdf/fpdf.php');

// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start(); // Asegúrate de iniciar la sesión aquí

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['guardar_cliente'])) {
        // Obtener el ID del cliente seleccionado
        $id_cliente = $_POST['id_cliente'];

        // Guardar el ID del cliente en la sesión
        $_SESSION['id_cliente_seleccionado'] = $id_cliente;

    }
    if (isset($_POST['agregar_producto'])) {
        // Obtener el ID del producto seleccionado
        $id_producto = $_POST['id_producto'];

        // Guardar el ID del producto en la sesión
        $_SESSION['id_producto_seleccionado'] = $id_producto;

        // Ahora necesitas consultar los detalles del producto
        $sql = "SELECT * FROM tbl_productos WHERE Id_producto = '$id_producto'";
        $result = mysqli_query($conexion, $sql);
        $producto = mysqli_fetch_assoc($result);

        // Asegúrate de que el producto se recuperó correctamente
        if ($producto) {
            $_SESSION['productos_seleccionados'][] = $producto; // Agregar el producto a la sesión
        }
    }

    // Eliminar producto de la sesión
    if (isset($_POST['accion']) && $_POST['accion'] === 'Eliminar') {
        $id_producto_eliminar = $_POST['txtID'];

        // Recorre los productos seleccionados y elimina el que coincida
        foreach ($_SESSION['productos_seleccionados'] as $key => $producto) {
            if ($producto['Id_producto'] == $id_producto_eliminar) {
                unset($_SESSION['productos_seleccionados'][$key]); // Elimina el producto
                
                break;
            }
        }
    }
// Actualizar la cantidad de productos seleccionados
if (isset($_POST['accion']) && $_POST['accion'] === 'Actualizar') {
    $id_producto = $_POST['txtID'];
    $cantidad_producto = $_POST['txtCantidad'];

    // Recorre los productos seleccionados y actualiza la cantidad del producto que coincida
    foreach ($_SESSION['productos_seleccionados'] as $key => $producto) {
        if ($producto['Id_producto'] == $id_producto) {
            $_SESSION['productos_seleccionados'][$key]['cantidad_producto'] = $cantidad_producto;
            
            break;
        }
    }
}
    // Procesar la adición de productos a la cotización
    if (isset($_POST['accion']) && $_POST['accion'] === 'Agregar') {
        $id_cliente = $_SESSION['id_cliente_seleccionado'];
        $id_producto = $_SESSION['id_producto_seleccionado'];

        // Asegúrate de que el cliente y el producto sean válidos
        if (!empty($id_cliente) && !empty($id_producto)) {
            // Inserta en la base de datos
            $sql_cotizacion = "INSERT INTO tbl_cotizaciones (id_cliente, id_producto) VALUES ('$id_cliente', '$id_producto')";
            if (mysqli_query($conexion, $sql_cotizacion)) {
                
            } else {
                echo "Error al agregar el producto: " . mysqli_error($conexion);
            }
        } else {
            echo "Por favor, complete todos los campos requeridos.";
        }
    }
}

$txtID = (isset($_POST['txtID'])) ? $_POST['txtID'] : "";
$accion = (isset($_POST['accion'])) ? $_POST['accion'] : "";
$txtNombre = (isset($_POST['txtNombre'])) ? $_POST['txtNombre'] : "";
$txtDescripcion = (isset($_POST['txtDescripcion'])) ? $_POST['txtDescripcion'] : "";
$txtCantidad = (isset($_POST['txtCantidad'])) ? $_POST['txtCantidad'] : "";
$txtCategoria = (isset($_POST['txtCategoria'])) ? $_POST['txtCategoria'] : "";
$txtTalla = (isset($_POST['txtTalla'])) ? $_POST['txtTalla'] : "";
$txtPrecio = (isset($_POST['txtPrecio'])) ? $_POST['txtPrecio'] : "";
$txtImagen = (isset($_FILES['txtImagen']['name'])) ? $_FILES['txtImagen']['name'] : "";
$txtOldImagen = (isset($_POST['txtOldImagen'])) ? $_POST['txtOldImagen'] : "";

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/ae360af17e.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="../resources/css/init.css">
    <title>Tirmex | Cotizaciones</title>
</head>

<body>
    <div class="wrapper">
        <aside id="sidebar">
            <div class="h-100">
                <div class="sidebar-logo">
                    <a href="#"><img src="../resources/images/logo-removed.png" height="80px" width="140px" alt=""></a>
                </div>
                <ul class="sidebar-nav">
                    <li class="sidebar-header">Actividades</li>
                    <li class="sidebar-item"><a href="#" class="sidebar-link"><i class="fa-solid fa-list pe-2"></i>Perfil</a></li>
                    <li class="sidebar-item"><a href="#" class="sidebar-link collapsed" data-bs-toggle="collapse" data-bs-target="#pages" aria-expanded="false" aria-controls="pages"><i class="fa-regular fa-file-lines pe-2"></i>Paginas</a>
                        <ul id="pages" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a href="cotizaciones.php" class="sidebar-link">Cotizaciones</a></li>
                            <li class="sidebar-item"><a href="clientes.php" class="sidebar-link">Clientes</a></li>
                            <li class="sidebar-item"><a href="inventario.php" class="sidebar-link">Inventario</a></li>
                        </ul>
                    </li>
                    <li class="sidebar-item"><a href="#" class="sidebar-link collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard" aria-expanded="false" aria-controls="dashboard"><i class="fa-solid fa-sliders pe-2"></i>Dashboard</a>
                        <ul id="dashboard" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a href="#" class="sidebar-link">Graficas</a></li>
                        </ul>
                    </li>
                    <li class="sidebar-item"><a href="#" class="sidebar-link collapsed" data-bs-toggle="collapse" data-bs-target="#auth" aria-expanded="false" aria-controls="auth"><i class="fa-regular fa-user pe-2"></i>Auth</a>
                        <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a href="#" class="sidebar-link">Login</a></li>
                            <li class="sidebar-item"><a href="#" class="sidebar-link">Register</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </aside>
        <div class="main">
            <nav class="navbar navbar-expand px-3 border-bottom">
                <button class="btn" type="button" data-bs-theme="dark"><span class="navbar-toggler-icon"></span></button>
            </nav>
            <main class="content px-3 py-2">
                <div class="container-fluid">
                    <div class="mb-3 d-flex justify-content-between">
                        <h3>Cotizaciones</h3>
                        <button type="button" class="btn btn-success" target="_blank" id="boton" onclick="accionPDF()">PDF</button>
                    </div>
                    <form method="POST">
                        <h3>Seleccione un cliente</h3>
                        <select name="id_cliente" class="form-control">
                            <?php
                            // Consulta para obtener los clientes
                            $sql = "SELECT * FROM tbl_clientes";
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    echo "<option value='" . $row["id_cliente"] . "'>" . $row["nombre_cliente"] . "</option>";
                                }
                            } else {
                                echo "No se encontraron resultados.";
                            }
                            ?>

                        </select>
                        <button type="submit" name="guardar_cliente" class="btn btn-success mt-3">Guardar Cliente</button>

                        <h3 class="mt-3">Seleccione un producto</h3>
                        <select name="id_producto" class="form-control">
                            <?php
                            // Consulta para obtener los productos
                            $sql = "SELECT * FROM tbl_productos";
                            $result = mysqli_query($conexion, $sql);

                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    echo "<option value='" . $row["Id_producto"] . "'>" . $row["nombre_producto"] . "</option>";
                                }
                            } else {
                                echo "No se encontraron resultados.";
                            }
                            ?>
                        </select>

                        <button type="submit" name="agregar_producto" class="btn btn-primary mt-3">Agregar Producto</button>
                    </form>

                    <h4 class="text-center mt-3">Lista de productos seleccionados</h4>
                    <table class="table table-striped table-hover mt-3">
                        <thead class="thead-light">
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Imagen</th>
                                <th>Cantidad</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if (isset($_SESSION['productos_seleccionados'])) {
                                foreach ($_SESSION['productos_seleccionados'] as $key => $producto) {
                                    echo "<tr>
                        <td>" . $producto['Id_producto'] . "</td>
                        <td>" . $producto['nombre_producto'] . "</td>
                        <td>" . "$" . $producto['precio_producto'] . "</td>
                        <td><img src='../resources/images/productos/" . $producto['imagen_producto'] . "' alt='" . $producto['nombre_producto'] . "' height='50' width='50'></td>
                        <td>
                            <form method='POST' action=''>
                                <input type='hidden' name='txtID' value='" . $producto['Id_producto'] . "'>
                                <input type='number' name='txtCantidad' value='" . $producto['cantidad_producto'] . "'>
                                <button type='submit' name='accion' value='Actualizar' class='btn btn-primary'>Actualizar</button>
                            </form>
                        </td>
                        <td>
                            <form method='POST' action=''>
                                <input type='hidden' name='txtID' value='" . $producto['Id_producto'] . "'>
                                <button type='submit' name='accion' value='Eliminar' class='btn btn-danger'>Eliminar</button>
                            </form>
                        </td>
                    </tr>";
                                }
                            } else {
                                echo "<tr><td colspan='6'>No hay productos seleccionados.</td></tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>
    <script>
        function accionPDF() {
            window.location.href = 'pdf.php';
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
   </body>

</html>