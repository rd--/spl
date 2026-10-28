/* svfLp ; changing F */
let f = xLine(20, 20000, 20);
svfLp(whiteNoise() * 0.1, f, 1)

/* svfLp ; changing Q */
let q = line(2, 0.0001, 20);
svfLp(whiteNoise() * 0.1, 400, q)

/* svfLp */
let f = sinOsc(xLine(0.7, 300, 20), 0) * 3600 + 4000;
svfLp(saw(200) * 0.1, f, 1)
