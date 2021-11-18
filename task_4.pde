Planet sun;

Planet mercury;
Planet mercuryMoon;

Planet earth;
Planet earthMoon1;
Planet earthMoon2;

Planet mars;
Planet marsMoon;

Planet saturn;
Planet saturnMoon1;
Planet saturnMoon2;
Planet saturnMoon3;

Planet chickenPlanet;

PShape chicken;

PImage sunImage;

PVector planetVector;
     

void setup() {
    //fullScreen();

    sunImage = loadImage("sun.jpg");

    chicken = loadShape("10864_rotisserie_chicken_v2_L3.obj");
    chicken.scale(0.7);

    size(1280, 800, P3D);

    sun = new Planet(35, 0, 254, 172, 0, 0, false, false, sunImage);

    mercury = new Planet(10, 70, 157, 157, 157, 0.035, true, false, null);
    mercuryMoon = new Planet(5, 20, 255, 20, 20, 0.05, false, false, null);

    earth = new Planet(20, 145, 10, 255, 140, 0.015, false, false, null);
    earthMoon1 = new Planet(4, 30, 157, 157, 157, 0.03, false, false, null);
    earthMoon2 = new Planet(6, 45, 180, 180, 180, 0.02, false, false, null);

    mars = new Planet(15, 220, 195, 0, 5, 0.01, false, false, null);
    marsMoon = new Planet(5, 30, 255, 180, 255, 0.025, false, false, null);

    saturn = new Planet(45, 365, 32, 54, 120, 0.005, false, false, null);
    saturnMoon1 = new Planet(9, 60, 200, 200, 200, 0.035, false, false, null);
    saturnMoon2 = new Planet(8, 80, 100, 100, 100, 0.025, false, false, null);
    saturnMoon3 = new Planet(7, 100, 0, 0, 255, 0.015, false, false, null);

    chickenPlanet = new Planet(0, 500, 0, 0, 0, 0.01, false, true, null);

    chickenPlanet.addObj(chicken);

    sun.addPlanet(mercury);
    sun.addPlanet(earth);
    sun.addPlanet(mars);
    sun.addPlanet(saturn);
    sun.addPlanet(chickenPlanet);

    mercury.addPlanet(mercuryMoon);

    earth.addPlanet(earthMoon1);
    earth.addPlanet(earthMoon2);

    mars.addPlanet(marsMoon);

    saturn.addPlanet(saturnMoon1);
    saturn.addPlanet(saturnMoon2);
    saturn.addPlanet(saturnMoon3);
}

void draw() {
    background(1, 0, 32);
    camera(mouseX, mouseY, (height/2.3) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, 1, 0);

    planetVector = mercury.getVector();

    pointLight(254, 255, 0, 0, 0, 0);
    directionalLight(170, 170, 20, 1, 0, 0);
    spotLight(255, 0, 0, planetVector.x, planetVector.y, 0 , 0, -1, 0, PI/2, 2);
    
    sun.show();
    sun.orbit();
}
