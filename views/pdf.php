<?php
# Incluyendo librerías necesarias #
include '../resources/php/conexion.php';
require "../fpdf/code128.php";
session_start();

// Verificar si la sesión tiene los datos del cliente seleccionado
if (isset($_SESSION['id_cliente_seleccionado'])) {
    $id_cliente = $_SESSION['id_cliente_seleccionado'];
} else {
    // Manejo de error si no hay cliente seleccionado
    die("Error: No se ha seleccionado ningún cliente.");
}

// Consultar los datos del cliente seleccionado
$query = "SELECT * FROM tbl_clientes WHERE id_cliente = ?";
$stmt = $conexion->prepare($query);
$stmt->bind_param('i', $id_cliente);
$stmt->execute();
$result = $stmt->get_result();
$cliente = $result->fetch_assoc();

// Datos del cliente
$nombre_cliente = $cliente['nombre_cliente'];

$pdf = new PDF_Code128('P', 'mm', 'Letter');
$pdf->SetMargins(17, 17, 17);
$pdf->AddPage();

# Logo de la empresa formato png #
$pdf->Image('../resources/images/logo-removed.png', 155, 12, 50, 40, 'PNG');

# Encabezado y datos de la empresa #
$pdf->SetFont('Arial', 'B', 16);
$pdf->SetTextColor(32, 100, 210);
$pdf->Cell(150, 10, iconv("UTF-8", "ISO-8859-1", strtoupper("T I R M E X")), 0, 0, 'L');

$pdf->Ln(9);

$pdf->SetFont('Arial', '', 10);
$pdf->SetTextColor(39, 39, 51);
$pdf->Cell(150, 9, iconv("UTF-8", "ISO-8859-1", "RUC: 0000000000"), 0, 0, 'L');
$pdf->Ln(5);
$pdf->Cell(150, 9, iconv("UTF-8", "ISO-8859-1", "Dirección San Salvador, El Salvador"), 0, 0, 'L');
$pdf->Ln(5);
$pdf->Cell(150, 9, iconv("UTF-8", "ISO-8859-1", "Teléfono: 00000000"), 0, 0, 'L');
$pdf->Ln(5);
$pdf->Cell(150, 9, iconv("UTF-8", "ISO-8859-1", "Email: correo@ejemplo.com"), 0, 0, 'L');
$pdf->Ln(10);

// Información de la factura
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(30, 7, iconv("UTF-8", "ISO-8859-1", "Fecha de emisión:"), 0, 0);
$pdf->SetTextColor(97, 97, 97);
$pdf->Cell(116, 7, iconv("UTF-8", "ISO-8859-1", date("y-m-d") . " " . date("h:i A")), 0, 0, 'L'); 
$pdf->SetFont('Arial', 'B', 10);
$pdf->SetTextColor(39, 39, 51);
$pdf->Cell(35, 7, iconv("UTF-8", "ISO-8859-1", strtoupper("Factura Nro.")), 0, 0, 'C');

$pdf->Ln(7);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(12, 7, iconv("UTF-8", "ISO-8859-1", "Cajero:"), 0, 0, 'L');
$pdf->SetTextColor(97, 97, 97);
$pdf->Cell(134, 7, iconv("UTF-8", "ISO-8859-1", "Carlos Alfaro"), 0, 0, 'L');
$pdf->SetFont('Arial', 'B', 10);
$pdf->SetTextColor(97, 97, 97);
$pdf->Cell(35, 7, iconv("UTF-8", "ISO-8859-1", strtoupper("1")), 0, 0, 'C');

$pdf->Ln(10);

