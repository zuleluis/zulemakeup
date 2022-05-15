INSERT INTO Marcas(nombre) VALUES
('Bissú'),
('Beauty Creations'),
('Maybelline'),
('Nyx Cosmetics'),
('BH Cosmetics'),
('Milani'),
('Garnier'),
('Nivea'),
('Morphe'),
('EOS'),
('City Makeup'),
('Republic Cosmetics'),
('Naturone'),
('Mary Kay'),
('Otros');

INSERT INTO Aplicacion(nombre) VALUES
('Rostro'),
('Labios'),
('Ojos'),
('Cabello'),
('Cuerpo');

INSERT INTO Tipos(nombre) VALUES
('Otros'),
('Base líquida'),
('Polvo compacto'),
('Polvo suelto'),
('Polvo translúcido'),
('Corrector'),
('Contornos'),
('Rubor'),
('Iluminador'),
('Primer'),
('Fijador de maquillaje'),
('Crema'),
('Labial líquido'),
('Labial en barra'),
('Gloss'),
('Bálsamo labial'),
('Exfoliante'),
('Primer ojos'),
('Delineador'),
('Máscara de pestañas'),
('Pegamento de pestañas'),
('Sombra individual'),
('Paleta de sombras pequeña'),
('Paleta de sombras mediana'),
('Paleta de sombras grande'),
('Glitter/Hojuelas'),
('Pestañas postizas'),
('Delineador de cejas'),
('Spray para cabello'),
('Protector de calor'),
('Acondicionador'),
('Iluminador de cuerpo'),
('Crema corporal'),
('Desmaquillante');

INSERT INTO Clientes(nombre, apPaterno, apMaterno, fechaNac, calle, numero, colonia, ciudad, numTel) VALUES
('Zulema Concepción', 'Luis', 'Cruz', '2000-11-01', 'Azucenas', 36, 'San Pedro','Loma Bonita, Oaxaca', '2294613993'),
('María Fernanda', 'García', 'Gordillo', '2000-05-22', 'Costa Dorada', 64, 'Fracc. Costa Verde', 'Veracruz, Veracruz', '2291112323'),
('María Kristen', 'Meneses', 'Ricardez', '2002-06-15', 'Bugambilias', 21, 'Floresta','Loma Bonita, Oaxaca', '2292223131'),
('Katia', 'Benítez', 'Ortiz', '2000-01-29', 'Francisco I. Madero', 12, 'Gayot','Loma Bonita, Oaxaca', '2293331212'),
('Luz Aymara', 'Soriano', 'Santiago', '2000-08-04', 'Domicilio Conocido', null , '','Mixtan, Loma Bonita, Oaxaca', '2294443232'),
('Jareth Michelle', 'Castillo', 'Castillo', '2000-11-15', 'Calle Uno', 106, 'Fracc. Puente Moreno','Medellín de Bravo, Veracruz', '2299991332'),
('Litzy', 'Valdiviezo', 'Cruz', '2000-05-28', 'Vicente Guerrero', 12, 'Centro','Loma Bonita, Oaxaca', '2296664545');

-- Profe no me mate por los precios T-T
INSERT INTO Servicios(nombreServicio, precio, descripcion) VALUES
('Maquillaje social', 200.00, 'Maquillaje de duración aprox 1:30 hrs. Incluye rostro, ojos, labios y pestañas'),
('Maquillaje nupcial', 250.00, 'Maquillaje de duración aprox 2:30 hrs. Rostro, ojos, labios y pestañas, depilación, prep. de piel'),
('Maquillaje XV años', 250.00, 'Maquillaje de duración aprox 2:30 hrs. Rostro, ojos, labios y pestañas, depilación, prep. de piel'),
('Maquillaje express', 100.00, 'Maquillaje de duración aprox 45 min. Trabajo ligero en rostro, ojos, labios y pestañas'),
('Depilación de cejas', 50.00, 'Depilación con pinzas o perfilador'),
('Gelish sobre uña natural', 100.00, 'Gelish de uno a dos tonos sólidos'),
('Alaciado de cabello express', 120.00, 'Alaciado de cabello con plancha, incluye protector de calor'),
('Servicio a domicilio', 80.00, 'A cualquier lugar dentro del municipio de Loma Bonita, Oaxaca'),
('Taxi', 35.00, 'A cualquier lugar dentro del municipio de LBO. Comodidad y seguridad'),
('Promocion', 0.0, 'Se aplicó una promoción');

INSERT INTO Promociones(nombrePromocion, precio, estado) VALUES
('Sin promoción', 0.0, true),
('Maquillaje nupcial/XV años + Prueba', 450.00, true),
('Maquillaje social + prueba', 350.00, true), 
('Alaciado express + gelish', 200.00, true),
('Gelish 2 x 1', 100.0, false),
('Alaciado express', 100.0, false),
('Maquillaje social + transporte', 250.00, false);

INSERT INTO Productos (fkMarca, nombreProducto, fkAplicacion, fkTipo, modelo, cantidad, agotado) VALUES
(1, 'Maquillaje Liquido Mate', 1, 2, 'Tono 10 Rompope', 3, false),
(1, 'Polvo translúcido', 1, 5, '', 1, false),
(4, 'HD Studio Photogenic', 1, 6, 'True Beige', 1, true),
(4, 'Labial mate Lip Lingerie', 2, 13, 'Cabaret Show', 1, false),
(4, 'Love You So Mochi', 3, 24, '', 1, true),
(2, 'Elsa', 3, 25, '', 1, false),
(2, 'Jasmine', 3, 25, '', 1, false),
(14, 'Pestañas postizas', 3, 27, '', 12, false);

INSERT INTO Citas(fkCliente, fecha, hora, tipoLugar, lugar, fkPromocion, importe, nota, borrar) VALUES
(1, '2022-04-27', '17:00:00', false, '', 1, 320.00, 'Pestañas postizas largas, maquillaje cargado', false),
(2, '2022-04-28', '17:00:00', false, '', 1, 200.00, 'Pestañas pequeñas', false),
(3, '2022-04-28', '19:00:00', false, '', 1, 200.00, 'Vestido rosa, accesorios dorados', false),
(4, '2022-04-28', '11:00:00', true, 'UNPA', 1, 200.00, 'Maquillaje de graduación', false),
(3, '2022-04-29', '16:00:00', false, '', 1, 50.00, 'Depilación con perfilador', false),
(2, '2022-04-29', '12:00:00', false, '', 1, 120.00, 'Cabello corto', false),
(6, '2022-04-30', '08:00:00', true, 'Casa Puente Moreno', 4, 200.00, 'Maquillaje con glitter', false);

INSERT INTO CitasServicios(fkCita, fkServicio) VALUES
(1, 1),
(1, 7),
(2, 1),
(3, 1),
(4, 1),
(5, 5),
(6, 7),
(7, 10);

INSERT INTO PromoServicios(fkPromocion, fkServicio) VALUES
(4, 6),
(4, 7),
(7, 1),
(7, 9);





