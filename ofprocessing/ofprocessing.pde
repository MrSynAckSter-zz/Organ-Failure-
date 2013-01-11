
import supercollider.*;
import oscP5.*;
import netP5.*;

Synth synth;
Synth voice; 
Synth killer; 
OscP5 oscP5;
    NetAddress scNet;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Timer 

class Timer {
  
  int timedelt = 1; 
  int time = 0;
 int  timeit(){
 
  
     this.time += this.timedelt ;
     return time;

 
 };

void reset(){time = 0;};

void printme(){print(time);};



}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Array Magic 
class arrayIt { 
  int arraydelt = 1; 
  int arraypos = 0; 
  
  int arraygo(){  
  this.arraypos += this.arraydelt; 
  return arraypos; 
  
  }
  
  void reset(){arraypos = 0;}; 
  
  
    
    
  void printme(){print("the array is at position: " + arraypos + " <- that should be the number " );};

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Makes the circle 

class Circle {
  float radius, delta;
  float xdelt; 
  float ydelt; 
  float x, y;
  float randomgrowth;
  float freqvar = 10; 
  float ampvar = 1; 
  Circle ( int radius, int delta ) {
    this.radius = radius;
    this.delta = delta;
     
    this.x = random(1000);
    this.y = random(1000); 
    this.xdelt = random(40)- 20; 
    this.ydelt = random(40) - 20; 
    this.randomgrowth = random(400); 
    
  }
  
  void draw() {
    int ampkiller = 0;

 
    fill(25,25,25,25);
    ellipse(this.x, this.y, this.radius, this.radius);
    fill(127,255,0,25);
    ellipse(this.x , this.y , this.radius / 2, this.radius / 2 + 10);
  float  ampman = 1;   
  ampman = this.radius * ampvar; 
  
  print("\n" + ampman + " is the amp function! \n"); 

    synth.set("amp",   ampman ); 
    
       

    synth.set("freq", 1000 + this.y );
    synth.set("lfofreq", this.x / 2000); 
  
  }
  void update(){
    if(radius >= randomgrowth){ 
     // this.delta *= -1;
      this.radius = randomgrowth;
    }
   /* else if ( radius < 0 ) {
      this.delta *= -1;
      this.radius = 0;
    }
   */          
   if (this.x >= 1400 ) {
       this.x *= -1; 
   }
    if (this.y >= 1200 ) {
       this.y *= -1; 
   }
    this.radius += this.delta;
    this.x += this.xdelt; 
    this.y += this.ydelt; 
    
    
  }
 void kill(){                                 ///// Kills the Circle 
   this.radius = 0; 
   this.delta = 0; 
   this.x = 0;
   this.y = 0;
    synth.set("amp", 0);                  //// Temporary Insta kill parameters 
    synth.set("freq", 0); 
    killer.set("freq", random(2000) + 500);
    
   // ampvar = 0; 
   // freqvar = 0;     
    
   
   
 }
  void mousepressed(){ 
     synth.free();
   }
}

/////////////////////////////////

Circle circle;
Circle[] circlearray;
Circle[] circlearray2;
Circle[] circlearray3;
Circle[] circlearray4;
Circle[] circlearray5;
Circle[] circlearray6;
Circle[] circlearray7;
Circle[] circlearray8;
Circle[] circlearray9;
Circle[] circlearray10;
Timer timeguy;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////SQUARE  

class Square { 
  float size, delta;
  float xdelt; 
  float ydelt; 
  float x, y;  
  

    Square ( int size ) {
    this.size = size;
    this.delta = delta; 
     voice.get("amp",  this, "deltamod");  

    this.x = random(500);
    this.y = random(500); 
    this.xdelt = random(40)- 20; 
    this.ydelt = random(40) - 20; 
    

    
  }
  
  void draw(){
   fill(25,25,25,25);
   rect(this.x , this.y, this.size  ,this.size ); 
   }
   
   
   void update(){ 
    
this.size += this.delta;
 if (this.size == 500){
   square.kill();   
     
   }
   
   voice.set("freq", random(10));
   }
   
   
    void kill(){                                 ///// Kills the Square 
   this.size = 0; 
   this.delta = 0; 
  // synth.free();
   
   
 }
 
   void mousepressed(){ 
     synth.free();
   }
    
} 
   
