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
 *  Descripcion: Función de configuración. 
 ******************************************************************************************************/
 void setup() {
	size(640,360,P3D);
	lights();
}

/******************************************************************************************************
 *  Nombre:      Loop
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Loop general.
 ******************************************************************************************************/
void draw() {
	background(0);

	pushMatrix();
	fill(255);
	translate(130, height/2, 0);
	rotateY((mouseY)*0.01);
	rotateX((mouseX)*0.01);
	box(100);
	popMatrix();

	pushMatrix();
	translate(500, height*0.35, -200);
	noFill();
	stroke(255);
	sphere(280);
	popMatrix();
}

