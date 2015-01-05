/*********************************************************************************************************
**********************************************************************************************************

				     					 Hangman.pde		
			      
				   					 	Processing Code  
						   By Miguelo A. Ruiz (2015).Visit: miguelo.me	
	 			  Creative Commons Attribution-ShareAlike4.0 Internacional License
			 
**********************************************************************************************************

 		Descripcion: Pequeño juego de ahorcado. Ejercicio basico de arreglos, ciclos y manejo 
 		de cadenas de texto. Images de shinysparks.
			 
***********************************************************************************************************
 		This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 
 		International License. To view a copy of this license, visit: 
 		http://creativecommons.org/licenses/by-nc-sa/4.0/.
**********************************************************************************************************
**********************************************************************************************************/
 
 PImage[] imges = new  PImage[6];
 PFont gameFont;

 String palabra ="";
 int dano =0;
 int score = 0;

 String letrasUsadas ="";
 char[] letrero;

 String[] palabras = {"conectar", "codigo", "unam", "arduino", "circuito", "programa"};


/******************************************************************************************************
 *  Nombre:      Setup
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripcion: Función de configuración. 
 ******************************************************************************************************/
 void setup(){

 	size(600, 400);
 	background(256);

 	imges[0]= loadImage("Images/H0.png");
 	imges[1]= loadImage("Images/H1.png");
 	imges[2]= loadImage("Images/H2.png");
 	imges[3]= loadImage("Images/H3.png");
 	imges[4]= loadImage("Images/H4.png");
 	imges[5]= loadImage("Images/H5.png");

 	gameFont = loadFont("data/gameFont.vlw");
 	textFont(gameFont, 50);

 	imageMode(CENTER);
 	textAlign(CENTER);
 	fill(0);

 	inicio();
 }

/******************************************************************************************************
 *  Nombre:      Loop
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Loop general.
 ******************************************************************************************************/
void draw(){

		background(255);
		fill(0);

		image(imges[dano], 125, 150);
		textFont(gameFont, 50);
		text( pSplit(letrero) , 420, 200);
		textFont(gameFont, 27);
		text("Usadas: ", 125, 320);
		textFont(gameFont, 20);
		text(letrasUsadas, 300, 350);
	
}

 /**********************************************************************************************************
 *  Nombre:      pSplit()
 *  Retornos:    Toma una palabra y separa las letras con espacios
 *  Parametros:  String[] listaPalabras
 *  Descripcion: 
**********************************************************************************************************/

 String pSplit( char[] lista){

 	String pSeparada = "";

 	for (int i = 0; i < lista.length ; i++) {
 		pSeparada =  pSeparada +lista[i]+ " ";
 	}

 	return pSeparada;
}

/******************************************************************************************************
 *  Nombre:      keyPressed
 *  Retornos:    Nada
 *  Parametros:  Nada
 * Descripción:  Inicia el juego y determina si existe relacion entre la palabra oculata 
 * y la tecla presionada.
 ******************************************************************************************************/
 
void keyPressed() {

	if (key == ' ') {
			inicio();
			letrasUsadas = "";
			dano = 0;
			score = 0;
		
	}else {

		if ( dano < 5) {

			int index = 0;
			if (key > 96 && key < 123) {
				letrasUsadas = letrasUsadas+ key + " ";

				for (int i = 0; i < palabra.length() ; i++) {
					if ( key == palabra.charAt(i)) {
						letrero[i] = key;
						score ++;
						index ++;
					}
				}
			}
			if (index < 1) {
				dano ++;
				if (dano == 5) {
				letrasUsadas = "PERDISTE";	
				}
			}
			if (score == palabra.length()) {
					letrasUsadas = "GANASTE";
			}
		}
	}

	
}

 /**********************************************************************************************************
 *  Nombre:      inicio()
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripcion: Establece los parametros de inicio.
**********************************************************************************************************/

 void inicio(){
 	palabra = palabras[int(random(0, palabras.length-1))];
	letrero = new char [palabra.length()];

	for (int i = 0; i < palabra.length() ; i++) {
		letrero[i] = '_';
	}
}










