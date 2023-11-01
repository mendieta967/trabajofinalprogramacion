Algoritmo ventaPasajesAereos
	Definir opcionMenu,opcionMenu1, opcionMenu2, nombreBusqueda, apellidoBusqueda, nombreyapellidoBusqueda como texto
	Definir elegirVuelo, asientosTotales,ruta, asientosDisponibles1, asientosDisponibles2, asientosDisponibles3, asientosDisponibles4 como entero
	Definir i,j Como Entero
	Definir costoPasaje,costo, porcentajeVentasRuta1, porcentajeVentasRuta2, porcentajeVentasRuta3, porcentajeVentasRuta4 como real
	Definir validacion, valido, validarEquipaje, dniValido, telValido Como Logico
	
	//--- Rutas aéreas disponibles a la venta---
	Definir listaVuelos como texto
	Dimension listaVuelos[4,3]
	cargarVuelos(listaVuelos) 
	
	// ----- Lista de pasajeros con todos los datos -----
	Definir listaPasajeros como Texto
	Dimension listaPasajeros[400,8]
	
	//--- Inicializamos las variables ----
	validacion <- Falso
	asientosTotales = 0
	asientosDisponibles1 = 0
	asientosDisponibles2 = 0
	asientosDisponibles3 = 0
	asientosDisponibles4 = 0
	
	// -----Menu-----
	Escribir "--- BIENVENIDO AL SISTEMA DE VENTA DE PASAJES AEREOS ---"
	Repetir
		Escribir " "
		Escribir " Seleccione una opción para continuar o escriba SALIR."
		Escribir " 1. Venta pasaje."
		Escribir " 2. Buscar pasaje vendido."
		Escribir " 3. Buscar pasajero."
		Escribir " 4. Ordenar y mostrar lista pasajeros."
		Escribir " 5. Listado/s."
		Leer opcionMenu
		Escribir ""	
		opcionMenu = Mayusculas(opcionMenu)
		Segun opcionMenu Hacer
			"1":
				// ----- VENTA DE PASAJE -----
				
				Escribir " Ingrese la ruta aerea"
				Repetir
				Escribir  " "
				Escribir " 1. ", listaVuelos[0,0]  // Buenos Aires - Bariloche
				Escribir " 2. ", listaVuelos[1,0]  // Buenos Aires - Salta
				Escribir " 3. ", listaVuelos[2,0]  // Rosario - Buenos Aires
				Escribir " 4. ", listaVuelos[3,0]  // Mar Del Plata - Mendoza
				Escribir  " "
				Leer elegirVuelo
				
				Segun elegirVuelo Hacer
					1:
						//Venta de pasajes Buenos Aires - Bariloche
						asientosTotales <- asientosTotales + 1
						asientosDisponibles1 <- asientosDisponibles1 + 1 
						valido = validarPlaza(asientosDisponibles1, listaVuelos[0,1]) // Sumamos la plaza y la validamos
						Si valido = Verdadero Entonces
							escribir "Plaza disponible."
							costo = costoPasaje1(asientosDisponibles1, listaVuelos[0,2], elegirVuelo)// Generamos el costo del pasaje
							cargarPasajeros(listaVuelos[0,0], costo,asientosDisponibles1,listaPasajeros,asientosTotales )// Cargamos los datos del pasajero y mostramos RESUMEN
						SiNo
							Escribir "No hay asientos disponibles."
						Fin Si	
					2:
						//Venta de pasajes Buenos Aires - Salta
						asientosTotales <- asientosTotales + 1
						asientosDisponibles2 <- asientosDisponibles2 + 1
						valido = validarPlaza(asientosDisponibles2, listaVuelos[1,1]) // Sumamos la plaza y la validamos
						
						Si valido = Verdadero Entonces
							escribir "Plaza disponible."
							costo = costoPasaje1(asientosDisponibles2, listaVuelos[1,2], elegirVuelo) // Generamos el costo del pasaje
							cargarPasajeros(listaVuelos[1,0],costo,asientosDisponibles2, listaPasajeros,asientosTotales)// Cargamos los datos del pasajero y mostramos RESUMEN
						SiNo
							Escribir "No hay asientos disponibles."
						Fin Si
					3:
						//Venta de pasajes Rosario - Buenos Aires
						asientosTotales <- asientosTotales + 1
						asientosDisponibles3 <- asientosDisponibles3 + 1
						valido = validarPlaza(asientosDisponibles3, listaVuelos[2,1]) // Sumamos la plaza y la validamos
						Si valido = Verdadero Entonces
							escribir "Plaza disponible."
							costo = costoPasaje1(asientosDisponibles3, listaVuelos[2,2], elegirVuelo) // Generamos el costo del pasaje
							cargarPasajeros(listaVuelos[2,0],costo,asientosDisponibles3,listaPasajeros,asientosTotales)// Cargamos los datos del pasajero y mostramos RESUMEN
						SiNo
							Escribir "No hay asientos disponibles."
						Fin Si
					4:
						//Venta de pasajes Mar Del Plata - Mendoza
						asientosTotales <- asientosTotales + 1
						asientosDisponibles4 <- asientosDisponibles4 + 1
						valido = validarPlaza(asientosDisponibles4, listaVuelos[3,1]) // Sumamos la plaza y la validamos
						Si valido = Verdadero Entonces
							escribir "Plaza disponible."
							costo = costoPasaje1(asientosDisponibles4, listaVuelos[3,2], elegirVuelo)// Generamos el costo del pasaje
							cargarPasajeros(listaVuelos[3,0],costo,asientosDisponibles4,listaPasajeros,asientosTotales)// Cargamos los datos del pasajero y mostramos RESUMEN
						SiNo
							Escribir "No hay asientos disponibles."
						Fin Si
					De Otro Modo:
						Escribir "Opcion incorrecta, vuelva a intentarlo"
				Fin Segun
			Hasta Que elegirVuelo = 1 o elegirVuelo = 2 o elegirVuelo = 3 o elegirVuelo = 4
			// ----- FIN VENTA DE PASAJE -----
			"2":
			// ----- BUSCAR PASAJE VENDIDO POR ASIENTO -----
			Repetir
				Escribir "Ingrese el vuelo que desea buscar"
				Escribir "1. ", listaVuelos[0,0] // Buenos Aires - Bariloche
				Escribir "2. ", listaVuelos[1,0] // Buenos Aires - Salta
				Escribir "3. ", listaVuelos[2,0] // Rosario - Buenos Aires
				Escribir "4. ", listaVuelos[3,0] // Mar Del Plata - Mendoza
				Leer elegirVuelo
				
				Segun elegirVuelo Hacer
					1:
						// Buscar en la ruta Buenos Aires - Bariloche
						buscarPasajerosAsiento(listaPasajeros,elegirVuelo,asientosTotales,asientosDisponibles1)
					2:
						// Buscar en la ruta Buenos Aires - Salta
						buscarPasajerosAsiento(listaPasajeros,elegirVuelo,asientosTotales,asientosDisponibles2)
					3:
						// Buscar en la ruta Rosario - Buenos Aires
						buscarPasajerosAsiento(listaPasajeros,elegirVuelo,asientosTotales,asientosDisponibles3)
					4: 
						// Buscar en la ruta Mar Del Plata - Mendoza
						buscarPasajerosAsiento(listaPasajeros,elegirVuelo,asientosTotales,asientosDisponibles3)
					De Otro Modo:
						escribir "Opción incorrecta, vuelva intentarlo"
				Fin Segun
			Hasta Que elegirVuelo = 1 O elegirVuelo = 2 O elegirVuelo = 3 O elegirVuelo = 4
			// ----- FIN BUSCAR PASAJE VENDIDO POR ASIENTO -----
		"3": 
			// ----- BUSCAR PASAJE VENDIDO POR NOMBRE Y APELLIDO -----
			Escribir "Ingrese el nombre del pasejero que desea buscar"
			Leer nombreBusqueda
			Escribir "Ingrese el apellido del pasajero"
			Leer apellidoBusqueda
			nombreyapellidoBusqueda = Concatenar(nombreBusqueda," ")
			nombreyapellidoBusqueda = Concatenar(nombreyapellidoBusqueda, apellidoBusqueda)
			buscarpasajeroNombre(listaPasajeros, asientosTotales, nombreyapellidoBusqueda)
		
			// ----- FIN BUSCAR PASAJE VENDIDO POR NOMBRE Y APELLIDO -----
		"4":
			// ----- ORDENAR PASAJE POR ASIENTO -----
			Repetir
			Escribir "a. Ordenar por número de asiento ascendente"
			Escribir "b. Ordenar por número de asiento descendenteo"
			Leer opcionMenu1
			opcionMenu1 = Mayusculas(opcionMenu1)
			Si opcionMenu1 <> "A" y opcionMenu1 <> "B" Entonces
				Escribir "La opcion ingresada no es correcta, vuelva a intentarlo"
			Fin si
		Mientras Que opcionMenu1 <> "A" Y opcionMenu1 <> "B"
		Repetir
			Escribir "Ingrese el vuelo que desea ordenar"
			Escribir "1. ", listaVuelos[0,0] // Buenos Aires - Bariloche
			Escribir "2. ", listaVuelos[1,0] // Buenos Aires - Salta
			Escribir "3. ", listaVuelos[2,0] // Rosario - Buenos Aires
			Escribir "4. ", listaVuelos[3,0] // Mar Del Plata - Mendoza
			Leer elegirVuelo
			Segun elegirVuelo Hacer
				1:
					// Ordenar Buenos Aires - Bariloche
					ordenarPORasiento(listaPasajeros, elegirVuelo, asientosTotales, plazasDisponibles1, opcionMenu1)
				2:
					// Ordenar Buenos Aires - Salta
					ordenarPORasiento(listaPasajeros, elegirVuelo, asientosTotales, plazasDisponibles2, opcionMenu1)
				3:
					// Ordenar Rosario - Buenos Aires
					ordenarPORasiento(listaPasajeros, elegirVuelo, asientosTotales, plazasDisponibles3, opcionMenu1)
				4:
					// Ordenar Mar Del Plata - Mendoza
					ordenarPORasiento(listaPasajeros, elegirVuelo, asientosTotales, plazasDisponibles4, opcionMenu1)
				De Otro Modo:
					Escribir "Error, vuelva a intentarlo"
			Fin Segun
			
		Hasta Que elegirVuelo = 1 O elegirVuelo = 2 O elegirVuelo = 3 O elegirVuelo = 4
			// ----- FIN ORDENAR PASAJE POR ASIENTO -----
		"5":
			// ----- LISTADO -----
			Repetir
				Escribir "a. Cantidad de pasajes vendido por ruta aérea."
				Escribir "b. Porcentaje de ventas por ruta aérea."
				Leer opcionMenu2
				opcionMenu2 = Mayusculas(opcionMenu2)
				Segun opcionMenu2 Hacer
					"A": 
						Escribir "Cantidad de pasajes vendido en ruta 1:  " ,  asientosDisponibles1
						Escribir "Cantidad de pasajes vendido en ruta 2:  " ,  asientosDisponibles2
						Escribir "Cantidad de pasajes vendido en ruta 3:  " ,  asientosDisponibles3
						Escribir "Cantidad de pasajes vendido en ruta 4:  " ,  asientosDisponibles4
					"B":
						porcentajeVentasRuta1 = (asientosDisponibles1/120) * 100;
						Escribir "El porcentaje de ventas de la ruta ",listaVuelos[0,0]," es: " , porcentajeVentasRuta1 "%"
						porcentajeVentasRuta2 = (asientosDisponibles2/120) * 100;
						Escribir "El porcentaje de ventas de la ruta ",listaVuelos[1,0]," es: " , porcentajeVentasRuta2 "%"
						porcentajeVentasRuta3 = (asientosDisponibles3/80) * 100;
						Escribir "El porcentaje de ventas de la ruta ",listaVuelos[2,0]," es: " , porcentajeVentasRuta3 "%"
						porcentajeVentasRuta4 = (asientosDisponibles4/80) * 100;
						Escribir "El porcentaje de ventas de la ruta ",listaVuelos[3,0]," es: " , porcentajeVentasRuta4 "%"
					De Otro Modo:
						Escribir "Opción inválida."
				Fin Segun
			Mientras Que opcionMenu2 <> "A" Y opcionMenu2 <> "B"
			
			// ----- FIN LISTADO -----
		"SALIR": 
			Escribir "Saliendo..."
		De Otro Modo:
			Escribir "Opción inválida."
	Fin Segun
