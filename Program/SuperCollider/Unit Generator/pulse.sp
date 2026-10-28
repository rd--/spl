/* pulse */
pulse(mouseX(100, 200, 1, 0.2), 0.5) * 0.1

/* pulse ; https://nathan.ho.name/posts/integer-ring-modulation/ */
let freq = 100;
pulse(freq, 0.5) * pulse(freq * linLin(lfTri(0.3, 1.pi), -1, 1, 1, 20).round(1), 0.5) * 0.1

/* pulse ; interference */
pulse([100, 100.1], 0.5).sum * 0.1

/* pulse ; envelope */
sinOsc(234, 0) * lag((pulse(mouseX(3.14, 23, 1, 0.2), mouseY(0.23, 0.78, 1, 0.2)) > 0), 0.01) * 0.1
