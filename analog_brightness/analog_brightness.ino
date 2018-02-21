const int LED = 9; // the pin for the LED
int val = 0; // variable used to store the value
// coming from the sensor
void setup() {
pinMode(LED, OUTPUT); // LED is as an OUTPUT
// Note: Analogue pins are
// automatically set as inputs
}
void loop() {
val = analogRead(0); // read the value from
// the sensor
if(val>200) {
analogWrite(LED, val/100); 
} else if(val>100) {
  analogWrite(LED, val);
} else if(val>50) {
  analogWrite(LED,val*100);
}
}
