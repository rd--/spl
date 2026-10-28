/* svfBp ; changing F (slowly) */
let f = xLine(20, 20000, 20);
svfBp(whiteNoise() * 0.1, f, 1)

/* svfBp ; changing Q (slowly) */
let q = line(2, 0.0001, 20);
svfBp(whiteNoise() * 0.1, 400, q)

/* svfBp ; modulating F */
let f = sinOsc(xLine(0.7, 300, 20), 0) * 3600 + 4000;
svfBp(saw(200) * 0.1, f, 1)
