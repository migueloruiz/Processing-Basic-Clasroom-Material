/*********************************************************************************************************
**********************************************************************************************************

				     						Robot.pde		
			      
									 Processing Classroom Code  
	 			  Creative Commons Attribution-ShareAlike4.0 Internacional License
								Origianal By Casy Reas and Ben Fry (2010)
 						 Modify By Miguelo A. Ruiz (2015).Visit: miguelo.me	
			 
**********************************************************************************************************

 		Descripcion: Dibuja un curioso robot con formas básicas de processing.
 		Ejercicio para aprender el uso de formas básicas de dibujo.
			 
***********************************************************************************************************
 		This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 
 		International License. To view a copy of this license, visit: 
 		http://creativecommons.org/licenses/by-nc-sa/4.0/.
**********************************************************************************************************
**********************************************************************************************************/
 

int x = 100;           // x-cordenada
int y = 100;           // y-cordenada
int bodyHeight = 170;  // alto del cuerpo
int neckHeight = 90;   // alto del cuello
int head = 40;       // radio de la cabeza
int bodyLine = bodyHeight/15;
int bodyOffset = 10;
int eye = head/3;


size(200, 500);
smooth();
background(204);
ellipseMode(RADIUS);

////////////////////// Antena ////////////////////////

stroke(100);
noFill();
strokeCap(ROUND);
strokeWeight(3);
strokeJoin(BEVEL);
beginShape();
vertex(x, y);
vertex( x-18, y-(head+5));
vertex( x-30, y-(head+18));
endShape();

beginShape();
vertex(x, y);
vertex( x-30, y-(head+5));
vertex( x-42, y-(head+10));
endShape();

beginShape();
vertex(x, y);
vertex( x-32, y-head+5);
vertex( x-45, y-(head -10));
endShape();

////////////////////// Cuello ////////////////////////
strokeWeight(5);
line(x, y, x+2, y+neckHeight);
line(x-12, y, x-12, y+neckHeight);
line(x+12, y, x+12, y+neckHeight);

////////////////////// Colita ////////////////////////
fill(102);
stroke(10);
strokeWeight(2);
ellipse( x-bodyOffset, y+neckHeight+bodyHeight, head*0.7, head*0.7);

////////////////////// Cuerpo ////////////////////////
noStroke();
fill(0);
rect(x-head-bodyOffset, y+neckHeight, head*2, bodyHeight, 5);
fill(102);
rect(x-head-bodyOffset, y+neckHeight+bodyLine, head*2, bodyLine*2);

////////////////////// Foquitos ////////////////////////
stroke(200);
strokeWeight(1);
fill(256,10,10);
ellipse(x+bodyOffset*1.2, y+neckHeight+bodyLine*2, bodyLine/3, bodyLine/3);
fill(0,256,10);
ellipse(x+bodyOffset*2, y+neckHeight+bodyLine*2, bodyLine/3, bodyLine/3);


////////////////////// Cabeza ////////////////////////
noStroke();
fill(0);
ellipse(x, y, head, head);

//////////////////////// Ojo ////////////////////////
stroke(100);
strokeWeight(2);
fill(255);
ellipse(x+head/2, y, eye, eye);
noStroke();
fill(0);
ellipse(x+head/2, y-eye/3, eye/3, eye/3);
















