/* mouseX ; k random sine tones across stereo field, mouseX selects which to listen to ; https://scsynth.org/t/5722/4 */
let k = 20;
let mouseX = mouseX(0, k, 0, 0.2);
let select = [0 .. k].collect { :i | mouseX > i };
let note = { [0, 2, 3, 5, 7, 9, 10].atRandom + [48, 60].atRandom } ! k;
let osc = sinOsc(note.midiCps, 0) * select * 0.05;
osc.splay

/* mouseX ; as above with reset ; rate is slower the more tones are audible */
let k = 20;
let mouseX = mouseX(0, k, 0, 0.2);
let reset = lfNoise2(k * 2 / (mouseX + 1)).kr;
let select = [0 .. k].collect { :i | mouseX > i };
let note = { tChoose(reset, [0 2 3 5 7 9 10]) + tChoose(reset, [48 60]) } ! k;
let osc = sinOsc(note.midiCps, 0) * select * 0.05;
osc.splay

/* Mouse control of impulse frequency */
impulse([4 5 9] * mouseX(0.01, 150, 1, 0.2), 0).splay2 * 0.2
