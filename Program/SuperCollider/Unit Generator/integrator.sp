/* integrator ; out(0) = in(0) + (coef * out(-1)) */
integrator(lfPulse(300, 0.2, 0.1), mouseX(0.001, 0.999, 1, 0.2)) * 0.1

/* integrator ; as envelope */
integrator(lfPulse(3, 0.2, 0.0004), mouseX(0.996, 0.999, 1, 0.2)) * fSinOsc(700, 0) * 0.1

/* integrator ; as envelope */
let tr = lfPulse(mouseX(3, 21, 1, 0.2), 0.2, 0.0004);
integrator(tr, tRand(0.996, 0.999, tr)) * fSinOsc(700, 0) * 0.1

/* integrator ; https://nathan.ho.name/posts/feedback-integrator-networks/ ; blockSize=1 */
let n = 8;
let fixed = false;
let snd = impulse(0, 0);
snd := snd + localIn(n, 0);
snd := integrator(snd, 0.99);
snd := { { fixed.if { rand(-1, 1) } { lfNoise2(1.pi) } * 1000 } ! n } ! n * snd;
snd := snd.sum;
snd := leakDc(snd, 0.995);
snd := snd.bilateralClip(1);
snd.splay <! localOut(snd) * 0.1
