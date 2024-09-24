-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2024 a las 22:51:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tirmex-cotizaciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categorias`
--

CREATE TABLE `tbl_categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(355) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_categorias`
--

INSERT INTO `tbl_categorias` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Camaras'),
(2, 'Control de acceso'),
(3, 'Control peatonal'),
(4, 'Control de acceso vehicular'),
(5, 'Detectores de humo fotoelectricos'),
(6, 'Paneles solares'),
(7, 'Trackers GPS'),
(8, 'GPS'),
(9, 'Dashcam'),
(10, 'Camaras de reversa'),
(11, 'Drones'),
(12, 'Categoria 5E'),
(13, 'RJ45'),
(14, 'UPS'),
(15, 'Respaldo de energia'),
(16, 'Torniquetes'),
(17, 'Fusionadora'),
(18, 'Carrete'),
(19, 'Señalamientos'),
(20, 'Luces auxiliares vehiculares'),
(21, 'Luces para montacargas'),
(22, 'Plantas de emergencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(355) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_clientes`
--

INSERT INTO `tbl_clientes` (`id_cliente`, `nombre_cliente`) VALUES
(1, 'Alsara'),
(2, 'Christus Murgueza Reynosa'),
(3, 'Diebold de México Sa de Cv'),
(4, 'Calzados Andrea de zapatería de México'),
(5, 'Venore paqueteria'),
(6, 'Sumitronics'),
(7, 'Baterias Rivera'),
(8, 'Tapiceria Gonzales'),
(9, 'MacTell De Mexico'),
(10, 'Transporte Gonzales'),
(11, 'Tortilleria Leguz'),
(12, 'Grupo ASVEC'),
(13, 'Instituto Tecnologico de Reynosa'),
(14, 'Itech analytic'),
(15, 'Seguro velas(GRUPO VELAS)'),
(16, 'ZAPATERIA ZAPATILLA DE CRISTAL'),
(17, 'Grupo Burgos'),
(18, 'Trareysa'),
(19, 'Steel Mart'),
(20, 'Grupo Iconn'),
(21, 'Eco Industrial del Noreste'),
(22, 'Global México'),
(23, 'Acero Ventas'),
(24, 'Femsa'),
(25, 'Pesajes y basculas del norte s.a de c.v'),
(26, 'Grupo GOR'),
(27, 'super mercados smart'),
(28, 'Nidec'),
(29, 'Safety Training Solutions'),
(30, 'Agencia Aduanal Sierra, S.C.'),
(31, 'Office Depot'),
(32, 'Reco de Reynosa, S.A. de C.V.'),
(33, 'TRISA Comercial S.A. de C.V'),
(34, 'Hospital Santander'),
(35, 'Fortune Plastic & Metal de Mexico SA de CV'),
(36, 'Border Freight'),
(37, 'Boxes.mx Planta Reynosa'),
(38, 'Cano and Son Mexico'),
(39, 'Techos y Proyectos Industriales sa de cv'),
(40, 'Tecmilenio'),
(41, 'IIES'),
(42, 'KND Industrias'),
(43, 'Anchor Bay Packaging'),
(44, 'Empaquemex'),
(45, 'Almex'),
(46, 'Omoda'),
(47, 'sharp Reynosa'),
(48, 'Hydro Precisión Reynosa'),
(49, 'Weldmex Industries'),
(50, 'Impresora Donneco Internacional'),
(51, 'Sarreal S.A DE C.V'),
(52, 'Auto transportes Varela'),
(53, 'Oro al Espíritu Santo'),
(54, 'ATL AUTOTRANSPORTES'),
(55, 'Paquete Express'),
(56, 'Fymersa'),
(57, 'GRUPO SEPSA'),
(58, 'Servicio Ideal'),
(59, 'Transporte Padilla'),
(60, 'Unimex'),
(61, 'Imobil'),
(62, 'Camy Graphics'),
(63, 'Nueva clean'),
(64, 'Ferreteria Genesis'),
(101, 'Camy Graphics'),
(102, 'Nueva clean'),
(103, 'Ferreteria Genesis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `Id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(355) NOT NULL,
  `categoria_producto` varchar(355) NOT NULL,
  `descripcion_producto` varchar(355) NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  `precio_producto` float NOT NULL,
  `imagen_producto` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_productos`
--

INSERT INTO `tbl_productos` (`Id_producto`, `nombre_producto`, `categoria_producto`, `descripcion_producto`, `cantidad_producto`, `precio_producto`, `imagen_producto`) VALUES
(1, 'TURBO HD 2 MEGAPIXEL (1080P)', 'CAMARAS', 'Lente fijo: 2.8 mm (ángulo de visión 101°). 30 mts smart IR (visión nocturna). Soporta las 4 tecnologías del mercado (TVI / AHD / CVI / CVBS). dWDR / AGC / BLC / HLC / 2D DNR. Soporta coaxitron.', 1, 912.35, 0x313732363736353338375f436170747572612064652070616e74616c6c6120323032342d30392d3133203135353032382e706e67),
(2, 'DS-2CE72DF3T-PIRXOS', 'CAMARAS', 'Resolución Máxima 2 Megapixel (1920 x 1080) Detección de humano por medio de sensor PIR. Luz blanca con 20 m de distancia. Salida de audio en cámara para conectar una bocina preamplificada', 1, 2188.06, 0x313732363736353432345f436170747572612064652070616e74616c6c6120323032342d30392d3139203131353833392e706e67),
(4, 'DS-2CD1143G0-I(C)', 'CAMARAS', 'Resolución máxima: 4 Megapíxel. Distancia focal: 2.8 mm (ángulo de visión 98°) Iluminación mínima: color 0.01 Lux @ (F2.0, AGC ON).', 1, 3216.87, 0x313732363736363032355f436170747572612064652070616e74616c6c6120323032342d30392d3139203132313332382e706e67),
(5, 'E8-TURBO-G2P/A', 'CAMARAS', '2 Megapixel (1920 x 1080). Lente fijo: 2.8 mm (ángulo de visión 106.4°). 20 mts smart IR (visión nocturna). Micrófono Integrado para Grabar AUDIO', 1, 788.45, 0x313732363834363939325f436170747572612064652070616e74616c6c6120323032342d30392d3230203130343330342e706e67),
(6, 'DX360-15X', 'CAMARAS', '2 Megapíxel (1920 x 1080). Iluminación mínima: Color 0.005 Lux (F1.6, AGC ON). Distancia Focal: 5 a 75 mm (15X Zoom óptico / 16X Zoom digital). Distancia de Infrarrojos: 100 mts IR (visión nocturna).', 1, 7566.87, 0x313732363834373230365f436170747572612064652070616e74616c6c6120323032342d30392d3230203130343634312e706e67),
(8, 'EPMD4X-V2', 'CAMARAS', 'Lente motorizado: 4X, 2.8mm – 12mm Iluminación mínima: Color 0.005Lux@F1.2 Blanco/negro 0.001Lux@F1.2 Tecnología HD 1080P 4 in 1 TVI/AHD/CVI/CVBS', 1, 3199.08, 0x313732373138363234385f436170747572612064652070616e74616c6c6120323032342d30392d3234203038353732312e706e67),
(11, 'DHI-TPC-BF1241-B7F8- DW-S2', 'CAMARAS', 'Resolución de 4 Megapíxeles. Funciones de IA Avanzadas. Mín. Iluminación: Color: 0,05 lux Blanco y negro: 0,005 lux 0 lux (IR activado) Almacenamiento Tarjeta Micro SD (256 GB)', 1, 15073.5, 0x313732373138373232345f436170747572612064652070616e74616c6c6120323032342d30392d3234203039313233312e706e67),
(12, 'DH-IPC-HFW7842H-Z4-X', 'CAMARAS', 'LED IR incorporado y máx. la distancia de iluminación es de 120 m. Reconocimiento y Detección Facial. Salidas máx. 8 MP (3840 × 2160) a 50/60 fps.', 12, 41576.2, 0x313732373138393435315f436170747572612064652070616e74616c6c6120323032342d30392d3234203039353034352e706e67),
(13, 'DH-IPC-HFW5842E-ZE', 'CAMARAS', 'Detección facial. Máx. Resolución: 3840 (H) x 2160 (v) Sensor de imagen: CMOS de 1/1,8', 12, 10954.7, 0x313732373138393437385f436170747572612064652070616e74616c6c6120323032342d30392d3234203039353131332e706e67),
(14, 'TC-C35KS SPEC:I3/E/Y/S/2.8MM/V5.0', 'CAMARAS', '5mp lite starlight Camara domo lente fijo 2.8m ir 30m Metal y policarbonato Microfono', 1, 1, 0x313732373138393732385f436170747572612064652070616e74616c6c6120323032342d30392d3234203039353530342e706e67),
(15, 'TC-C38WS SPEC:I5/E/Y/M/2.8MM/V4.0', 'CAMARAS', '8mp lite starlight Cámara bala lente fijo Soporta micro Material de metal', 1, 1, 0x313732373138393736305f436170747572612064652070616e74616c6c6120323032342d30392d3234203039353535352e706e67),
(16, 'TC-H333N SPEC:I5W/C/WIFI/4MM/V4.2', 'CAMARAS', '3mp dual light cámara Microfono y speaker Soporta microsd Policarbonato', 1, 1, 0x313732373138393834305f436170747572612064652070616e74616c6c6120323032342d30392d3234203039353731352e706e67),
(18, 'CS-C3TN', 'CAMARAS WIFI', 'Bala IP 2 Megapíxel Visión 106° Detección de movimiento Micrófono integrado', 1, 1, 0x313732373139303533325f436170747572612064652070616e74616c6c6120323032342d30392d3234203130303834362e706e67),
(19, 'CS-H3-3K', 'CAMARAS WIFI', '5MP (3K) Detección Humana y de vehículo. Alerta de voz personalizadas. IR hasta 30m', 1, 1, 0x313732373139303535385f436170747572612064652070616e74616c6c6120323032342d30392d3234203130303931322e706e67),
(20, 'CS-C3TN-3MP', 'CAMARAS WIFI', 'Visión Nocturna en Color Micrófono Integrado y bocina integrado. Resolución: 3 Megapixel', 1, 1, 0x313732373139303636375f436170747572612064652070616e74616c6c6120323032342d30392d3234203130313130312e706e67),
(23, 'IPC-TA32CN-L', 'CAMARAS WIFI', 'Detección de movimiento y humana Indicador LED Alarma de sonido anormal Visión nocturna', 1, 1, 0x313732373139303831315f436170747572612064652070616e74616c6c6120323032342d30392d3234203130313135342e706e67),
(24, 'IPC-K2EN-3H1W', 'CAMARAS WIFI', 'Seguimiento Automático (Autotracking) Visión Nocturna Resolución: 3 Megapíxeles Alertas en Tiempo Real', 2, 2, 0x313732373139303835395f436170747572612064652070616e74616c6c6120323032342d30392d3234203130313431342e706e67),
(25, 'IPC-GK2DN-3C0W', 'CAMARAS WIFI', 'WiFi de 3MP con Smart Tracking Visión nocturna infrarroja Modo de privacidad Admite NVR, almacenamiento en la nube o MicroSD (hasta 256 GB)', 2, 2, 0x313732373139303838365f436170747572612064652070616e74616c6c6120323032342d30392d3234203130313434312e706e67),
(26, 'TAPO-C200', 'CAMARAS WIFI', 'Resolución de 1080p Full HD. Grabación local en memoria Micro SD (no incluida) Detección de movimiento.', 1, 1, 0x313732373139303936305f436170747572612064652070616e74616c6c6120323032342d30392d3234203130313535342e706e67),
(27, 'TAPOC100', 'CAMARAS WIFI', 'Audio doble vía Resolución de 1080p Full HD Notificación Push,', 1, 1, 0x313732373139313037325f436170747572612064652070616e74616c6c6120323032342d30392d3234203130313734322e706e67),
(28, 'TAPOC310', 'CAMARAS WIFI', '3 megapixel, audio doble vía, Vision nocturna hasta 30 metros Notificación Push Grabación local en memoria Micro SD (no incluida).', 1, 1, 0x313732373139313130315f436170747572612064652070616e74616c6c6120323032342d30392d3234203130313831332e706e67),
(29, 'DH-SD2A200HB-GN-AW-PV-S2', 'CAMARAS WIFI', 'Detección Inteligente de Humanos Conectividad Wifi Resolución: 2MP Visión Nocturna Superior', 1, 1, 0x313732373139313234395f436170747572612064652070616e74616c6c6120323032342d30392d3234203130323034332e706e67),
(30, 'DH-IPC-HFW1230DT-STW', 'CAMARAS WIFI', 'Lente de 2.8 mm IR de 30 Metros Altavoz Integrados 100 Grados de Apertura', 1, 1, 0x313732373139313330365f436170747572612064652070616e74616c6c6120323032342d30392d3234203130323134312e706e67),
(31, 'DH-F2C-LED', 'CAMARAS WIFI', 'Detección de Humanos por IA Micrófono Incorporado Visión Nocturna Fullcolor Resolución: 2MP', 1, 1, 0x313732373139323132385f436170747572612064652070616e74616c6c6120323032342d30392d3234203130333532322e706e67),
(32, 'DS-2CV2141G2-IDW(E)', 'CAMARAS WIFI', '4 Megapíxel Cuenta con antena Wifi. Dia / Noche Real (filtro ICR). Micrófono y Bocina Interconstruido', 1, 1, 0x313732373139323135365f436170747572612064652070616e74616c6c6120323032342d30392d3234203130333534382e706e67),
(33, 'DS-2CV2041G2-IDW(E)', 'CAMARAS WIFI', 'Bala IP 4 Megapixel Lente 2.8 mm Micrófono y Bocina Interconstruido Distancia de infrarrojos: 30 mts IR EXIR.', 1, 1, 0x313732373139323139305f436170747572612064652070616e74616c6c6120323032342d30392d3234203130333632342e706e67),
(34, 'DS-2CV1021G0-IDW1(D)', 'CAMARAS WIFI', '2 Megapíxel Cuenta con micrófono Inter construido. Lente 2.8 mm (ángulo de apertura 114.5º). Antena Wi-Fi (80 mts de rango máximo )', 1, 1, 0x313732373139333733305f436170747572612064652070616e74616c6c6120323032342d30392d3234203131303230342e706e67),
(35, 'NG-C501', 'CAMARAS WIFI', 'Cámara Bullet WiFi 1080P Lente 3.6mm Visión Nocturna Almacenamiento local y en la nube Control Remoto Audio Bi-direccional Funciona con Alexa', 1, 1, 0x313732373139333736305f436170747572612064652070616e74616c6c6120323032342d30392d3234203131303233352e706e67),
(36, 'NG-C401', 'CAMARAS WIFI', 'Cámara Bullet WiFi 1080P Distancia IR 15 metros Almacenamiento local y en la nube Control Remoto Audio Bi-direccional Funciona con Alexa', 1, 1, 0x313732373139333739395f436170747572612064652070616e74616c6c6120323032342d30392d3234203131303330302e706e67),
(37, 'CONTROL DE ACCESO DE HUELLA Y TARJETAS ID (EM)', 'CONTROL DE ACCESO', 'Pantalla de 2.4 Pulgadas Soporte 5,000 Usuarios Tarjetas y Passwords 100,000 Registros Indicaciones de audio.', 1, 1, 0x313732373139333834385f436170747572612064652070616e74616c6c6120323032342d30392d3234203131303430322e706e67),
(38, 'CONTROL DE ACCESO ANTIVANDÁLICO PARA EXTERIOR', 'CONTROL DE ACCESO', 'Memoria de 3000 plantillas de huellas dactilares Entradas para detector con interruptor de láminas y botón para la solicitud de salida Protección contra uso múltiple de una tarjeta para obtener acceso (anti-passback)', 1, 1, 0x313732373139333838385f436170747572612064652070616e74616c6c6120323032342d30392d3234203131303434302e706e67),
(39, 'CONTROL DE ACCESO EXTERIOR IP65', 'CONTROL DE ACCESO', 'Soporte 30.000 tarjetas válidas y 150.000 registros Lector de tarjetas ID. Soporte de tarjeta, contraseña, huella digital y la combinación de ellas.', 1, 1, 0x313732373139333932385f436170747572612064652070616e74616c6c6120323032342d30392d3234203131303530392e706e67),
(40, 'PROLIGHTPAS', 'CONTROL PEATONAL', 'Semáforo Peatonal Indicador Alto Iluminación de alta eficiencia Tiempo de vida mayor a 80,000 horas Herméticamente sellado y resistente al agua', 1, 1, 0x313732373139333938385f436170747572612064652070616e74616c6c6120323032342d30392d3234203131303632332e706e67),
(41, 'PRO-LIGHT-LED', 'CONTROL PEATONAL', 'Ángulo de visión: 30° Material del gabinete: plástico ABS Intensidad de iluminación 400-600 cd', 1, 1, 0x313732373139343439305f436170747572612064652070616e74616c6c6120323032342d30392d3234203131313434322e706e67),
(42, 'PROLIGHTLED100', 'CONTROL PEATONAL', 'Material del gabinete: Policarbonato Tiempo de vida mayor a 100,000 horas Diámetro 100mm', 1, 1, 0x313732373139373233305f436170747572612064652070616e74616c6c6120323032342d30392d3234203131313531332e706e67),
(43, 'VR10 PRO', 'CONTROL DE ACCESO VEHICULAR', 'Radar de Detección para Control de Acceso Vehicular Detección 0-6m (Vehículos o Personas) Funciona bajo diversas condiciones ambientales', 1, 1, 0x313732373139373938395f436170747572612064652070616e74616c6c6120323032342d30392d3234203132313330332e706e67),
(44, 'DHI-ITSJC-2303-DC12', 'CONTROL DE ACCESO VEHICULAR', 'Frecuencia de emisión: 77 GHz -80 GHz Tiempo de respuesta: 50 ms Objetivo de detección: humano, vehículo IP67', 1, 1, 0x313732373230333731395f436170747572612064652070616e74616c6c6120323032342d30392d3234203132323030362e706e67),
(45, 'PRO-12RF', 'CONTROL DE ACCESO VEHICULAR', 'Lector RFID de Largo Alcance para Control de Acceso Vehicular Comunicación TCP/IP Frecuencia de operación de 902-928 Mhz', 1, 1, 0x313732373230333736345f436170747572612064652070616e74616c6c6120323032342d30392d3234203133343931382e706e67),
(46, 'PRO12RFV1', 'CONTROL DE ACCESO VEHICULAR', 'Lector RFID de Largo Alcance para Control de Acceso Vehicular Hasta 12 m Lineales y Regulables de Cobertura Comunicación TCP/IP', 1, 1, 0x313732373230333838375f436170747572612064652070616e74616c6c6120323032342d30392d3234203133353131352e706e67),
(47, 'SAX-R2656', 'CONTROL DE ACCESO VEHICULAR', 'Lectora de Tarjetas UHF para Control de Acceso Vehicular Largo Alcance de 1 a 6 metros Encriptable Tiempo de reconocimiento inferior a 0.1S', 1, 1, 0x313732373230333931345f436170747572612064652070616e74616c6c6120323032342d30392d3234203133353135302e706e67),
(48, 'SAX-R2657', 'CONTROL DE ACCESO VEHICULAR', 'Lectora de Tarjetas UHF para Control de Acceso Vehicular Distancia de lectura: 1-10m Tiempo de lectura <0.1s', 1, 1, 0x313732373230343031385f436170747572612064652070616e74616c6c6120323032342d30392d3234203133353332362e706e67),
(49, 'DS-PDSMK-4BAR', 'DETECTORES DE HUMO FOTOELECTRICOS', 'LED duales para una visibilidad de 360° Voltaje de funcionamiento DC 12 V Cámara de detección de humo fotoeléctrica estable', 1, 1, 0x313732373230343037375f436170747572612064652070616e74616c6c6120323032342d30392d3234203133353432362e706e67),
(50, 'SF-119-412', 'DETECTORES DE HUMO FOTOELECTRICOS', 'Malla metálica protectora de polvo. Dimensiones: 42 mm (alto) x 99 mm (diámetro) Listado UL.', 1, 1, 0x313732373230343131345f436170747572612064652070616e74616c6c6120323032342d30392d3234203133353530342e706e67),
(51, '2W-B', 'DETECTORES DE HUMO FOTOELECTRICOS', 'Flexibilidad para diferentes opciones de montaje. Diseño para instalación rápida tipo “Plug In” Terminales tipo SEMS en línea.', 1, 1, 0x313732373230343134315f436170747572612064652070616e74616c6c6120323032342d30392d3234203133353533352e706e67),
(52, 'PANEL SOLAR PLEGABLE 200W', 'PANELES SOLARES', '1200W UGREEN Alta Eficiencia de Conversión Resistente Al Agua y Duradero Alineación Inteligente de la Luz Solar', 1, 1, 0x313732373230343237335f436170747572612064652070616e74616c6c6120323032342d30392d3234203133353732302e706e67),
(53, 'PANEL SOLAR PLEGABLE 100W', 'PANELES SOLARES', 'Alta Eficiencia de Conversión Alineación Inteligente de la Luz Solar Resistente Al Agua y Duradero', 1, 1, 0x313732373230343331335f436170747572612064652070616e74616c6c6120323032342d30392d3234203133353832302e706e67),
(54, 'MÓDULO SOLAR ATLAS-ECO GREEN ENERGY', 'PANELES SOLARES', 'Marco de Aluminio Anodizado de alta resistencia Tecnología de Dopado en Galio Monocristalino 144 Celdas grado A, 10BB', 1, 1, 0x313732373230343432385f436170747572612064652070616e74616c6c6120323032342d30392d3234203134303031392e706e67),
(55, 'CÁMARA EXTERIOR CE-01', 'TRACKERS GPS', 'Incluye cable de 10 mts Cámara con clasificación IP67 y tamaño reducido', 1, 1, 0x313732373230343533335f436170747572612064652070616e74616c6c6120323032342d30392d3234203134303230322e706e67),
(56, 'CAMARA USB PARA JC450', 'TRACKERS GPS', 'Modelo CI02 Resolucion 1280 x 720', 1, 1, 0x313732373230343636385f436170747572612064652070616e74616c6c6120323032342d30392d3234203134303432312e706e67),
(57, 'CAMARA INTERIOR CON INFRARROJO', 'TRACKERS GPS', 'Puede capturar vídeo e imágenes nítidas a plena luz del día y en condiciones de poca luz.', 1, 1, 0x313732373230343639375f436170747572612064652070616e74616c6c6120323032342d30392d3234203134303434392e706e67),
(58, 'LOCALIZADOR VEHICULAR 2G Y 4G', 'GPS', 'Deteccion de Jammer Seguimiento de ubicación, historial, kilometraje y velocidad de vehículos Acelerometro Bloqueo de ignición a distancia', 1, 1, 0x313732373230353136385f436170747572612064652070616e74616c6c6120323032342d30392d3234203134313234312e706e67),
(59, 'RASTREADOR 4G LTE CAT1', 'GPS', 'Modelo: PRO5LITE Sensores Bluetooth Audio 2 vias Sensores de combustible Lectura CAN, OBD y LCV', 1, 1, 0x313732373230353235395f436170747572612064652070616e74616c6c6120323032342d30392d3234203134313431322e706e67),
(60, 'LOCALIZADOR 4G LTE', 'GPS', 'Modelo: HCV5 Análogico Vehiculos ligeros / Vehiculos pesados', 1, 1, 0x313732373230363832395f436170747572612064652070616e74616c6c6120323032342d30392d3234203134333831392e706e67),
(61, 'RASTREADOR VEHICULAR Y DE ACTIVOS', 'GPS', 'Detección de Jammer Batería con capacidad de hasta 1000 transmisiones Conectividad Bluetooth 4.0 LE Compatible con doble seguridad de Teltonika (funciona como respaldo si el equipo principal deja de trasmitir)', 1, 1, 0x313732373230363838315f436170747572612064652070616e74616c6c6120323032342d30392d3234203134343130342e706e67),
(63, 'RASTREADOR 4G LTE CAT1', 'GPS', 'Detección de Choques. Bluetooth para dispositivos externos y sensores BLE. Conducción verde, detección de exceso de velocidad, monitoreo de combustible GNSS.', 1, 1, 0x313732373230373233385f436170747572612064652070616e74616c6c6120323032342d30392d3234203134343731312e706e67),
(64, 'PROFESIONAL RASTREADOR VEHICULAR', 'GPS', 'Modelo: FMC130 Bloqueo Remoto Detección de Jammer Sensores Bluetooth', 1, 1, 0x313732373230373237355f436170747572612064652070616e74616c6c6120323032342d30392d3234203134343734372e706e67),
(65, 'RASTREADOR VEHICULAR GPS', 'GPS', 'Conexion por obdii Monitoreo de voz Detecta comportamientos de conducción inadecuados Giroscopio y algoritmo especial', 1, 1, 0x313732373230373330325f436170747572612064652070616e74616c6c6120323032342d30392d3234203134343831332e706e67),
(66, 'LOCALIZADOR 4G CON CARGA SOLAR', 'GPS', 'Batería de litio de larga duración Alerta por manipulación IP67 Diseñado para la gestión de vehículos y embarcaciones de construcción.', 1, 1, 0x313732373230373931325f436170747572612064652070616e74616c6c6120323032342d30392d3234203134353832342e706e67),
(67, 'RASTREADOR VEHICULAR 4G MAGNÉTICO', 'GPS', 'Magneto industrial Oculto en vehículo Monitoreo de voz Alerta por manipulación Programacion por cable y/o SMS', 1, 1, 0x313732373230373934315f436170747572612064652070616e74616c6c6120323032342d30392d3234203134353835332e706e67),
(68, 'MINI RASTREADOR PERSONAL', 'GPS', 'Resistencia al agua IP67. Botón SOS para emergencias. Contador de pasos. Llamadas de dos vias y espias', 1, 1, 0x313732373230373936395f436170747572612064652070616e74616c6c6120323032342d30392d3234203134353932332e706e67),
(69, 'AVANZADO RASTREADOR VEHICULAR', 'GPS', 'Con Conexión a Puerto Can Bus (vehículos pesados) Audio de 2 Vías (opcional) Antenas Incluidas Monitorización de Conductores Soporta cámaras, sensores de temperatura y combustible, lectores RFID/iButton, micrófonos y altavoces,', 1, 1, 0x313732373230383031395f436170747572612064652070616e74616c6c6120323032342d30392d3234203135303031312e706e67),
(70, 'RASTREADOR VEHICULAR', 'GPS', 'Ideal para Motocicletas y Vehiculos Todo Terreno con conectividad 2G y 4G Sensor de Bluetooth.', 1, 1, 0x313732373230383035325f436170747572612064652070616e74616c6c6120323032342d30392d3234203135303033392e706e67),
(71, 'AE-DC2018-K2', 'DASHCAM', 'Puerto USB para alimentación. (incluye adaptador para encendedor y cable) Incluye micrófono y altavoz integrados Incluye módulo G-Sensor incorporado.', 1, 1, 0x313732373230383039305f436170747572612064652070616e74616c6c6120323032342d30392d3234203135303131392e706e67),
(72, 'AE-DC5013-F6', 'DASHCAM', 'Memoria SD hasta de 128 GB (No incluida) Conector micro USB (3.4 metros de longitud) y adaptador para el cenicero (incluido). Incluye módulo Wi-Fi', 1, 1, 0x313732373230383239315f436170747572612064652070616e74616c6c6120323032342d30392d3234203135303434322e706e67),
(73, 'XMRDASHCAMADPLUS', 'DASHCAM', 'Medición de combustible Solución ADAS y DSM integrado Almacenamiento en memorias MicroSD Cuenta con 4G y GPS', 1, 1, 0x313732373230383331395f436170747572612064652070616e74616c6c6120323032342d30392d3234203135303531322e706e67),
(74, 'JC261', 'DASHCAM', 'Asistencia al Conductor (ADAS) Vigilancia por Video Monitoreo del Conductor (DMS) Grabación de Doble Canal', 1, 1, 0x313732373230383335375f436170747572612064652070616e74616c6c6120323032342d30392d3234203135303534382e706e67),
(75, 'SISTEMA INALÁMBRICO DE REVERSA CON CÁMARA INFRARROJA', 'CAMARA DE REVERSA', 'Sistema inalámbrico digital de 2,4 GH Capacidad de visualizar 4 cámaras a la vez Control de menú de pantalla táctil', 1, 1, 0x313732373230383432385f436170747572612064652070616e74616c6c6120323032342d30392d3234203135303730312e706e67),
(76, 'SISTEMA PROFESIONAL INALÁMBRICO DE CÁMARA DE REVERSA', 'CAMARA DE REVERSA', 'Monitor LCD en color de alta resolución de 7,0” El kit se puede ampliar hasta 4 cámaras (solo C2013B-WC).', 1, 1, 0x313732373230383435385f436170747572612064652070616e74616c6c6120323032342d30392d3234203135303733312e706e67),
(77, 'SISTEMA INALÁMBRICO DE REVERSA CON CÁMARA INFRARROJA , IMÁN Y MONITOR', 'CAMARA DE REVERSA', 'Sistema inalámbrico digital de 2,4 GHz Soporta hasta 4 cámaras Capacidad de protección de contraseña Cámara infrarroja CMOS 11 LED', 1, 1, 0x313732373230383631355f436170747572612064652070616e74616c6c6120323032342d30392d3234203135313030382e706e67),
(78, 'MAVIC3E', 'DRONES', 'Hasta 15 kms de transmisión Cámara gran angular de 48 MP. Zoom 56X Sensor CMOS de 1/2 Pulgada', 1, 1, 0x313732373230383635315f436170747572612064652070616e74616c6c6120323032342d30392d3234203135313034322e706e67),
(79, 'M30T', 'DRONES', 'Cámara RGB 45 MP 15 kms de transmisión Protección IP55 Sensor CMOS de 1 Pulgada', 1, 1, 0x313732373230383736315f436170747572612064652070616e74616c6c6120323032342d30392d3234203135313233322e706e67),
(80, 'MAVIC-2-ENT-ADV', 'DRONES', 'Camara Dual infraroja y visual 10 kms de transmisión Detección de obstáculos omnidireccional', 1, 1, 0x313732373230383832395f436170747572612064652070616e74616c6c6120323032342d30392d3234203135313334322e706e67),
(81, 'OUTPCAT5E100M', 'CATEGORIA 5E', '100 Metros Color Gris Uso Interior 4 Pares Soporta Pruebas de Rendimiento', 1, 1, 0x313732373231303039305f436170747572612064652070616e74616c6c6120323032342d30392d3234203135333433372e706e67),
(82, 'AE-DC5013-F6', 'CATEGORIA 5E', 'Memoria SD hasta de 128 GB (No incluida) Conector micro USB (3.4 metros de longitud) y adaptador para el cenicero (incluido). Incluye módulo Wi-Fi', 1, 1, 0x313732373231303338375f436170747572612064652070616e74616c6c6120323032342d30392d3234203135333933332e706e67),
(83, 'SBE-UTPC5ECU-GY', 'CATEGORIA 5E', 'Caja de 305 metros 100% cobre, color gris 4 pares, 24 AWG', 1, 1, 0x313732373231303432335f436170747572612064652070616e74616c6c6120323032342d30392d3234203135343031362e706e67),
(84, '1583A 008U1000', 'CATEGORIA 5E', '24 AWG 305 Metros 100% Cobre Color gris', 1, 1, 0x313732373231303538395f436170747572612064652070616e74616c6c6120323032342d30392d3234203135343330312e706e67),
(85, 'NUC5C04BU-C', 'CATEGORIA 5E', 'Caja de 305 metros Color azul 100% Cobre 4 pares 24 awg', 1, 1, 0x313732373231303633385f436170747572612064652070616e74616c6c6120323032342d30392d3234203135343334372e706e67);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `Id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(355) NOT NULL,
  `email_usuario` varchar(355) NOT NULL,
  `password_usuario` varchar(355) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`Id_usuario`, `nombre_usuario`, `email_usuario`, `password_usuario`) VALUES
(1, 'admin', 'tirmex@gmail.com', 'tirmex2024');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`Id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  MODIFY `Id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