// Información del cliente
$pdf->SetFont('Arial', '', 10);
$pdf->SetTextColor(39, 39, 51);
$pdf->Cell(13, 7, iconv("UTF-8", "ISO-8859-1", "Cliente:"), 0, 0);
$pdf->SetTextColor(97, 97, 97);
$pdf->Cell(60, 7, iconv("UTF-8", "ISO-8859-1", $nombre_cliente), 0,  0, 'L');
$pdf->SetTextColor(39, 39, 51);
$pdf->Cell(8, 7, iconv("UTF-8", "ISO-8859-1", "Doc: "), 0, 0, 'L');
$pdf->SetTextColor(97, 97, 97);
$pdf->Cell(60, 7, iconv("UTF-8", "ISO-8859-1", "DNI: 00000000"), 0, 0, 'L');
$pdf->SetTextColor(39, 39, 51);
$pdf->Cell(7, 7, iconv("UTF-8", "ISO-8859-1", "Tel:"), 0, 0, 'L');
$pdf->SetTextColor(97, 97, 97);
$pdf->Cell(35, 7, iconv("UTF-8", "ISO-8859-1", "00000000"), 0, 0);
$pdf->SetTextColor(39, 39, 51);

$pdf->Ln(7);
$pdf->SetTextColor(39, 39, 51);
$pdf->Cell(6, 7, iconv("UTF-8", "ISO-8859-1", "Dir:"), 0, 0);
$pdf->SetTextColor(97, 97, 97);
$pdf->Cell(109, 7, iconv("UTF-8", "ISO-8859-1", "San Salvador, El Salvador, Centro America"), 0, 0);

$pdf->Ln(9);
$productos = isset($_SESSION['productos_seleccionados']) ? $_SESSION['productos_seleccionados'] : [];
// Verifica si hay productos en la sesión
if (empty($productos)) {
    $pdf->SetFont('Arial', 'I', 10);
    $pdf->Cell(0, 10, iconv("UTF-8", "ISO-8859-1", "No hay productos para mostrar."), 0, 1, 'C');
} else {
    // Crear la tabla de productos
    $pdf->SetFont('Arial', '', 8);
    $pdf->SetFillColor(23, 83, 201);
    $pdf->SetDrawColor(23, 83, 201);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(90, 8, iconv("UTF-8", "ISO-8859-1", "Descripción"), 1, 0, 'C', true);
    $pdf->Cell(15, 8, iconv("UTF-8", "ISO-8859-1", "Cant."), 1, 0, 'C', true);
    $pdf->Cell(25, 8, iconv("UTF-8", "ISO-8859-1", "Precio"), 1, 0, 'C', true);
    $pdf->Cell(19, 8, iconv("UTF-8", "ISO-8859-1", "Desc."), 1, 0, 'C', true);
    $pdf->Cell(32, 8, iconv("UTF-8", "ISO-8859-1", "Subtotal"), 1, 0, 'C', true);

    $pdf->Ln(8);
    $pdf->SetTextColor(39, 39, 51);

    // Mostrar los productos
    $total = 0; 
    foreach ($productos as $producto) {
        $subtotal = $producto['cantidad_producto'] * $producto['precio_producto'];
        $total += $subtotal;

        $pdf->Cell(90, 7, iconv("UTF-8", "ISO-8859-1", $producto['nombre_producto']), 'L', 0, 'C');
        $pdf->Cell(15, 7, iconv("UTF-8", "ISO-8859-1", $producto['cantidad_producto']), 'L', 0, 'C');
        $pdf->Cell(25, 7, iconv("UTF-8", "ISO-8859-1", "$" . number_format($producto['precio_producto'], 2) . ""), 'L', 0, 'C');
        $pdf->Cell(19, 7, iconv("UTF-8", "ISO-8859-1", "$0.00 "), 'L', 0, 'C'); 
        $pdf->Cell(32, 7, iconv("UTF-8", "ISO-8859-1", "$" . number_format($subtotal, 2) . " "), 'L', 0, 'C');

        $pdf->Ln();
    }

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(90, 8, '', 0, 0); 
    $pdf->Cell(15, 8, '', 0, 0); 
    $pdf->Cell(25, 8, '', 0, 0); 
    $pdf->Cell(19, 8, 'Total', 1, 0, 'C', true); 
    $pdf->Cell(32, 8, iconv("UTF-8", "ISO-8859-1", "$" . number_format($total, 2) . " "), 1, 0, 'C', true); 
}

// Finalizar el PDF
$pdf->Output('Factura.pdf', 'D');
?>