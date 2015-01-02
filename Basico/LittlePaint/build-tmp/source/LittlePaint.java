import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class LittlePaint extends PApplet {

/*********************************************************************************************************
**********************************************************************************************************

				     						LittlePaint.pde		
			      
									 Processing Classroom Code  
	 			  Creative Commons Attribution-ShareAlike4.0 Internacional License
 						 		By Miguelo A. Ruiz (2015).Visit: miguelo.me	
			 
**********************************************************************************************************

		Descripcion: Peque\u00f1o Paint, dibuja y borra lineas de colores con el mouse y cambia de 
		grosor y color de linea. Ejercicio para aprender el uso de estilo, colores y entradas de 
		mouse y teclado.
			 
***********************************************************************************************************
 		This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 
 		International License. To view a copy of this license, visit: 
 		http://creativecommons.org/licenses/by-nc-sa/4.0/.
**********************************************************************************************************
**********************************************************************************************************/

 
int pincel = 10;
int goma = 20;
int c1 = color(0, 0, 0);

/******************************************************************************************************
 *  Nombre:      Setup
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripcion: Funci\u00f3n de configuracion, tama\u00f1o, fondo y trazo. 
******************************************************************************************************/
public void setup(){
 	size(480, 420);
 	background(255);
 	smooth();
}

/******************************************************************************************************
 *  Nombre:      Loop
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Se dibuja un circulo en la esquina superior izquierda para visulizar el color 
 *  del pincel.
******************************************************************************************************/
public void draw(){
	pushMatrix();
	fill(c1);
	noStroke();
	ellipse(10, 10, goma, goma);
	popMatrix();
}

/******************************************************************************************************
 *  Nombre:      mouseDragged 
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripci\u00f3n: Seleccion de pincel y goma degun el clic.
 ******************************************************************************************************/
public void mouseDragged() {
  if (mouseButton == LEFT) {
		  stroke(c1);
		  line(pmouseX, pmouseY, mouseX, mouseY);
  } else if (mouseButton == RIGHT) {
	    pushMatrix();
		    fill(255);
		    noStroke();
		    ellipse(mouseX, mouseY, goma, goma);
	    popMatrix();
  }
}

/******************************************************************************************************
 *  Nombre:      keyPressed
 *  Retornos:    Nada
 *  Parametros:  Nada
 * Descripci\u00f3n:  Aumenta grosor de goma y seleccion 
 * de color
 ******************************************************************************************************/
 
public void keyPressed() {
  if (key == CODED) {
	    if (keyCode == UP) {
	      goma += 5;
	    } else if (keyCode == DOWN) {
	      goma -= 5;
	      if (goma < 5 ) goma = 5;
	    }
	    println("Grosor de goma: "+ goma );
  } else {

    switch(key) {
	    case ' ': 
	      background(255);
	      println("Nueva Hoja");
	    	break;

	    case 'n':
	    case 'N':  
	      c1 = color(0, 0, 0);
	      println("Pincel Negro");   
	    	break;

	    case '1': 
	      c1 = color(256, 0, 0);
	      println("Pincel Rojo");
	    	break;

	    case '2': 
	      c1 = color(0, 256, 0);
	      println("Pincel Verde"); 
	    	break;
	    case '3': 
	      c1 = color(0, 0, 256);
	      println("Pincel Azul");
	      	break; 
		default:           
		println("No valido");   
	      	break;
    }
  }
}

/******************************************************************************************************
 *  Nombre:      mouseWheel(MouseEvent event)  
 *  Retornos:    Nada
 *  Parametros:  MouseEvent event
 * Descripci\u00f3n:  Aumenta el grosor del pincel
 ******************************************************************************************************/
 
public void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e > 1) {
	    pincel = pincel + 1;
	} else {
	   	if (e < -1) {     
	    	pincel = pincel - 1;
	    	if (pincel < 1 ) pincel= 1;
    	}
  	}
  strokeWeight(pincel);
  println("Grosor de pincel: "+ pincel);
}


















 

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "LittlePaint" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
