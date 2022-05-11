// Pantalla inicial = 0
// Pantalla videojuego = 1
// pantalla Final = 2
// Waiter1 = Mesero sin cerveza mirando a la izquierda

PImage Waiter1;
PImage Pokerlogo;
PImage cervezallena1;
PImage cervezallena2;
PImage cervezallena3;
PImage cervezavacia;
PImage cervezarota;
PImage Logo;
PImage Tabernatresmesas;
float cerveza = 55.0;
float velocidadjuego1 = 1;
float velocidadjuego2 = 2;
float velocidadjuego3 = 0.5;
float velocidad = 5.0;
float cervezamovimientoX1 = 200;
float cervezamovimientoY1 = 310;
float cervezamovimientoX2 = 200;
float cervezamovimientoY2 = 160;
float cervezamovimientoX3 = 200;
float cervezamovimientoY3 = 460;
float WaiterX = 600;
float WaiterY = 310;
int limite = 500;
int puntos = 0;
int pantalla = 0;
int[] mesas = {150, 310, 460};
int index = int(random(mesas.length));
int tiempo;
int intervalotiempo = 10;

void setup() {


  size(900, 600);

  Waiter1 = loadImage("Waiter1.png");
  Pokerlogo = loadImage("Pokerlogo.png");
  cervezallena1 = loadImage("cervezallena1.png");  
  cervezallena2 = loadImage("cervezallena2.png");  
  cervezallena3 = loadImage("cervezallena3.png"); 
  cervezavacia = loadImage("cervezavacia.png");
  cervezarota = loadImage("cervezarota.png");
  Logo = loadImage("Logo.png");
  Tabernatresmesas = loadImage("Tabernatresmesas.png");

}

void draw() {
  if (pantalla == 0) {
    pantallainicial();
  } else if (pantalla == 1) {
    pantallavideojuego();
  } 
}

void startGame() {
  pantalla=1;
}

void pantallainicial() {
  background(252, 186, 3);
  textAlign(CENTER);
  textSize(60);
  text("Press any key to start", 450, 380);
 
  Logo.resize(250, 250);
  image(Logo, 330, 50);

  cervezavacia.resize(180, 180);
  image(cervezavacia, cerveza, 400);
  if ( cerveza <= 610) {
    cerveza = cerveza + velocidad;
  }
}

void pantallafinal() {
  background(252, 186, 3);
  textAlign(CENTER);
  textSize(40);
  text("GAME OVER Press ESC to restart", 450, 450);
  
   textAlign(RIGHT);
  textSize(20);
  text(" GAME OVER " + puntos + " puntos en " + millis()/1000+ " segundos ", 780, 30);
  
  Logo.resize(250, 250);
  image(Logo, 330, 50);
  
  
}


void pantallavideojuego() {
  background(0);
  Tabernatresmesas.resize(900, 600);
  image (Tabernatresmesas, 0, 0);


//CERVEZAS LLENAS =
  
  image(cervezallena1, cervezamovimientoX1, cervezamovimientoY1, 30, 55);
  if ( cervezamovimientoX1 <= limite) {
    cervezamovimientoX1 = cervezamovimientoX1 + velocidadjuego1;
  }
  
   image(cervezallena2, cervezamovimientoX2, cervezamovimientoY2, 30, 55);
  if ( cervezamovimientoX2 <= limite) {
    cervezamovimientoX2 = cervezamovimientoX2 + velocidadjuego2;
  }
  
  if(second() > tiempo + intervalotiempo){
  image(cervezallena3, cervezamovimientoX3, cervezamovimientoY3, 30, 55);
  if ( cervezamovimientoX3 <= limite) {
    cervezamovimientoX3 = cervezamovimientoX3 + velocidadjuego3;
  }
  }


  
  image(Waiter1, WaiterX, WaiterY, 60, 120);

  //PUNTOS = 
  for (int i= 0; i <= puntos; i++) {
    fill (255, 0, 0);
    textAlign(CENTER);
    textSize(18);
    text ("PUNTOS: " + (puntos), 250, 30);

    //TIEMPO = 
    fill(255, 0, 0);
    textAlign(LEFT);
    textSize(18);
    text("TIEMPO: " + millis()/1000, 20, 30);
    //Milisegundos dividido en 1000

    
    
  }
  //PUNTUACION =
  for(int i = 0; i <= cervezamovimientoY1; i++){
  if (WaiterY == cervezamovimientoY1 && WaiterX == cervezamovimientoX1){
     cervezamovimientoX1 = 200;
     puntos += 1;
     cervezamovimientoY1 = 460;
  }else if(cervezamovimientoX1 == limite){
   pantalla = 2;
  }
}
for(int i = 0; i <= cervezamovimientoY2; i++){
  if (WaiterY == cervezamovimientoY2 && WaiterX == cervezamovimientoX2){
     cervezamovimientoX2 = 200;
     puntos += 1;
     cervezamovimientoY2 = 310;
  }else if(cervezamovimientoX2 == limite){
   pantalla = 2;
  }
}
for(int i = 0; i <= cervezamovimientoY3; i++){
  if (WaiterY == cervezamovimientoY3 && WaiterX == cervezamovimientoX3){
     cervezamovimientoX3 = 200;
     puntos += 1;
     cervezamovimientoY3 = 160;
  }else if(cervezamovimientoX3 == limite){
   pantalla = 2;
  }
}

if (pantalla == 2) {
    pantallafinal();
  }


}

void keyPressed() {

  if (key == CODED) {
    if (keyCode == LEFT) {
      if (WaiterX <= 720  && WaiterX >= 200) {
        WaiterX -= 20;
      }
    } else if (keyCode == RIGHT) {
      if (WaiterX <= 680) {
        WaiterX += 20;
      }
    }
    if (keyCode == UP) {
      if (WaiterY >= 200) {
        WaiterY -= 150;
      }
    } else if (keyCode == DOWN) {
      if (WaiterY <= 400) {
        WaiterY += 150;
      }
    }
  }
}

void keyReleased() {
  if (pantalla==0 ) {
    startGame();
  }
}
