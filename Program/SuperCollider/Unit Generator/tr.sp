/* Tr ; c.f. tr1 */
[tr(sinOsc(10, 0)) > 0, impulse(10, 0)] * 0.1

/* Tr */
pinkNoise() * decay2(tr(sinOsc([13, 19], 0)) > 0, 0.01, 0.1) * 0.1
