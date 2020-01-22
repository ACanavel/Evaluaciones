
Funcion Promedio <- Promediar(a1,a2,a3)//Promedio
	Promedio<-(a1+a2+a3)/3
Fin Funcion

Funcion Baño<-Dato(Género) //Definir el Baño
	Baño<-Género;
	Género=A
	
	Si A<-Femenino Entonces;
		Baño<-Femenino
	FinSi
	Si A<-Masculino
		Baño<-Masculino
	FinSi
FinFuncion

Funcion Pagar<-dato1(servicio)//Pagar
	Pagar<-dato1(servicio);
    servicio=B
	
	Si B<-Wc Entonces;
		Pagar<-250
		
		Si B<-Ducha Entonces;
			Pagar<-2500
		FinSi
	Fin Si	
Fin Funcion


Algoritmo EjercicioGeneral //mario.larenas@gmail.com
	
	Escribir "*******MENU******"
	Escribir "*1.Promedio                "
	Escribir "*2.Nombre y Genero         "
	Escribir "*3.Pago                    "
	
	Leer Op
	
	Escribir "********************************"
	
	Segun Op Hacer
		
	1:
	
	Definir Promedio como Real
	Escribir "Ingresar el primer valor  ",a1
	Leer a1
	Escribir "Ingresar el primer valor  ",a2
	Leer a2
	Escribir "Ingresar el primer valor  ",a3
	Leer a3
	Escribir "El resultado es ",Promediar(a1,a2,a3)
	
	Esperar tecla
	Borrar pantalla
	
	2:
		Definir Nombre,Género,Baño,A como Caracter
		Escribir "Indique su Nombre ",Nombre
		Leer Nombre
		Escribir "Indique su Género ",Género
		Leer Género
		Escribir " La persona que se llama  ",Nombre,  " le corresponde ir al baño  ",Dato(Género)
		
		Esperar tecla
		Borrar pantalla
	3:
		Definir Pagar,B como Entero
		Escribir "Que servicio requiere utilizar ?",servicio
		Leer servicio
		Escribir  "Requiere pagar ",dato1(servicio)
		
		Esperar tecla
		Borrar pantalla
		
		
		
	FinSegun	
FinAlgoritmo
