/*********************************************************************************************************
**********************************************************************************************************

					     					 P-P-T.pde		
				      
					   					 	Processing Code  
							   By Miguelo A. Ruiz (2015).Visit: miguelo.me	
		 			  Creative Commons Attribution-ShareAlike4.0 Internacional License
			 
**********************************************************************************************************

 		Descripcion: Juego de Piedra-Papel-Tijeras-Largato y Spock. Ayuda a reformar conceptos de 
 		condicionales, manejo de imágenes, arreglos e introducción a la función Random.
			 
***********************************************************************************************************
 		This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 
 		International License. To view a copy of this license, visit: 
 		http://creativecommons.org/licenses/by-nc-sa/4.0/.
**********************************************************************************************************
**********************************************************************************************************/
 
 PImage[] piedra = new PImage[3];
 PImage[] papel = new PImage[3];
 PImage[] tijera = new PImage[3];
 PImage[] lagarto = new PImage[3];
 PImage[] spock = new PImage[3];
 PImage[] randomImg = new PImage[5];
 PImage fondo;

 String[][] mensajes = 
 /* 				Piedra                 Papel   				Tijera  Lagarto Spock*/
 /* Piedra  */ {{ "Empate" , "Pierdes: El papel cubre a la piedra.", "Ganas: La piedra aplasta las tijeras.","Ganas: La piedra aplasta al lagarto", "Pierdes: Spock vaporiza la piedra"}
 /* Papel   */,{"Ganas: El papel cubre a la piedra", "Empate", "Pierdes: Las tijeras cortan el papel", "Pierdes: El lagarto se come el papel", "Ganas: El papel desautoriza a Spock."}
 /* Tijera  */,{"Pierdes: La piedra aplasta las tijeras.","Ganas: Las tijeras cortan el papel", "Empate","Ganas: Las tijeras decapitan al lagarto","Pierdes: Spock destroza las tijeras"}
 /* Lagarto */,{"Pierdes: La piedra aplasta al lagarto.","Ganas: El lagarto se come el papel.","Pierdes: Las tijeras cortan el papel.", "Empate" , "Ganas: El lagarto envenena a Spock."}
 /* Spock   */,{"Ganas: Spock vaporiza la piedra.","Pierdes: El papel desautoriza a Spock.","Ganas: Spock destroza las tijeras.","Pierdes: El lagarto envenena a Spock.","Empate"}};

 int widthBcg = 700;
 int heightBcg = 700;
 int i = 0 ;
 int jugador;

 Boton bPiedra = new Boton(150, 300, 150);
 Boton bPapel = new Boton(550, 300, 150);
 Boton bTijera = new Boton(350, 150, 150);
 Boton bLagarto = new Boton(200, 500, 150);
 Boton bSpock = new Boton(500, 500, 150);

 int[] listaBotones = new int[5];

boolean pausa = false;

String ganador ="";
String texto = "";



/******************************************************************************************************
 *  Nombre:      Setup
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripcion: Función de configuración. 
 ******************************************************************************************************/
 void setup(){
 	size(widthBcg, heightBcg);
	fondo = loadImage("data/Fondo.png");
 	fondo.resize(widthBcg, heightBcg);

 	piedra[0] = loadImage("data/PiedraN.png");
 	piedra[1] = loadImage("data/PiedraU.png");
 	piedra[2] = loadImage("data/PiedraP.png");

 	papel[0] = loadImage("data/PapelN.png");
 	papel[1] = loadImage("data/PapelU.png");
 	papel[2] = loadImage("data/PapelP.png");

 	tijera[0] = loadImage("data/TijeraN.png");
 	tijera[1] = loadImage("data/TijeraU.png");
 	tijera[2] = loadImage("data/TijeraP.png");

 	lagarto[0] = loadImage("data/LagartoN.png");
 	lagarto[1] = loadImage("data/LagartoU.png");
 	lagarto[2] = loadImage("data/LagartoP.png");

 	spock[0] = loadImage("data/SpockN.png");
 	spock[1] = loadImage("data/SpockU.png");
 	spock[2] = loadImage("data/SpockP.png");

 	randomImg[0] = piedra[0];
 	randomImg[1] = papel[0];
 	randomImg[2] = tijera[0];
 	randomImg[3] = lagarto[0];
 	randomImg[4] = spock[0];

 	bPapel.loadImages(papel);
 	bPiedra.loadImages(piedra);
 	bTijera.loadImages(tijera);
 	bLagarto.loadImages(lagarto);
 	bSpock.loadImages(spock);
 	imageMode(CENTER);
 	textSize(26); 
 	textAlign(CENTER);


 }

/******************************************************************************************************
 *  Nombre:      Loop
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Loop general.
 ******************************************************************************************************/
void draw(){
	 	background(fondo);

	 	if (pausa == false) i = int(random(0, 5));
	 	
	 	image(randomImg[i], widthBcg/2, heightBcg/2, 150,150);
	 	listaBotones[0] = bPiedra.bottonDraw();
	 	listaBotones[1] = bPapel.bottonDraw();
	 	listaBotones[2] = bTijera.bottonDraw();
	 	listaBotones[3] = bLagarto.bottonDraw();
	 	listaBotones[4] = bSpock.bottonDraw();

	 	for (int inc = 0; inc < 5; inc++) {

	 		if(listaBotones[inc] == 2){

	 			ganador = mensajes[inc][i];
	 			pausa = true;

	 		} else {

	 			if (pausa == true) {
	 				texto = "Presiona espacio para volver a juagar";
	 			}else {
	 				texto = "    Da clic para jugar ¡Suerte!";
	 				ganador = "";
	 			}
	 		}
	 	}
	 	text(texto, 350,50);
	 	text(ganador, 350, 650);
}


/******************************************************************************************************
 *  Nombre:      keyPressed
 *  Retornos:    Nada
 *  Parametros:  Nada
 * Descripción:  Reincia el juego 
 ******************************************************************************************************/
 
void keyPressed() {
  pausa = !pausa;

  }









