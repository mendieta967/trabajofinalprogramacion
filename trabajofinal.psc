Algoritmo ventaPasajesAereos
	Definir opcionMenu Como Caracter
	
	// -----Menu-----
	Escribir "Bienvenido al sistema de venta de pasajes aéreos."
		Escribir ""
		Escribir "Seleccione una opción para continuar."
		Escribir "1. Venta pasaje."
		Escribir "2. Buscar pasaje vendido."
		Escribir "3. Buscar pasajero."
		Escribir "4. Ordenar y mostrar lista pasajeros."
		Escribir "5. Listado/s."
		Escribir "6. Salir"
		Leer opcionMenu
		Escribir ""	
		
		Segun opcionMenu Hacer
			1:
				secuencia_de_acciones_1
			2:
				secuencia_de_acciones_2
			3:
				secuencia_de_acciones_3
			De Otro Modo:
				secuencia_de_acciones_dom
		Fin Segun
FinAlgoritmo
