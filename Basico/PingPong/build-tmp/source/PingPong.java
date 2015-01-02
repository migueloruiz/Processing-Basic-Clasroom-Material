import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class PingPong extends PApplet {

/*********************************************************************************************************
**********************************************************************************************************

				     					 PingPong.pde		
			      
				   					 	Processing Code  
						   By Miguelo A. Ruiz (2015).Visit: miguelo.me	
	 			  Creative Commons Attribution-ShareAlike4.0 Internacional License
			 
**********************************************************************************************************

 		Descripcion:Juego cl\u00e1sico de PingPong, ejemplo de funciones de cadenas, tipograias y map,
 		integraci\u00f3n del puerto serial.
			 
***********************************************************************************************************
 		This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 
 		International License. To view a copy of this license, visit: 
 		http://creativecommons.org/licenses/by-nc-sa/4.0/.
**********************************************************************************************************
**********************************************************************************************************/
 

 Serial myPort;       

 PImage bcg;
 PFont gameFont;

 boolean gameState = false;
 int ancho = 900, alto = 600;
 int j1 = alto/2,j2 = alto/2;
 int x = ancho/2 ,y= alto/2;
 int dx = 5, dy=5;

 int score1 = 0, score2 = 0;


/******************************************************************************************************
 *  Nombre:      Setup
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripcion: Funci\u00f3n de configuraci\u00f3n. 
 ******************************************************************************************************/
 public void setup(){
 	size(ancho, alto);

 	bcg = loadImage("Img/bcg.png");

 	rectMode(CENTER); 
 	noStroke();

 	gameFont = loadFont("data/gameFont.vlw");
	textAlign(CENTER);
	textFont(gameFont, 70);

	println(Serial.list());
        myPort = new Serial(this, Serial.list()[7], 9600);
        myPort.bufferUntil(' ');
 }

/******************************************************************************************************
 *  Nombre:      Loop
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Loop general.
 ******************************************************************************************************/
public void draw(){
	background(bcg);
	fill(255);
	rect(x,y,20,20);
	text(score1, 250, 100 );
	text(score2, 650, 100 );

	rect(30, j1, 20, 200);
	rect(870, j2, 20, 200);

	if (gameState) {
		x =  x + dx;
		y =  y + dy;
		dy = (y > alto || y < 0 ) ? -dy : dy ;

		if( x > ancho){
			score1++;
			if (score1 == 5) {
				text(score1, 650, 100 );
				text("Gana Jugador 1", ancho/2, alto-100);
				noLoop();
			}
			gameState = !gameState;
			x = ancho/2;
			y =  alto/2;
		}
		if( x < 0){
			score2++;
			if (score2 == 5) {
				text(score1, 250, 100 );
				text("Gana Jugador 2", ancho/2, alto-100);
				noLoop();
			}
			gameState = !gameState;
			x = ancho/2;
			y = alto/2;
		}

		if (x < 40 && y > j1-100 && y < j1+100) {
			dx = -dx;
		}
		if (x > 860 && y > j2-100 && y < j2+100) {
			dx = -dx;
		}

	}
}

/******************************************************************************************************
 *  Nombre:      mousePressed
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Se aumenta la posicion en "y" del brid y se reinicia el juego
******************************************************************************************************/

public void keyPressed() {

	if(key == ' ') {
		gameState = !gameState;
		dx = PApplet.parseInt(random(3, 6));
		dy = PApplet.parseInt(random(3, 6));
	}
	if (keyCode == ENTER) {
		loop();
		score1 =0;
		score2 = 0;
	}
	if (key == 'w' || key == 'W') {
		j1 -= 10;
	}
	if (key == 's' || key == 'S')  {
		j1 +=10;
	}
	if (keyCode == UP)  {
		j2 -= 10;
	}
	if (keyCode == DOWN) {
		j2 += 10;
	}

} 

/******************************************************************************************************
 *  Nombre:      mousePressed
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Se aumenta la posicion en "y" del brid y se reinicia el juego
******************************************************************************************************/

public void serialEvent( Serial port) {
	String val = port.readStringUntil(' ');
	if (val != null) {
		val = trim(val);
		String[] lista = split(val,',');
		int dato1 = PApplet.parseInt(map(PApplet.parseFloat(trim(lista[0])), 0, 1023, 120, 480));
		int dato2 = PApplet.parseInt(map(PApplet.parseFloat(trim(lista[1])), 0, 1023, 120, 480));
		j1 = dato1;
		j2 = dato2;
	}
}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "PingPong" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
