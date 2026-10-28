/* http://glicol.org/demo#ontherun ; requires=vbJonVerb */
let tr = impulse(12, 0);
let seq = demand(tr, 0, dseq(Infinity, [40, 43, 45, 43, 50, 48, 50, 52]));
let osc = pulse(seq.midiCps, 0.5);
let env = decay2(tr, 0.05, 0.25);
let flt = rlpf(osc * env, sinOsc(0.2, 0) * 1200 + 1500, 1) * 0.1;
vbJonVerb(flt, 0.1, 0.3, 0.8, 0.15, 0.25) + flt

/* Notes:

An alternate reverb, if `vbJonVerb` is not available, would be:

~~~
gVerb(flt, 25, 0.75, 0.5, 0.5, 15, 1, 0.3, 0.3, 300)
~~~
*/