Mientras Que opcionMenu <> "SALIR"
FinAlgoritmo
// ----- FIN MENU -----

// ----- FUNCIONES Y SUBPROCESOS: -----

// ----- CARGA DE VUELOS -----
SubProceso cargarVuelos(listaVuelos) //Ruta - Plazas Disponibles - Precio
	listaVuelos[0,0] = "Buenos Aires - Bariloche"	
	listaVuelos[0,1] = "120"
	listaVuelos[0,2] = "150000"
	
	listaVuelos[1,0] = "Buenos Aires - Salta"
	listaVuelos[1,1] = "120"
	listaVuelos[1,2] = "120000"
	
	listaVuelos[2,0] = "Rosario - Bariloche"
	listaVuelos[2,1] = "80"
	listaVuelos[2,2] = "70000"
	
	listaVuelos[3,0] = "Mar Del Plata - Mendoza"
	listaVuelos[3,1] = "80"
	listaVuelos[3,2] = "95000"
FinSubProceso

//cargamos los pasajeros

SubProceso cargarPasajeros(vuelo,costo,asientoNro, lista, asientosTotales)
	definir nombrePasajero, apellidoPasajero, telPasajero, dniPasajero, validarEquipaje, resumenPasajero Como texto
	Definir numpasajeroFrecuente, nombreYApellido,costoPasajero,numPasajero,asiento como texto
	Definir cadenaValido, telValido, dniValido Como Logico
	Definir costoFinal Como Real
	costoFinal=costo
	
