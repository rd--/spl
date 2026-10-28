/* Analog bubbles with mouse control (Jmcc) #3 */
let o1 = lfSaw(mouseX(2, 40, 1, 0.2), 0) * -3 + 80;
let o2 = lfSaw(mouseY(0.1, 10, 1, 0.2), 0) * 24 + o1;
combN(sinOsc(o2.midiCps, 0) * 0.04, 0.2, 0.2, 2)
