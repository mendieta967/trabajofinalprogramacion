Algoritmo ventaPasajesAereos
	Definir opcionMenu, listaVuelos Como Caracter
	Definir elegirVuelo, asientosTotales, asientosDisponibles1, asientosDisponibles2, asientosDisponibles3, asientosDisponibles4 como entero
	
	//--- Rutas aéreas disponibles a la venta---
	Dimension listaVuelos[4,3]
	cargarVuelos(listaVuelos) 
	
	//--- Inicializamos las variables ----
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
						
					2:
						//Venta de pasajes Buenos Aires - Salta
						asientosTotales <- asientosTotales + 1
						asientosDisponibles2 <- asientosDisponibles + 1
					3:
						//Venta de pasajes Rosario - Buenos Aires
						asientosTotales <- asientosTotales + 1
						asientosDisponibles3 <- asientosDisponibles + 1
					4:
						//Venta de pasajes Mar Del Plata - Mendoza
						asientosTotales <- asientosTotales + 1
						asientosDisponibles4 <- asientosDisponibles + 1
					De Otro Modo:
						Escribir "Opcion incorrecta, vuelva a intentarlo"
				Fin Segun
			Hasta Que elegirVuelo = 1 o elegirVuelo = 2 o elegirVuelo = 3 o elegirVuelo = 4
		Fin Segun
FinAlgoritmo


SubProceso cargarVuelos(listaVuelos) //Ruta
	listaVuelos[0,0] = "Buenos Aires - Bariloche"	
	listaVuelos[1,0] = "Buenos Aires - Salta"
	listaVuelos[2,0] = "Rosario - Bariloche"
	listaVuelos[3,0] = "Mar Del Plata - Mendoza"
FinSubProceso
	