//Cargamos nombre y apellido
	
	Repetir
	Escribir "Ingrese su nombre"
	Leer nombrePasajero
	cadenaValido <- validarCadena(nombrePasajero)
	si cadenaValido == Falso Entonces
		Escribir "Nombre invalido"
	FinSi
Mientras Que cadenaValido == Falso

Repetir
	Escribir "Ingresar apellido del pasajero."
	Leer apellidoPasajero
	cadenaValido <- validarCadena(apellidoPasajero)
	Si cadenaValido == Falso Entonces
		Escribir "Apellido invalido"
	Fin Si
Mientras Que cadenaValido == Falso

nombreYApellido = Concatenar(nombrePasajero," ")
nombreYApellido = Concatenar(nombreYApellido, apellidoPasajero)

// Cargamos el numero de documento
Repetir
	Escribir "Ingrese su numero de documento"
	Leer dniPasajero
	dniValido <- validarDni (dniPasajero)
Hasta Que dniValido == Verdadero	

//Cargamos el numero de telefono
Repetir
	Escribir "Ingrese su numero de telefono. (Indicar codigo de area (+))"
	Leer telPasajero
	telValido <- validarTelefono(telPasajero) //Validamos el numero del  telefono
Hasta Que telValido == Verdadero

//Cargamos el equipaje
Repetir
	Escribir "lleva equipaje en la bodega? ingrese (V/F)"
	Leer validarEquipaje
	validarEquipaje <- Mayusculas(validarEquipaje)
