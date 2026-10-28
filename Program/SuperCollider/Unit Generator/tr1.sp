/* tr1 ; c.f. Tr */
[tr1(sinOsc(10, 0)), impulse(10, 0)] * 0.1

/* tr1 */
pinkNoise() * decay2(tr1(sinOsc([13, 19], 0)), 0.01, 0.1) * 0.1
