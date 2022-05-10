// Pantalla inicial = 0
// Pantalla videojuego = 1
// pantalla Final = 2
// Waiter1 = Mesero sin cerveza mirando a la izquierda

PImage Waiter1;
PImage cervezallena;
PImage cervezavacia;
PImage Logo;
PImage Tabernatresmesas;
float cerveza = 55.0;
float velocidadjuego = 5.0;
float velocidad = 20.0;
float cervezamovimientoX = 200;
float cervezamovimientoY = 310;
//int WaiterX = 680;
float WaiterX = 600;
float WaiterY = 310;
int x = 600;
int y = 310;
int puntos = 0;
int pantalla = 0;


void setup() {


  size(900, 600);

  Waiter1 = loadImage("Waiter1.png");
  cervezallena = loadImage("cervezallena.png");  
  cervezavacia = loadImage("cervezavacia.png");
  Logo = loadImage("Logo.png");
  Tabernatresmesas = loadImage("Tabernatresmesas.png");

}

void draw() {
  if (pantalla == 0) {
    pantallainicial();
  } else if (pantalla == 1) {
    pantallavideojuego();
  } if (pantalla == 2) {
    pantallafinal();
  }
}

void startGame() {
  pantalla=1;
}

void pantallainicial() {
  background(252, 186, 3);
  textAlign(CENTER);
  textSize(80);
  text("Press any key to start", height/1.3, width/2.7);
  Logo.resize(300, 250);
  image(Logo, 330, 30);

  cervezavacia.resize(180, 180);
  image(cervezavacia, cerveza, 350);
  if ( cerveza <= 610) {
    cerveza = cerveza + velocidad;
  }
}

void pantallafinal() {
  background(252, 186, 3);
  textAlign(CENTER);
  textSize(80);
  text("GAME OVER Press any key to restart", height/1.3, width/2.7);
  Logo.resize(250, 250);
  image(Logo, 330, 30);
  
  
}


void pantallavideojuego() {
  background(0);
  Tabernatresmesas.resize(900, 600);
  image (Tabernatresmesas, 0, 0);

  
  image(cervezallena, cervezamovimientoX, cervezamovimientoY, 30, 55);
  if ( cervezamovimientoX <= 680) {
    cervezamovimientoX = cervezamovimientoX + velocidadjuego;
  }

  
  image(Waiter1, WaiterX, WaiterY, 70, 170);

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
  if (WaiterY == cervezamovimientoY && WaiterX == cervezamovimientoX){
    cervezamovimientoX = 200;
    cervezamovimientoY = random (460, 160);
    puntos += 1;
 }else if(cervezamovimientoX == 600){
   pantalla = 2;
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

//PUNTUACION


void keyReleased() {
  if (pantalla==0 || pantalla == 2) {
    startGame();
  }
}