Mientras Que validarEquipaje <> "F" Y validarEquipaje <> "V"
Si validarEquipaje == "V" Entonces
	costoFinal <- costoFinal + (costoFinal * 0.05) //costo adicional del equipaje en la bodega
	validarEquipaje <- "Verdadero"
SiNo
	validarEquipaje <- "Falso" 
Fin Si

//Cargamos el numero de pasajero frecuente
Repetir
	Escribir "Ingrese el numero de pasajero frecuente. (4 digitos)"
	Leer numpasajeroFrecuente
Mientras Que Longitud(numpasajeroFrecuente) <> 4


// ----- Carga del ASIENTO -----
asiento = ConvertirATexto(asientoNro) // Se utiliza la plaza disponible para asignar el asiento

costoPasajero=ConvertirATexto(costoFinal)

// Cargamos los datos al array	
lista[asientosTotales - 1,0] = vuelo
lista[asientosTotales - 1,1] = nombreYApellido
lista[asientosTotales - 1,2] = dniPasajero
lista[asientosTotales - 1,3] = telPasajero
lista[asientosTotales - 1,4] = validarEquipaje
lista[asientosTotales - 1,5] = numPasajero
lista[asientosTotales - 1,6] = asiento
lista[asientosTotales - 1,7] = costoPasajero

