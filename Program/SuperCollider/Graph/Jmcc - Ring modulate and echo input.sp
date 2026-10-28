/* Ring modulate & echo input (Jmcc) #5 ; warning=feedback ; requires=AudioIn */
let x = mouseX(10, 2000, 1, 0.2); /* ring modulator frequency */
let y = mouseY(0, 0.5, 0, 0.2); /* delay time */
let in = audioIn([1, 2]) * 0.4 * sinOsc(x, [0, 0.5.pi]);
combL(in, 0.5, y, 4) + in /* the time for the echo to decay by 60 dB is four seconds */
