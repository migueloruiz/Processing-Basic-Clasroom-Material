/*********************************************************************************************************
**********************************************************************************************************

					     				 ChafaBirds.pde		
				      
					   			 	 		Project  
							   By Miguelo A. Ruiz (2015).Visit: miguelo.me	
		 			  Creative Commons Attribution-ShareAlike4.0 Internacional License
				 
**********************************************************************************************************

 		Descripcion: Juego de chafabirsd, ejemplo d manejo de  ciclos, topografías, animaciones y 
 		condicionales. Agradeciemintos a Douglas Adams y Ellison Leão.
			 
***********************************************************************************************************
 		This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 
 		International License. To view a copy of this license, visit: 
 		http://creativecommons.org/licenses/by-nc-sa/4.0/.
**********************************************************************************************************
**********************************************************************************************************/
import ddf.minim.*;

Minim minim;
AudioPlayer bcgSound;
AudioSample hit;
AudioSample lose;

PImage bcg, gnd, birdImg, inicio;
PImage[] wall = new PImage[2];

PFont gameFont;

JSONObject scoreFile = new JSONObject(); // lee el JSON

int highScore;

int ancho = 400, alto = 600; // dimenciones de ventana
int score = 0;
int gameState = 1 ;
int x1,x2, y=400; // Posicion
int vy;
int wx = 0;
int wy[] = {0,0};

/******************************************************************************************************
 *  Nombre:      Setup
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripcion: Función de configuracion.
******************************************************************************************************/

void setup() {
	size(ancho, alto); 

	scoreFile = loadJSONObject("data/scoreFile.json"); // craga el archivo ya existenate
	highScore = scoreFile.getInt("highScore"); // lee el valor anterior del score



	// carga de imagenes
	wall[0] = loadImage("Img/pipeUp.png");
	wall[1] = loadImage("Img/pipeDown.png");
	bcg =loadImage("Img/bg.png");
	gnd =loadImage("Img/ground.png");
	birdImg=loadImage("Img/bird1.png");
	inicio =loadImage("Img/inicio.png");

	gameFont = loadFont("data/gameFont.vlw");
	textAlign(CENTER);
	textFont(gameFont, 32);
	fill(0);

	minim = new Minim(this);
	bcgSound = minim.loadFile("Sounds/theme.mp3");

    hit = minim.loadSample("Sounds/hit.mp3");
    lose = minim.loadSample("Sounds/lose.mp3");
} 

/******************************************************************************************************
 *  Nombre:      Loop
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Se dibuja un circulo en la esquina superior izquierda para visulizar el color 
 *  del pincel.
******************************************************************************************************/

void draw() { 

  if (gameState == 1) { // Pantalla de Inicio
	  	imageMode(CORNER);
	  	image(inicio, 0, 0); 
                text("High Score: "+ highScore, ancho/2 , alto-20); 
  }else {				// Juego
        bcgSound.play();
		// Dibuja y mueve el fondo   
		imageMode(CORNER);
		x1 =  ( (x1 == -300) ? 0 : (x1 = x1 - 2));
		image(bcg , x1, 0);

	  	// Mueve al bird
	    pushMatrix();
	    	vy += 1;
	    	y += vy/2;
	    	imageMode(CENTER);
	    	image(birdImg, width/2, y);
	    popMatrix();

	    // Dibuja y mueve los tubos
	    for (int i = 0; i < 2; i++) {
	    	for (int j = 0; j < 2; ++j) {
	    		image(wall[j], wx +(i* 300), wy[i] + (j * 700) );
	    	}
	    }
	    if (wx < -50 ) {
    		wx = wx + 300;	
    		wy[0] = wy[1];
    		wy[1] = int(random(-225,50));

    	} else {
    		wx = wx - 4;
    	}   

	    // Dibuja y mieve el piso
    	x2 =  ( (x2 < -95) ? 0 : (x2 = x2 - 4));
    	imageMode(CORNER);
	  	image(gnd , x2, 503);
		text(score, ancho/2 , 50); 

	    // Detecta colicion entre el bird y el tubo
    	if ( abs(width/2 - wx) < 45 &&  (290 > abs(y-wy[0]) || abs(y-wy[0]) > 400)  /* distancia a la esquina*/
    		|| y > 500 /*Borde inferior*/ || y < 0/*Borde superior*/ ) {
    		gameState = 1;
                lose.trigger();
                bcgSound.pause();
                bcgSound.rewind();
    		
    	}

    	// SCORE
    	if (wx == ancho/2) {
    		score ++ ;	
                hit.trigger();
    		highScore = max(highScore, score);
    		scoreFile.setInt("highScore", highScore); // escribe en el JSON
			saveJSONObject(scoreFile, "data/scoreFile.json"); // guarda el archivo
    	}
	}
} 

/******************************************************************************************************
 *  Nombre:      mousePressed
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Se aumenta la posicion en "y" del brid y se reinicia el juego
******************************************************************************************************/

void mousePressed() {
	vy = -15; // Vuela 
    // Reinicia 
	if (gameState == 1){
		y = ancho/2;
		wx = 400;
		x1 = x2 = score = gameState = 0;
		wy[0] = int(random(-250,50));
	}
} 