// ----- RESUMEN -----
Escribir ""
Escribir "========== RESUMEN =========="
Escribir "Ruta: ", vuelo
Escribir "Nombre y Apellido: ", nombreYApellido
Escribir "DNI: ", dniPasajero
Escribir "Teléfono: ", telPasajero
Escribir "Equipaje en bodega: ", validarEquipaje
Escribir "Número pasajero frecuente: ", numpasajeroFrecuente
Escribir "Asiento: ", asiento
Escribir "Costo pasaje: $", costoFinal
Escribir "============================="

FinSubProceso
// ----- FIN CARGA DE VUELOS -----


// ----- Validamos las plazas-----
Funcion validacion <- validarPlaza (datos, vuelo)
	Definir validacion Como Logico
	si datos < ConvertirANumero(vuelo) Entonces
		validacion <- Verdadero
	SiNo
		validacion <- Falso
	FinSi
FinFuncion
// ----- FIN VALIDAR PLAZA -----
// ----- VALIDAR (NOMBRE Y APELLIDO) -----
Funcion cadenaValido <- validarCadena(cadna)
	Definir i Como Entero
	Definir cadenaValido Como Logico
	Definir caracterCadena Como Caracter
	
	cadenaValido = Verdadero
	
	Para i=0 Hasta Longitud(cadna) Hacer
		caracterCadena = SubCadena(cadna, i, i)
		Si caracterCadena == "0" O caracterCadena == "1" O caracterCadena == "2" O caracterCadena == "3" O caracterCadena == "4" O caracterCadena == "5" O caracterCadena == "6" O caracterCadena == "7" O caracterCadena == "8" O caracterCadena == "9" Entonces
			cadenaValido = Falso
		Fin Si
	Fin Para
FinFuncion
// ----- FIN VALIDAR  (NOMBRE Y APELLIDO) -----

// ---- Validamos nro de documento ----
Funcion dniValido <-  validarDni(dni)
	Definir dniValido como logico
	Definir contador, i como entero
	
	si Longitud(dni) < 9 y longitud(dni) > 6 entonces
		Para i <- 1 Hasta Longitud(dni) Con Paso 1 Hacer
			Si Subcadena(dni, i, i) = "0" O Subcadena(dni, i, i) = "1" O Subcadena(dni, i, i) = "2" O Subcadena(dni, i, i) = "3" O Subcadena(dni, i, i) = "4" O Subcadena(dni, i, i) = "5" O Subcadena(dni, i, i) = "6" O Subcadena(dni, i, i) = "7" O Subcadena(dni, i, i) = "8" O Subcadena(dni, i, i) = "9" Entonces
				contador = contador + 1
			FinSi
		Fin Para	
		Si contador < 9 Y contador > 6 Entonces
			Escribir "DNI valido."
			dniValido = Verdadero
		SiNo
			Escribir "DNI inválido."
			dniValido = Falso
		FinSi
	SiNo
		Escribir "DNI inválido."
		dniValido = Falso
	FinSi
