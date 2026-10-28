/* cuspL ; frequency control */
let x = mouseX(0.9, 1.1, 0, 0.1);
let y = mouseY(1.8, 2.0, 0, 0.1);
let n = cuspL([30, 40], x, y, 0) * 0.3;
sinOsc(n * [700, 800] + 900, 0) * 0.1
