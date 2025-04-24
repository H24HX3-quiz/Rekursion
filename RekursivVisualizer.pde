class RekursivVisualizer {
  String funktion = "f(n) = f(n-1) + f(n-2)";
  int nuværendeDybde = 0;
  int maksDybde = 0;

  // Sætter funktionen og initialiserer dybden
  void setFunktion(String nyFunktion) {
    funktion = nyFunktion;
    nuværendeDybde = 0;
    maksDybde = 10;  // Standard maks dybde - kan justeres
  }

  // Går til næste trin (øger dybden)
  void næsteTrin() {
    if (nuværendeDybde < maksDybde) {
      nuværendeDybde++;
    }
  }

  // Tegner visualiseringen af funktionen
  void vis() {
    fill(0);
    textAlign(LEFT, CENTER);
    text("Funktion: " + funktion, 500, 100);
    text("Viser trin: " + nuværendeDybde, 500, 130);

    tegnTræ(nuværendeDybde, width * 3 / 4, 200, 1.0);
  }

  // Rekursiv funktion der tegner træet
  void tegnTræ(int n, float x, float y, float skala) {
    if (n < 0) return;

    // Tegn node
    fill(150, 200, 255);
    ellipse(x, y, 40, 40);
    fill(0);
    text("f(" + n + ")", x, y);

    if (n <= 1) return;

    float afstand = 100 * skala;
    float x1 = x - afstand;
    float y1 = y + 80;
    float x2 = x + afstand;
    float y2 = y + 80;

    // Tegn linjer til næste niveau
    line(x, y + 20, x1, y1 - 20);
    line(x, y + 20, x2, y2 - 20);

    // Rekursivt kald for n-1 og n-2
    tegnTræ(n - 1, x1, y1, skala * 0.8);
    tegnTræ(n - 2, x2, y2, skala * 0.8);
  }
}