FinFuncion
// ----- FIN VALIDAR DNI -----

// ---- Validamos el telefono ----
Funcion telValido <- validarTelefono(telefono)
	Definir telValido Como Logico
	Definir contador, i Como Entero
	Definir prefijo como Texto
	prefijo = Subcadena(telefono, 0, 0)
	contador = 0
	
	Si Longitud(telefono) >= 10 Y prefijo == "+" Entonces
		definir digito como texto
		
		Para i <- 1 Hasta Longitud(telefono) Con Paso 1 Hacer
			digito=Subcadena(telefono,i,i)
			Si digito <> "0" y digito <> "1" y digito <> "2" y digito <> "3" y digito <> "4" y digito <> "5" y digito <> "6" y digito <> "7" y digito <> "8" y digito <> "9" y digito <>"+" Entonces
				contador = contador - 1
			SiNo
				contador=contador+1
			FinSi
		Fin Para
		
		Si contador > 10 y contador < 14 Entonces
			Escribir "Teléfono valido."
			telValido = Verdadero
		SiNo
			Escribir "Teléfono inválido."
			telValido = Falso
		FinSi
	SiNo
		Escribir "Teléfono inválido."
		telValido = Falso
	FinSi
FinFuncion
// ----- FIN VALIDAR TELÉFONO -----

// ---- Generamos el costo de la venta ----
Funcion costoFinal <- costoPasaje1(dato,precio,menu)
	Definir costoFinal como real
	costoFinal = ConvertirANumero(precio)
	Segun menu Hacer
		1:
			Si dato > 20 Y dato <= 60 Entonces
				costoFinal = costoFinal + (costoFinal * 0.10)
			SiNo
				Si dato > 60 Entonces
					costoFinal = 180000
				Fin Si
			Fin Si
		2:
			Si dato > 20 Y dato <= 60 Entonces
				costoFinal = costoFinal + (costoFinal * 0.10)
			SiNo
				Si dato > 60 Entonces
					costoFinal = 150000
				Fin Si
			Fin Si
		3:
			Si dato > 10 Y dato <= 40 Entonces
				costoFinal = costoFinal + (costoFinal * 0.15)
			SiNo
				Si dato > 40 Entonces
					costoFinal = 95000
				Fin Si
			Fin Si
		4:
			Si dato > 10 Y dato <= 40 Entonces
				costoFinal = costoFinal + (costoFinal * 0.15)
			SiNo
				Si dato > 40 Entonces
					costoFinal = 125000
				Fin Si
			Fin Si
	Fin Segun
FinFuncion
// ----- FIN GENERAR COSTO DE LA VENTA -----

