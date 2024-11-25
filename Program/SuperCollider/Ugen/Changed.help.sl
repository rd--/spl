/* Changed ; simple composition of Hpz1 and > (ie. a Pseudo Ugen) */
let s = LfNoise0(2);
let c = Changed(s, 0);
let d = Decay2(c, 0.01, 0.5);
SinOsc(440 + ([s, d] * 440), 0) * 0.1

/* Changed ; SinOsc is constantly changing */
let s = SinOsc(440, 0);
let c = Changed(s, 0);
s * c * 0.1

/* Changed ; fixed number of sample impulses ; https://fredrikolofsson.com/f0blog/impulse-train/ */
let dur = 1;
let num = 8;
Changed(Sweep(0, num / dur).Min(num).Ceiling, 0)
