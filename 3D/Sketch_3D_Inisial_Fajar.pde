float angleX = 0;
float angleY = 0;
float angleZ = 0;
float step = 0.01;
float sensitivity = 0.005;
float prevMouseX = 0;
float prevMouseY = 0;
boolean selected = false;

void setup() {
  size(800, 600, P3D);
}

void draw() {
  background(255);
  lights();
  translate(width/2, height/2);
  
  // Jika objek dipilih dan ditekan, maka izinkan rotasi dengan mouse
  if (selected) {
    // Menghitung perubahan posisi mouse
    float deltaX = mouseX - prevMouseX;
    float deltaY = mouseY - prevMouseY;
    
    // Menghitung perubahan sudut berdasarkan gerakan mouse
    angleY += deltaX * sensitivity;
    angleX -= deltaY * sensitivity;
    
    // Memperbarui posisi mouse sebelumnya
    prevMouseX = mouseX;
    prevMouseY = mouseY;
  }
  
  // Menerapkan rotasi berdasarkan sudut yang diatur
  rotateX(angleX);
  rotateY(angleY);
  rotateZ(angleZ);
  
  drawLetterF();
}

void drawLetterF() {
  // Menggambar huruf "F" 3D
  fill(0);
  noStroke();

  // Bagian vertikal
  beginShape();
  vertex(-50, -100, -50);
  vertex(-50, -100, 50);
  vertex(-50, 100, 50);
  vertex(-50, 100, -50);
  endShape(CLOSE);

  // Bagian horizontal atas
  beginShape();
  vertex(-50, -100, -50);
  vertex(50, -100, -50);
  vertex(50, -75, -50);
  vertex(-50, -75, -50);
  endShape(CLOSE);

  // Bagian horizontal bawah
  beginShape();
  vertex(-50, 0, -50);
  vertex(50, 0, -50);
  vertex(50, 25, -50);
  vertex(-50, 25, -50);
  endShape(CLOSE);
}

void mousePressed() {
  // Menyimpan posisi mouse saat tombol mouse ditekan
  prevMouseX = mouseX;
  prevMouseY = mouseY;
  
  // Mengecek apakah mouse berada di atas objek
  if (mouseX > width/2 - 50 && mouseX < width/2 + 50 && 
      mouseY > height/2 - 100 && mouseY < height/2 + 100) {
    selected = true; // Objek dipilih
  } else {
    selected = false; // Objek tidak dipilih
  }
}

void mouseReleased() {
  selected = false; // Mengatur ulang status seleksi saat tombol mouse dilepas
}

void keyPressed() {
  if (key == 'q' || key == 'Q') {
    angleZ -= step; // Roll left
  } else if (key == 'e' || key == 'E') {
    angleZ += step; // Roll right
  }
}
