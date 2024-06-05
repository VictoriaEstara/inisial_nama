float angle = 0;
float posX = 0;
float posY = 0;
float scaleFactor = 1.0;

void setup() {
  size(800, 600);
  background(255);
}

void draw() {
  background(255);
  translate(width / 2 + posX, height / 2 + posY);
  scale(scaleFactor);
  rotate(angle);
  
  // Menggambar huruf "F"
  fill(0);
  noStroke();
  rect(-40, -100, 20, 200); // Garis vertikal
  rect(-40, -100, 80, 20);  // Garis horizontal atas
  rect(-40, -25, 80, 20);   // Garis horizontal tengah
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    angle -= PI / 30; // Putar berlawanan arah jarum jam
  } else if (key == 'd' || key == 'D') {
    angle += PI / 30; // Putar searah jarum jam
  } else if (key == 'w' || key == 'W') {
    posY -= 10; // Gerak ke atas
  } else if (key == 's' || key == 'S') {
    posY += 10; // Gerak ke bawah
  } else if (key == 'j' || key == 'J') {
    posX -= 10; // Gerak ke kiri
  } else if (key == 'l' || key == 'L') {
    posX += 10; // Gerak ke kanan
  } else if (key == 'i' || key == 'I') {
    scaleFactor += 0.1; // Perbesar
  } else if (key == 'k' || key == 'K') {
    scaleFactor -= 0.1; // Perkecil
    if (scaleFactor < 0.1) {
      scaleFactor = 0.1; // Mencegah perkecilan berlebihan
    }
  }
}
