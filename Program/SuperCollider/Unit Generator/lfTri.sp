/* lfTri ; phase value = (0, 4), offset to lowest and midpoint ascending */
lfTri(110, 4 * [0.75, 0]) * 0.1

/* lfTri ; as modulator */
lfTri(mouseX(10, 60, 0, 0.2), 0.5) * sinOsc(780,0) * 0.05
