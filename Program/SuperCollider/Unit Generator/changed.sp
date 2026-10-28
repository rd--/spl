/* changed ; simple composition of hpz1 and > (ie. a Pseudo Ugen) */
let s = lfNoise0(2);
let c = changed(s, 0);
let d = decay2(c, 0.01, 0.5);
sinOsc(440 + ([s, d] * 440), 0) * 0.1

/* changed ; sinOsc is constantly changing */
let s = sinOsc(440, 0);
let c = changed(s, 0);
s * c * 0.1

/* changed ; fixed number of sample impulses ; https://fredrikolofsson.com/f0blog/impulse-train/ */
let dur = 1;
let num = 8;
changed(sweep(0, num / dur).min(num).ceiling, 0)
