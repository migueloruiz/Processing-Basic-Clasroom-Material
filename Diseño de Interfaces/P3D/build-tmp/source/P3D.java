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

public class P3D extends PApplet {

/*********************************************************************************************************
**********************************************************************************************************

				     					 P3D.pde		
			      
				   					 	Processing Code  
						   By Miguelo A. Ruiz (2015).Visit: miguelo.me	
	 			  Creative Commons Attribution-ShareAlike4.0 Internacional License
			 
**********************************************************************************************************

 		Descripcion:Ejercicio basico de P3D.
			 
***********************************************************************************************************
 		This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 
 		International License. To view a copy of this license, visit: 
 		http://creativecommons.org/licenses/by-nc-sa/4.0/.
**********************************************************************************************************
**********************************************************************************************************/
 


/******************************************************************************************************
 *  Nombre:      Setup
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripcion: Funci\u00f3n de configuraci\u00f3n. 
 ******************************************************************************************************/
 public void setup() {
	size(640,360,P3D);
	lights();
}

/******************************************************************************************************
 *  Nombre:      Loop
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Loop general.
 ******************************************************************************************************/
public void draw() {
	background(0);

	pushMatrix();
	fill(255);
	translate(130, height/2, 0);
	rotateY((mouseY)*0.01f);
	rotateX((mouseX)*0.01f);
	box(100);
	popMatrix();

	pushMatrix();
	translate(500, height*0.35f, -200);
	noFill();
	stroke(255);
	sphere(280);
	popMatrix();
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "P3D" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
