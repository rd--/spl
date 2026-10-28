/* lfPar ; phase value = (0, 4), offset to lowest and midpoint ascending */
lfPar(110, 4 * [0.5, 0.75]) * 0.1

/* lfPar ; as nested frequency modulator */
lfPar(lfPar(lfPar(0.2, 0) * 8 + 10, 0) * 400 + 800, 0) * 0.1

/* lfPar ; as frequency modulator */
lfPar(lfPar(0.2, 0) * 400 + 800, 0) * 0.1

/* lfPar ; frequency sweep */
lfPar(xLine(100, 8000, 30), 0) * 0.1
