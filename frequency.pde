import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput in;
FFT lin; 
void setup() {
  colorMode(HSB);
  size(1920,1200);
  background(255);
  minim = new Minim(this);
  in = minim.getLineIn();
  lin = new FFT(in.bufferSize(),in.sampleRate());
  lin.linAverages( 10 );
}      

void draw() {
  //forward fft
  float centerFrequency=0; 
  lin.forward(in.mix);
 // draw the waveforms so we can see what we are monitoring
  for(int i = 0; i < 30; i++)
  {
    
    //here is is where you will plug in values
    fill(93+in.right.get(i)*3000,9+in.right.get(i)*1000,92,63);
    stroke(360+in.right.get(i)*3000,75+in.right.get(i)*1000,92);
    //
    ellipse( 960, 600, 50 + 50+in.left.get(i)*1000, 50);
    ellipse( 960, 600, 50+in.right.get(i)*1000, 50+in.right.get(i+1)*1000 );
    //use in.left.get(i) in this loop to get audio info from the left micropone
    //and in.right.get(i) for the right microphone 
  }
  
  String monitoringState = in.isMonitoring() ? "enabled" : "disabled";
}
