Algoritmo ventaPasajesAereos
	Definir opcionMenu,  listaVuelos Como Caracter
	Definir elegirVuelo, asientosTotales, asientosDisponibles1, asientosDisponibles2, asientosDisponibles3, asientosDisponibles4 como entero
	Definir costo como real
	Definir valido Como Logico
	
	//--- Rutas aéreas disponibles a la venta---
	Dimension listaVuelos[4,3]
	cargarVuelos(listaVuelos) 
	
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
						asientosDisponibles1 <- asientosDisponibles + 1 
						valido = validarPlaza(plazasDsiponibles1, listaVuelos[0,1]) // Sumamos la plaza y la validamos
						Si valido = Verdadero Entonces
							escribir "Plaza disponible."
							cargarPasajeros(listaVuelos[0,0])
						SiNo
							Escribir "No hay asientos disponibles."
						Fin Si
					2:
						//Venta de pasajes Buenos Aires - Salta
						asientosTotales <- asientosTotales + 1
						asientosDisponibles2 <- asientosDisponibles + 1
						valido = validarPlaza(plazasDsiponibles1, listaVuelos[1,1]) // Sumamos la plaza y la validamos
						Si valido = Verdadero Entonces
							escribir "Plaza disponible."
							cargarPasajeros(listaVuelos[1,0])
						SiNo
							Escribir "No hay asientos disponibles."
						Fin Si
					3:
						//Venta de pasajes Rosario - Buenos Aires
						asientosTotales <- asientosTotales + 1
						asientosDisponibles3 <- asientosDisponibles + 1
						valido = validarPlaza(plazasDsiponibles1, listaVuelos[2,1]) // Sumamos la plaza y la validamos
						Si valido = Verdadero Entonces
							escribir "Plaza disponible."
							cargarPasajeros(listaVuelos[2,0])
						SiNo
							Escribir "No hay asientos disponibles."
						Fin Si
					4:
						//Venta de pasajes Mar Del Plata - Mendoza
						asientosTotales <- asientosTotales + 1
						asientosDisponibles4 <- asientosDisponibles + 1
						valido = validarPlaza(plazasDsiponibles1, listaVuelos[3,1]) // Sumamos la plaza y la validamos
						Si valido = Verdadero Entonces
							escribir "Plaza disponible."
							cargarPasajeros(listaVuelos[3,0])
						SiNo
							Escribir "No hay asientos disponibles."
						Fin Si
					De Otro Modo:
						Escribir "Opcion incorrecta, vuelva a intentarlo"
				Fin Segun
			Hasta Que elegirVuelo = 1 o elegirVuelo = 2 o elegirVuelo = 3 o elegirVuelo = 4
			// ----- FIN VENTA DE PASAJE -----
		Fin Segun
FinAlgoritmo


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

SubProceso cargarPasajeros(costo)
	definir nombrePasajero, apellidoPasajero, telPasajero, dniPasajero, validarEquipaje Como texto
	Definir numpasajeroFrecuente como texto
	Definir cadenaValido, telValido, dniValido Como Logico
	Definir costoFinal Como Real
	
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



// ----- Validamos las plazas-----
Funcion validacion <- validarPlaza (datos, vuelo)
	Definir validacion Como Logico
	si datos < ConvertirANumero(vuelo) Entonces
		validacion <- Verdadero
	SiNo
		validacion <- Falso
	FinSi
FinFuncion

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