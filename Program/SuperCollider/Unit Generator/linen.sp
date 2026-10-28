/* linen ; note .kr only */
let r = mouseX(1 / 3, 10, 0, 0.2);
sinOsc(440, 0) * linen(impulse(r, 0).kr, 0, 0.1, 1 / r, 0)