// ----- BUSCAR PASAJERO POR ASIENTO -----
SubProceso buscarPasajerosAsiento(listaPasajeros,ruta,asientosTotales,asientosDisponibles)
	Definir asiento,i,j Como Entero
	Definir encontrado Como Logico
	Definir array como texto
	
	encontrado <- Falso
	// Creacion de un nuevo array para guardar los datos del vuelo a buscar
	
	Si asientosDisponibles <= 0 Entonces
		Escribir "Nos hay pasajes vendidos en esta ruta"
	SiNo
		// Creo array del tamaño de las plazas disponibles segun la ruta seleccionada
		Dimension array[asientosDisponibles,8]
		Segun ruta Hacer
			1:
				Para i=0 Hasta asientosTotales - 1 Hacer
					Para j=0 Hasta 7 Con Paso 1 Hacer
						Si listaPasajeros[i,0] == "Buenos Aires - Bariloche" Entonces
							array[i,j] = listaPasajeros[i,j]
						Fin Si
					Fin Para
				Fin Para
			2:
				Para i=0 Hasta asientosTotales - 1 Hacer
					Para j=0 Hasta 7 Con Paso 1 Hacer
						Si listaPasajeros[i,0] == " Bueno Aires - Salta" Entonces
							array[i,j] = listaPasajeros[i,j]
						Fin Si
					Fin Para
				Fin Para
			3:
				Para i=0 Hasta asientosTotales - 1 Hacer
					Para j=0 Hasta 7 Con Paso 1 Hacer
						Si listaPasajeros[i,0] == "Rosario - Buenos Aires" Entonces
							array[i,j] = listaPasajeros[i,j]
						Fin Si
					Fin Para
				Fin Para
			4:
				Para i=0 Hasta asientos - 1 Hacer
					Para j=0 Hasta 7 Con Paso 1 Hacer
						Si listaPasajeros[i,0] == "Mar Del Plata - Mendoza" Entonces
							array[i,j] = listaPasajeros[i,j]
						Fin Si
					Fin Para
				Fin Para
		Fin Segun
		// Busqueda
		Escribir "Ingrese el asiento del pasajero a buscar:"
		Leer asiento
		i=0
		
		Mientras i < asientosDisponibles Hacer
			Si array[i,6] == ConvertirATexto(asiento) Entonces
				Escribir "============================="
				Escribir "Nombre y Apellido: ", array[i,1]
				Escribir "Ruta: ", array[i,0]
				Escribir "DNI: ", array[i,2]
				Escribir "============================="
				encontrado = Verdadero
				i = plazasDisponibles
			Fin Si
			i = i + 1
		Fin Mientras
		
		Si encontrado = Falso Entonces
			Escribir "Asiento no encontrado."
		Fin Si
	Fin Si
FinSubProceso
// ----- FIN BUSCAR PASAJERO POR ASIENTO -----

//-----BUSCAR PASAJERO POR NOMBRE Y APELLIDO ------
SubProceso buscarpasajeroNombre(lista, asientosTotales, nombreyapellido)
	definir i Como Entero
	definir encontrado Como Logico
	encontrado = Falso
	i = 0
	
	Mientras i < asientosTotales Hacer
		Si Mayusculas(nombreyapellido) == Mayusculas(lista[i,1]) Entonces
			Escribir "Nombre y Apellido: ", lista[i,1]
			Escribir "Ruta: ", lista[i,0]
			Escribir "DNI: ", lista[i,2]
			encontrado = Verdadero
			i = asientosTotales
		Fin Si
		i = i + 1
	Fin Mientras
	Si encontrado = Falso Entonces
		Escribir "Persona no encontrada"
	Fin Si
FinSubProceso
// ----- FIN BUSCAR PASAJERO POR NOMBRE Y APELLIDO -----
// ----- ORDENAR POR ASIENTO -----
SubProceso ordenarPORasiento(listaPasajeros, ruta, asientosTotales, asientosDisponibles, ordenarPor)
	Definir array como Texto
	Definir i, j Como Entero
	Definir auxNombre, AuxDni, auxTel, auxEquipaje, auxNumPasajero, auxAsiento, auxCosto Como Caracter
	Definir posMenor Como Entero
	
