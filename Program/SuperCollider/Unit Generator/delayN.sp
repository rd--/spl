/* delayN ; phase-shifting ; mouse delay control */
let p = sinOsc([440, 441], [0, 1.pi]) * 0.1;
let q = delayN(sinOsc([440, 441], [1.pi, 0]), controlDur() * 2, mouseX(0, controlDur() * 2, 0, 0.2)) * 0.1;
p + q
