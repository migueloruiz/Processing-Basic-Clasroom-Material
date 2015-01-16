/*********************************************************************************************************
**********************************************************************************************************

                                        ObjLoader.pde    
                            
                                        Processing Code  
                               By Miguelo A. Ruiz (2015).Visit: miguelo.me  
                           Creative Commons Attribution-ShareAlike4.0 Internacional License
       
**********************************************************************************************************

     Descripcion: Ejercicio basico para carga de modelos 3D, majeno de estos e introduccion a GUI.
       
***********************************************************************************************************
     This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 
     International License. To view a copy of this license, visit: 
     http://creativecommons.org/licenses/by-nc-sa/4.0/.
**********************************************************************************************************
**********************************************************************************************************/
 
import saito.objloader.*;
import controlP5.*;
import peasy.*;

PeasyCam cam;
ControlP5 cp5;
OBJModel[] models = new OBJModel[3];

ListBox lista;

float rotZ = 50;

float modelSize = 5;
int modelPosY =0;
int modelPosX =0;
int index = 0;
Knob myKnobB;

/******************************************************************************************************
 *  Nombre:      Setup
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripcion: Función de configuración. 
 ******************************************************************************************************/
void setup(){
    size(600, 600, P3D);
    noStroke();

    cp5 = new ControlP5(this);

    models[0] = new OBJModel(this, "cassini.obj", "relative", TRIANGLES);
    models[1] = new OBJModel(this, "annie.obj", "relative", TRIANGLES);
    models[2] = new OBJModel(this, "utility_truck.obj", "relative", TRIANGLES);
    models[0].enableDebug();
    models[1].enableDebug();
    models[2].enableDebug();

    cam = new PeasyCam(this, 1200);

    cp5.addSlider("modelSize")
   .setPosition(25,200)
   .setSize(20,200)
   .setRange(1,50)
   .setValue(5)
   ;
    cp5.addSlider("modelPosY")
   .setPosition(75,200)
   .setSize(20,200)
   .setRange(0,500)
   .setValue(5)
   ;
   cp5.addSlider("modelPosX")
   .setPosition(125,200)
   .setSize(20,200)
   .setRange(0,200)
   .setValue(5)
   ;

   lista = cp5.addListBox("Lista modelos")
       .setPosition(25, 50)
       .setSize(150, 150)
       .setItemHeight(15)
       .setBarHeight(15)
       .setColorBackground(color(255, 100,0))
       .setColorActive(color(100))
       .setColorForeground(color(255, 100,0))
       ;

  ListBoxItem lb0 = lista.addItem("Satelite", 0);
  lb0.setColorBackground(#086A87);
  ListBoxItem lb1 = lista.addItem("Mujer", 1);
  lb1.setColorBackground(#086A87);
  ListBoxItem lb2 = lista.addItem("Camioneta", 2);
  lb2.setColorBackground(#086A87);

  myKnobB = cp5.addKnob("rotZ")
             .setRange(0,630)
             .setValue(0)
             .setPosition(25,450)
             .setRadius(50)
             .setColorForeground(color(255))
             .setColorBackground(color(0, 0, 100))
             .setColorActive(color(255,255,0))
             .setDragDirection(Knob.HORIZONTAL)
             ;
  cp5.setAutoDraw(false);
}

/******************************************************************************************************
 *  Nombre:      Loop
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Loop general.
 ******************************************************************************************************/

void draw(){
    background(50);
    gui();
    noStroke();
    translate(-modelPosX, +modelPosY, 0);
    rotateZ(int(rotZ)*0.01);
    scale(modelSize);
    models[index].draw();
}

/******************************************************************************************************
 *  Nombre:      gui()
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Dibuja los elementos de ControlP5 en una capa diferente
 ******************************************************************************************************/
void gui(){
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  lights();
  stroke(255);
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}
/******************************************************************************************************
 *  Nombre:      controlEvent(ControlEvent theEvent)
 *  Retorna:     Nada
 *  Parametros:  ControlEvent theEvent: interrupcion por algun elemento de interfaz
 *  Descripcion: Se limita a etectar activaciones por la "Lista modelos"
 ******************************************************************************************************/
void controlEvent(ControlEvent theEvent) {
  if(theEvent.isGroup() && theEvent.name().equals("Lista modelos")){
     index =int(theEvent.group().value());
  }
}


