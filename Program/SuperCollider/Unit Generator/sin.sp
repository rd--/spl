/* Notes:

Requires bilin

/* ---- sin ; https://scsynth.org/t/6256/7 ; requires=Bilin */
let freq = 130;
let width = LinLin(LfTri(0.1, 0), -1, 1, 0.01, 0.99);
let phasor = Phasor(0, freq * SampleDur(), width.-, 1 - width, 0);
phasor = Bilin(phasor, 0, width.-, 1 - width, 0, -1, 1);
phasor = (phasor.abs * 1.5).wrap(0, 1);
(phasor * 2.pi).sin * 0.1

/* sin ; https://scsynth.org/t/6256/7 ; sinusoid with a variable-slope ramp phase ; requires=Bilin */
let freq = 130;
let width = LinLin(LfTri(0.1, 0), -1, 1, 0.01, 0.99);
let phasor = Phasor(0, freq * SampleDur(), width.-, 1 - width, width.-);
phasor = Bilin(phasor, 0, width.-, 1 - width, 0, -0.5, 1);
phasor = Select2(phasor > 0, 0.5 + phasor, phasor);
(phasor * 2.pi).sin * 0.1

*/
