import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import grafica.*; 
import processing.serial.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Graficador extends PApplet {


/*********************************************************************************************************
**********************************************************************************************************

                                             Graficador.pde   
                                  
                                            Processing Code  
                               By Miguelo A. Ruiz (2015).Visit: miguelo.me  
                        Creative Commons Attribution-ShareAlike4.0 Internacional License
       
**********************************************************************************************************

    Descripcion:Ejercicio basico para graficar un sensor usando la libreria grafica by Javier Graci\u00e1 Carpio
       
***********************************************************************************************************
    This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 
    International License. To view a copy of this license, visit: 
    http://creativecommons.org/licenses/by-nc-sa/4.0/.
**********************************************************************************************************
**********************************************************************************************************/




Serial myPort;   
int maxPoints = 50;
GPointsArray points = new GPointsArray(maxPoints);
GPlot plot = new GPlot(this);
int index = 0;



/******************************************************************************************************
 *  Nombre:      Setup
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripcion: Funci\u00f3n de configuraci\u00f3n. 
 ******************************************************************************************************/
public void setup() {
  size(500, 350);
  background(150);
  plot.setPos(0, 0);
  plot.setDim(400, 250);
  plot.setXLim(0, 50);
  plot.setYLim(0, 5);


  plot.setTitleText("Grafica Sensor");
  plot.getYAxis().setAxisLabelText("Voltaje (0 - 5)V");
  plot.getXAxis().setAxisLabelText("Muestras");
  plot.setPointColor(color(200, 200, 255));
  plot.setLineColor(color(200, 200, 255));

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
  background(255);

  plot.setPoints(points);
  plot.beginDraw();
  plot.drawBackground();
  plot.drawBox();
  plot.drawXAxis();
  plot.drawYAxis();
  //plot1.drawTopAxis();
  //plot1.drawRightAxis();
  plot.drawGridLines(1);
  plot.drawTitle();
  //plot.drawPoints();
  plot.drawFilledContours(GPlot.HORIZONTAL, 0);
  plot.drawLabels();
  plot.endDraw();
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
    float dato1 = map(PApplet.parseFloat(val), 0, 1023, 0, 5);
    points.add(index ,index, dato1);
    
    if (index == maxPoints) {
      index = 0;
      points.removeRange(0,51);
    }else {
      index ++;
    }
  }

}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Graficador" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
