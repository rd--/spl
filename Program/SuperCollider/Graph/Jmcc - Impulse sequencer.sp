/* impulse sequencer (Jmcc) Sc2 */
let t = impulse(8, 0);
let seq = { :s | t * demand(t, 0, dseq(Infinity, s)) };
let cSeq = seq([1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0]);
let dSeq = seq([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0]);
let nSeq = seq([1.0, 0.1, 0.1, 1.0, 0.1, 1.0, 0.1, 0.1]);
let bSeq = seq([1, 0, 0.2, 0, 0.2, 0, 0.2, 0]);
let c = decay2(cSeq, 0.001, 0.3) * sinOsc(1700, 0) * 0.1;
let d = decay2(dSeq, 0.001, 0.3) * sinOsc(2400, 0) * 0.04;
let n = decay2(nSeq, 0.001, 0.25) * brownNoise() * 0.1;
let b = decay2(bSeq, 0.001, 0.5) * sinOsc(100, 0) * 0.2;
c + d + n + b
