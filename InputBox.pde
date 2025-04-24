class InputBox {
  float x, y, w, h;
  String text = "";
  boolean aktiv = false;

  InputBox(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void vis() {
    fill(aktiv ? 240 : 220);
    stroke(0);
    rect(x, y, w, h);
    fill(0);
    textAlign(LEFT, CENTER);
    text(text, x + 10, y + h / 2);
  }

  void mousePressed(float mx, float my) {
    aktiv = (mx > x && mx < x + w && my > y && my < y + h);
  }

  void keyPressed(char key, int keyCode) {
    if (!aktiv) return;
    if (key == BACKSPACE && text.length() > 0) {
      text = text.substring(0, text.length() - 1);
    } else if (key != CODED && key != ENTER && key != RETURN) {
      text += key;
    }
  }

  String getText() {
    return text.trim();
  }
}
