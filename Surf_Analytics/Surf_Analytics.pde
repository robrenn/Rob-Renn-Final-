/*from Visualizing Data by Ben Fry*/


// introduce table data and objects
FloatTable data;
float dataMin, dataMax;
 

// plot=location??
float plotX1, plotY1;
float plotX2, plotY2;
float labelX, labelY;

//global variables
int rowCount;
int columnCount;
int currentColumn = 0;

int yearMin, yearMax;
int[] years;

int yearInterval = 10; //create spacing between year range
int volumeInterval = 10;
int volumeIntervalMinor = 5;

// define table properties

float[] tabLeft, tabRight;
float tabTop, tabBottom;
float tabPad = 10;

float angle = 0;
float angleVel = 0.2;
float amplitude = 100;

//call tintegrator class
Integrator[] interpolators;

PFont plotFont;

void setup() {
  size(1280, 720);
  data = new FloatTable("milk-tea-coffee.tsv");
  rowCount = data.getRowCount();
  columnCount = data.getColumnCount();
//assign table to objects
  //assign years to table

  years = int(data.getRowNames());
  yearMin = years[0];
  yearMax = years[years.length-1];
  //set years to zero for lowest number
  
  dataMin = 0;
  dataMax = ceil(data.getTableMax() / volumeInterval) * volumeInterval;
// limit numbers from floattable.tsv and store values in varables
  interpolators = new Integrator[rowCount];
  for (int row = 0; row<rowCount; row++) {
    float initialValue = data.getFloat(row, 0);
    interpolators[row] = new Integrator(initialValue);
    interpolators[row].attraction = .1;  }
// assign location to varables, plotting the location of the box
  plotX1 = 120;
  plotX2 = width-80;
  labelX = 50;
  plotY1 = 60;
  plotY2 = height - 70;
  labelY = height-25;
}
// draw the background color and size
void draw() {
background(0);
strokeWeight(2);
noFill();

stroke(tabPad,160,180);
 strokeWeight(.5);
 
beginShape();
for (int x = 0; x <= width; x += 5) {
//Here’s an example of using the map() function instead.
  float y = map(sin(tabPad),-1,1,0,height);
//With beginShape() and endShape(), you call vertex() to set all the vertices of your shape.
  vertex(x/2,y/2);
  tabPad += .2;
   

}
endShape();}