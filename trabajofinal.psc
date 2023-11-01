Algoritmo ventaPasajesAereos
	Definir opcionMenu,  listaVuelos Como Caracter
	Definir elegirVuelo, asientosTotales,ruta, asientosDisponibles1, asientosDisponibles2, asientosDisponibles3, asientosDisponibles4 como entero
	Definir costo como real
	Definir listaPasajeros como Texto
	Definir valido Como Logico
	
	//--- Rutas aéreas disponibles a la venta---
	Dimension listaVuelos[4,3]
	cargarVuelos(listaVuelos) 
	
	// ----- Lista de pasajeros con todos los datos -----
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
		Escribir " "
		Escribir " Seleccione una opción para continuar."
		Escribir " 1. Venta pasaje."
		Escribir " 2. Buscar pasaje vendido."
		Escribir " 3. Buscar pasajero."
		Escribir " 4. Ordenar y mostrar lista pasajeros."
		Escribir " 5. Listado/s."
		Escribir " 6. Salir"
		Leer opcionMenu
		Escribir ""	
		
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
							cargarPasajeros(listaVuelos[2,0],costo,asientosDisponibles3,elegirPasajeros,asientosTotales)// Cargamos los datos del pasajero y mostramos RESUMEN
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
							cargarPasajeros(listaVuelos[3,0],costo,asientosDisponibles4,elegirPasajeros,asientosTotales)// Cargamos los datos del pasajero y mostramos RESUMEN
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
			Hasta Que eleccionVuelo = 1 O eleccionVuelo = 2 O eleccionVuelo = 3 O eleccionVuelo = 4
			// ----- FIN BUSCAR PASAJE VENDIDO POR ASIENTO -----
		"3": 
			// ----- BUSCAR PASAJE VENDIDO POR NOMBRE Y APELLIDO -----
			// ----- FIN BUSCAR PASAJE VENDIDO POR NOMBRE Y APELLIDO -----
		"4":
			// ----- ORDENAR PASAJE POR ASIENTO -----
			// ----- FIN ORDENAR PASAJE POR ASIENTO -----
		"5":
			// ----- LISTADO -----
			// ----- FIN LISTADO -----
		Fin Segun
FinAlgoritmo

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

SubProceso cargarPasajeros(costo,costo,asientoNro, lista, asientosTotales)
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
asiento = ConvertirATexto(plazaNro) // Se utiliza la plaza disponible para asignar el asiento

costoPasajero=ConvertirATexto(costoFinal)

// Cargamos los datos al array	
lista[plazasTotales-1,0] = vuelo
lista[plazasTotales-1,1] = nombreYApellido
lista[plazasTotales-1,2] = dniPasajero
lista[plazasTotales-1,3] = telPasajero
lista[plazasTotales-1,4] = validarEquipaje
lista[plazasTotales-1,5] = numPasajero
lista[plazasTotales-1,6] = asiento
lista[plazasTotales-1,7] = costoPasajero

// ----- RESUMEN -----
Escribir ""
Escribir "========== RESUMEN =========="
Escribir "Ruta: ", vuelo
Escribir "Nombre y Apellido: ", nombreYApellido
Escribir "DNI: ", dniPasajero
Escribir "Teléfono: ", telPasajero
Escribir "Equipaje en bodega: ", validarEquipaje
Escribir "Número pasajero frecuente: ", numpasajeroFrecuente
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
	FinSi
FinSubProceso
// ----- FIN BUSCAR PASAJERO POR ASIENTO -----