   ////////////////////////////////////////////////////////////////////////////////////////////////////////////// SETUP
 
  


Square square;
arrayIt arrayit; 

void setup(){
   oscP5 = new OscP5(this, 12000);
      scNet = new NetAddress("127.0.0.1", 57120);
  
      // uses default sc server at 127.0.0.1:57110    
    // does NOT create synth!
    synth = new Synth("sine");
    voice = new Synth("voice"); 
    killer = new Synth("killer");
    
    // set initial arguments
    synth.set("amp", 0.0001);
    synth.set("freq", 80);
    voice.set("amp", 10);
    voice.set("freq", 1);
    killer.set("freq", 1); 
    // create synth
    synth.create();
    voice.create();
    killer.create(); 
    
  size(1400,800);
  timeguy = new Timer();
  circle = new Circle(40,2);
  arrayit = new arrayIt(); 
  square = new Square(40);
  int[] foo = new int[10];
  ////////////////////////////////////////////////////////////////////////////////////// Circle Arrays 
  
  circlearray =  new Circle[100];              /////// Wave 1 Circle Array 
  for( int i = 0; i < 100; i++){
  circlearray[i] = new Circle(40,2);}
  
  circlearray2 =  new Circle[100];              /////// Wave 2 Circle Array 
  for( int i = 0; i < 100; i++){
  circlearray2[i] = new Circle(40,2);}    



  circlearray3 =  new Circle[100];              /////// Wave 3 Circle Array 
  for( int i = 0; i < 100; i++){
  circlearray3[i] = new Circle(40,2);}   
  
  
   circlearray4 =  new Circle[100];              /////// Wave 4 Circle Array 
  for( int i = 0; i < 100; i++){
  circlearray4[i] = new Circle(40,2);}  
  
  
   circlearray5 =  new Circle[100];              /////// Wave 5 Circle Array 
  for( int i = 0; i < 100; i++){
  circlearray5[i] = new Circle(40,2);}  
  
    circlearray6 =  new Circle[100];              /////// Wave 6 Circle Array 
  for( int i = 0; i < 100; i++){
  circlearray6[i] = new Circle(40,2);}  
  
    circlearray7 =  new Circle[100];              /////// Wave 7 Circle Array 
  for( int i = 0; i < 100; i++){
  circlearray7[i] = new Circle(40,2);} 
  
  circlearray8 =  new Circle[100];              /////// Wave 8 Circle Array 
  for( int i = 0; i < 100; i++){
  circlearray8[i] = new Circle(40,2);} 
  
   circlearray9 =  new Circle[100];              /////// Wave 9 Circle Array 
  for( int i = 0; i < 100; i++){
  circlearray9[i] = new Circle(40,2);} 
  
    circlearray10 =  new Circle[100];              /////// Wave 10 Circle Array 
  for( int i = 0; i < 100; i++){
  circlearray10[i] = new Circle(40,2);}      
  }
  
//////////////////////////////////////////////////////////////////////////////IMPLEMENT
void draw(){
  timeguy.timeit();
   // timeguy.printme();
  circle.update();
  square.update();
  background(255,0,0);
  circle.draw();
  square.draw();
  
  
 
  
  for( int i = 0; i < 100; i++){        /////////// Spawn Wave 1
    circlearray[i].update();
    circlearray[i].draw();
    
  }
  
  /*
  if (timeguy.time >= 6000){                  ////// Emergency Clutch! 
    synth.free();
  }
  */
  
  if (square.size > 100){                    ////// Kill Code 
    arrayit.arraygo(); 
          arrayit.printme();
  }
  
  if (arrayit.arraypos >= 99){ 
   arrayit.reset();  
   
  }
  
  
  /////////////////////////////////////////////////////////////// WAVE 2
  
  if (timeguy.time >= 1000){ 
    
      
    
    for( int i = 0; i < 100; i++){
    circlearray2[i].update();
    circlearray2[i].draw();}
  }
  
   /////////////////////////////////////////////////////////////// WAVE 3
  
  if (timeguy.time >= 1500){ 
    
      
    
    for( int i = 0; i < 100; i++){
    circlearray3[i].update();
    circlearray3[i].draw();}
  }
  
   /////////////////////////////////////////////////////////////// WAVE 4
  
  if (timeguy.time >= 1700){ 
    
      
    
    for( int i = 0; i < 100; i++){
    circlearray4[i].update();
    circlearray4[i].draw();}
  }
  
   /////////////////////////////////////////////////////////////// WAVE 5
  
  if (timeguy.time >= 1900){ 
    
      
    
    for( int i = 0; i < 100; i++){
    circlearray5[i].update();
    circlearray5[i].draw();}
  }
  
     /////////////////////////////////////////////////////////////// WAVE 6
  
  if (timeguy.time >= 2200){ 
    
      
    
    for( int i = 0; i < 100; i++){
    circlearray6[i].update();
    circlearray6[i].draw();}
  }
  
  
       /////////////////////////////////////////////////////////////// WAVE 7
  
  if (timeguy.time >= 2300){ 
    
      
    
    for( int i = 0; i < 100; i++){
    circlearray7[i].update();
    circlearray7[i].draw();}
  }
  
        /////////////////////////////////////////////////////////////// WAVE 8
  
  if (timeguy.time >= 2400){ 
    
      
    
    for( int i = 0; i < 100; i++){
    circlearray8[i].update();
    circlearray8[i].draw();}
  }
  
        /////////////////////////////////////////////////////////////// WAVE 9
  
  if (timeguy.time >= 2450){ 
    
      
    
    for( int i = 0; i < 100; i++){
    circlearray9[i].update();
    circlearray9[i].draw();}
  }
  
  
         /////////////////////////////////////////////////////////////// WAVE 10
  
  if (timeguy.time >= 2500){ 
    
      
    
    for( int i = 0; i < 100; i++){
    circlearray10[i].update();
    circlearray10[i].draw();}
  }
  
  //////////////////////////////////////////// DA END  
  
  float rectalpha  = 255; 
  float rectalphafinal = 0; 
  float rectdelta = 1; 
  

    
  
 if ( timeguy.time >= 2600 ) { 
   
   fill ( 0,0,0, rectalpha ); 
   rect(0, 0, 1400, 800);
   
  
     
   
  
 }
} 
    
  
  
  
  
  
  
  
  
    
  
  
  
  
  
  
  
  
  
  
  
  
  
 
    /*
    if(timeguy.time  == 1200){                   ///// Code to Kill everything for testing purposes 
      for( int i = 0; i < 100; i++){.
    circlearray[i].kill();
    
      }
      
     };
      
    */  
    
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// COMS 
void oscEvent(OscMessage msg) {
  
      println(msg.get(0).floatValue() * 10);      
       float brcolor = msg.get(0).floatValue() * 500;
      square.size = brcolor;
      print(brcolor);
      
      if (square.size <= 20){
        square.kill();}
        else{ 
          square.y = random(500);
          square.x = random(700);
        }
        
        int i = 0; 
      if ( timeguy.time > 100){ 
         if ( square.size < 1000 ){
           
           
        if ( square.size > 200){
        
        square.kill();
        print ("Dead"); 
        
          arrayit.arraygo();            //// array handling
          arrayit.printme();            //// diagnostics 
          
        if ( timeguy.time <= 1000) {       //////wave 1
          i = arrayit.arraypos;
           circlearray[i].kill(); 
        }
         else if ( timeguy.time >= 1000)  /////wave 2 
              {   
               i = arrayit.arraypos;
           circlearray2[i].kill();
              }
          if ( timeguy.time >= 1500){
                i = arrayit.arraypos;
           circlearray3[i].kill();  
          print (" sucess ");  
         }
          if ( timeguy.time >= 1700){
                i = arrayit.arraypos;
           circlearray4[i].kill();   
         }
           if ( timeguy.time >= 1900){
                i = arrayit.arraypos;
           circlearray5[i].kill();   
         }
           if ( timeguy.time >= 2200){
                i = arrayit.arraypos;
           circlearray6[i].kill();   
         }
           if ( timeguy.time >= 2300){
                i = arrayit.arraypos;
           circlearray7[i].kill();
          print("next step 4");    
         }
           if ( timeguy.time >= 2450){
                i = arrayit.arraypos;
           circlearray8[i].kill();   
         }
           if ( timeguy.time >= 2500){
                i = arrayit.arraypos;
           circlearray9[i].kill();   
         }
           if ( timeguy.time >= 2600){
                i = arrayit.arraypos;
           circlearray4[i].kill();   
         }
         }
        }
           
    
  }
      
    }


 void mousePressed(){ 
   //  synth.free();
     print("home free!"); 
   }

//// home 212-477-0214, 347-668-2530