// Creacion de un nuevo array para guardar los datos del vuelo a ordenar
	
	Si asientosDisponibles <= 0 Entonces
		Escribir "No hay pasajes vendidos en esta ruta."
	SiNo
		Dimension array[asientosDisponibles, 8]
		Segun ruta Hacer
			1:
				Para i=0 Hasta asientosTotales - 1 Hacer
					Para j=0 Hasta 7 Con Paso 1 Hacer
						Si listaPasajeros[i,0] == "Buenos Aires - Bariloche" Entonces
							array[i,j] = listaPasajeros[i,j]
						Fin Si
					Fin Para
				Fin Para
			2:
				Para i=0 Hasta asientosTotales - 1 Hacer
					Para j=0 Hasta 7 Con Paso 1 Hacer
						Si listaPasajeros[i,0] == " Bueno Aires - Salta" Entonces
							array[i,j] = listaPasajeros[i,j]
						Fin Si
					Fin Para
				Fin Para
			3:
				Para i=0 Hasta asientosTotales - 1 Hacer
					Para j=0 Hasta 7 Con Paso 1 Hacer
						Si listaPasajeros[i,0] == "Rosario - Buenos Aires" Entonces
							array[i,j] = listaPasajeros[i,j]
						Fin Si
					Fin Para
				Fin Para
			4:
				Para i=0 Hasta asientosTotales-1 Hacer
					Para j=0 Hasta 7 Con Paso 1 Hacer
						Si listaPasajeros[i,0] == "Mar Del Plata - Mendoza" Entonces
							array[i,j] = listaPasajeros[i,j]
						Fin Si
					Fin Para
				Fin Para
		Fin Segun
		
		// ORDENAMIENTO
		
		Si ordenarpor == "A" Entonces
			// ORDEN ASCENDENTE
			Para i <- 0 Hasta asientosDisponibles - 2
				posMenor = i
				Para j <- i+1 Hasta asientosDisponibles - 1
					Si array[posMenor,6] > array[j,6] Entonces
						posMenor = j
					Fin Si
				Fin Para
				
				auxNombre = array[i, 1]
				AuxDni = array[i, 2]
				auxTel = array[i, 3]
				auxEquipaje = array[i, 4]
				auxNumPasajero = array[i, 5]
				auxAsiento = array[i, 6]
				auxCosto = array[i, 7]
				array[i, 1] = array[posMenor, 1]
				array[i, 2] = array[posMenor, 2]
				array[i, 3] = array[posMenor, 3]
				array[i, 4] = array[posMenor, 4]
				array[i, 5] = array[posMenor, 5]
				array[i, 6] = array[posMenor, 6]
				array[i, 7] = array[posMenor, 7]
				
				array[posMenor, 1] = auxNombre
				array[posMenor, 2] = AuxDni
				array[posMenor, 3] = auxTel
				array[posMenor, 4] = auxEquipaje
				array[posMenor, 5] = auxNumPasajero
				array[posMenor, 6] = auxAsiento
				array[posMenor, 7] = auxCosto
			FinPara
		SiNo
			// ORDEN DESCENDENTE
			Para i <- 0 Hasta AsientosDisponibles - 2 
				posMenor = i
				Para j <- i+1 Hasta asientosDisponibles - 1
					Si array[posMenor,6] < array[j,6] Entonces
						posMenor = j
					Fin Si
				Fin Para
				auxNombre = array[i, 1]
				AuxDni = array[i, 2]
				auxTel = array[i, 3]
				auxEquipaje = array[i, 4]
				auxNumPasajero = array[i, 5]
				auxAsiento = array[i, 6]
				auxCosto = array[i, 7]
				
				array[i, 1] = array[posMenor, 1]
				array[i, 2] = array[posMenor, 2]
				array[i, 3] = array[posMenor, 3]
				array[i, 4] = array[posMenor, 4]
				array[i, 5] = array[posMenor, 5]
				array[i, 6] = array[posMenor, 6]
				array[i, 7] = array[posMenor, 7]
				
				array[posMenor, 1] = auxNombre
				array[posMenor, 2] = AuxDni
				array[posMenor, 3] = auxTel
				array[posMenor, 4] = auxEquipaje
				array[posMenor, 5] = auxNumPasajero
				array[posMenor, 6] = auxAsiento
				array[posMenor, 7] = auxCosto
			FinPara
		Fin Si
		
		// Mostrando la lista ordenada
		Escribir ""
		Para i=0 Hasta AsientosDisponibles - 1 Hacer
			Para j=0 Hasta 7 Con Paso 1 Hacer
				Escribir Sin Saltar array[i, j], " | "
			Fin Para
			Escribir ""
		Fin Para
		Escribir ""
	Fin Si
FinSubProceso
// ----- FIN ORDENAR POR ASIENTO -----