/* Ring modulate input (Jmcc) #5 ; requires=AudioIn */
let input = audioIn([1, 2]);
let modulatorFrequency = mouseX(10, 4000, 1, 0.2);
let modulator = sinOsc(modulatorFrequency, [0, 0.5.pi]); /* offset phase of one oscillator by ninety degrees */
input * modulator
