InputBox inputBox;
Button gemKnappen;
Button næsteTrinKnappen;
RekursivVisualizer visualizer;

void setup() {
  size(1000, 700);
  textFont(createFont("Arial", 16));
  
  inputBox = new InputBox(50, 50, 400, 40);
  gemKnappen = new Button("Gem funktion", 50, 110, 150, 30);
  næsteTrinKnappen = new Button("Næste trin", 550, 50, 150, 30);
  
  visualizer = new RekursivVisualizer();
}

void draw() {
  background(255);
  line(width / 2, 0, width / 2, height);  // den som deler skærmen i to

 inputBox.vis();           // denne viser der hvor man skal skrive lingning
 gemKnappen.vis();        // her kan man gemme funktion
 næsteTrinKnappen.vis(); // og denne kan vise det næste trin 

  visualizer.vis();      // denne viser "stamtræet"
}

void mousePressed() {
  inputBox.mousePressed(mouseX, mouseY);

  if (gemKnappen.erKlikket(mouseX, mouseY)) {
    visualizer.setFunktion(inputBox.getText());
  }

  if (næsteTrinKnappen.erKlikket(mouseX, mouseY)) {
    visualizer.næsteTrin();
  }
}

void keyPressed() {
  inputBox.keyPressed(key, keyCode);
}
