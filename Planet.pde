import java.util.*;

class Planet {
  float radius;
  float distance;
  float angle;
  int red;
  int green;
  int blue;
  float orbitSpeed;
  Planet[] planets = new Planet[5];
  int planetsAdded = 0;
  PVector v;
  PShape s;
  PShape globe;
  boolean ifBox;
  boolean ifShape;
  
  Planet(float r, float d, int _r, int _g, int _b, float o, boolean _ifBox, boolean _ifShape, PImage img) {
    v = PVector.random3D();

    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    red = _r;
    green = _g;
    blue = _b;
    orbitSpeed = o;
    ifBox = _ifBox;
    ifShape = _ifShape;

    emissive(red, green, blue);

    if (img != null) {
      noStroke();
      noFill();
      globe = createShape(SPHERE, radius);
      globe.setTexture(img);
    }
  }

  PVector getVector() {
    return v;
  }

  void addPlanet(Planet planet) {
    planets[planetsAdded] = planet;
    planetsAdded += 1;
  }

  void addObj(PShape shape){
    s = shape;
  }
  
  void orbit() {
    angle += orbitSpeed;
    if (planets != null) {
      for(int i = 0; i < planetsAdded; i++) {
        planets[i].orbit(); 
      }
    }
  }

  void show() {
    pushMatrix();

    noStroke();  
  
    PVector v2 = new PVector(0,0,1);
    PVector p = v.cross(v2);

    rotate(angle, p.x, p.y, p.z);

    boolean debug = false;

    if (debug) {
      stroke(255);
      line(0, 0, 0, v.x, v.y, v.z);
      line(0, 0, 0, p.x, p.y, p.z);
    }

    translate(v.x, v.y, v.z);
    noStroke();
    fill(red, green, blue);

    specular(204, 102, 0);

    if (ifBox) {
      box(radius);
    }
    else if (ifShape) {
      shape(s);
    }
    else if (globe != null) {
      shape(globe);
    }
    else {
      specular(255, 255, 255);
      sphere(radius); 
    }
    

    if (planets != null) {
      for(int i = 0; i < planetsAdded; i++) {
        noStroke();
        planets[i].show();
      }
    }

    popMatrix();
  }
}
