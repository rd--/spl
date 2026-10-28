/* Ascension ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #1 */
pan2(rlpf(pinkNoise(), phasor(1, [1 .. 8] / 200, 20, 20000, 0), 0.05).sum, 0, 0.1)

/* Nostalgic sci-fi music ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #2 */
combC(sinOsc(lfNoise2([1] # 4 * 0.1) * 440 + ([1 2] * 440), 0).sum * 0.01, 0.2, [0.13, 0.2], 15)

/* Busy forest ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #3 */
combC(formant(lfNoise0([1 0.7]) * 8 + 9, lfNoise0([1 0.7]) * 4000 + 4000, 200) * 0.3, 0.2, 0.2, 1)

/* Inverted saw ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #4 */
pan2(saw(lfNoise1(1) * 1000 + 1200) * fSinOsc(sampleRate() / 2, 1), 0, 0.3)

/* Hedge trimmer ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #5 */
pan2(bpf(pinkNoise(), [1 .. 64] * (lfNoise2(4) * 30 + 100), 0.01).sum, 0, 0.6)

/* Spectral harp ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #6 */
let p = sinOsc(1760, 0) * [0.01, 0.01];
p + combC(p, 0.1, lfNoise1(0.5) * 0.1 + 0.1, -10)

/* Spectral harp ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #6 ; edit (Rd) */
let p = sinOsc(1760, 0) * [0.01, 0.01];
p + combC(p, 0.1, lfNoise1(0.5) * 0.1 + 0.1, [-10, 10])

/* Fm curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7a */
sinOsc(1, sinOsc(333, sinOsc(143, 0) * (lfNoise2([0.2] # 2) * 100 + 110))) * 0.1

/* Fm curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7b */
sinOsc(1, sinOsc(33, sinOsc(1403, 0) * (lfNoise2([0.2] # 2) * 10 + 11)) * 10) * 0.1

/* Fm curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7c */
sinOsc(1, sinOsc(14003, 0) * (lfNoise2([0.2] # 2) * 100 + 101)) * 0.1

/* Fm curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7d */
sinOsc(2, sinOsc(6003, 0) * (lfNoise2([1] # 2) * 200 + 201)) * 0.1

/* Fm curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7e */
sinOsc(0, sinOsc(9005, 0) * (lfNoise2([1] # 2) * 100 + 101)) * 0.1

/* Blizzard ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #8 ; edit (rd) */
let f = [0.2] # 8;
bpf(pinkNoise() * 0.2, lfNoise1(f) * 1000 + 1040, lfNoise1(f) * 0.3 + 0.31).splay

/* Fey emissions ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #9 */
let d = dust([2 2]);
combN(bpf(d, lfNoise0(10) * 3000 + 3040, 0.001) * 200, 0.2, 0.2, 5)

/* Sine slurps ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #10 */
sinOsc(0, bpf(dust([10 10]) * 20000, lfNoise1([10 10]) * 4000 + 4000, 0.1)) * 0.2

/* Noise slurps ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #11 */
sinOsc(0, bpf(whiteNoise([1000] # 2, 0), lfNoise1([0.1] # 2) * 2000 + 4000, 0.001)) * 0.1

/* feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12a */
let p = saw(440 + [0, 0.2]) * 0.02;
p + combC(p, 0.1, lfNoise0(10) * 0.08 + 0.08, -10000)

/* Feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12b */
let p = saw(440 + [0, 0.2]) * 0.02;
p + combC(p, 0.1, lfNoise1(10) * 0.08 + 0.08, -10000)

/* Feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12c */
let p = pinkNoise([0.03] # 2, 0);
p + combC(p, 0.2, lfNoise0(1) * 0.2 + 0.2, -10000)

/* Feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12d */
let p = whiteNoise([0.02] # 2, 0);
p + combC(p, 0.1, lfNoise1(10) * 0.08 + 0.08, -10000)

/* Feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12e */
let p = dust2([200] # 2) * 0.2;
p + combC(p, 0.4, lfNoise0(2) * 0.4 + 0.4, -10000)

/* Trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13a */
let p = [1, 3, 5];
pan2(sinOsc(800 * (sinOsc(p * 0.1, 0) / p).round(1 / 6).sum, 0), 0, 0.2)

/* Trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13b */
let p = [1, 2] + 0.01;
pan2(sinOsc(1000 * lag((lfSaw(p * 0.4, 0) / p).round(1 / 6), 0.002).sum, 0), 0, 0.2)

/* trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13c */
let p = [0.5, 1, 2];
pan2(sinOsc(1000 * lag((lfSaw(p * 0.4, 0) / p).round(1 / 8), 0.002).sum, 0), 0, 0.2)

/* trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13d */
let p = [1, 2] + 0.04;
pan2(sinOsc(1400 * lag((lfTri(p * 0.2, 0) / p).round(1 / 8), 0.002).sum, 0), 0, 0.2)

/* trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13e */
let p = [1, 4] + 0.01;
pan2(sinOsc(1400 * lag((lfTri(p * 0.2, 0) / p).round(1 / 8), 0.002).sum, 0), 0, 0.2)

/* short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14a */
pan2(sinOsc(lpf(stepper(impulse(80, 0), 0, 1, 512, 84, 0), 1000) * 20, 0), 0, 0.2)

/* short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14b */
pan2(sinOsc(lpf(stepper(impulse(10, 0), 0, 1, 12, [3, 4, 10], 1), 1000) * 100, 0).sum, 0, 0.2)

/* short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14c */
pan2(sinOsc(lpf(stepper(impulse(10, 0), 0, 1, 16, [4, 7, 10, 12], 1), 1000) * 70, 0).sum, 0, 0.2)

/* short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14d */
pan2(sinOsc(lpf(stepper(impulse(10, 0), 0, 1, 16, [3, 7, 10, 11], 1), 1000) * 90, 0).sum, 0, 0.2)

/* short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14e */
pan2(sinOsc(rlpf(stepper(impulse(8, 0), 0, 1, 8, [1, 2, 3], 1), 1000, 0.01) * 200, 0).sum, 0, 0.1)

/* saw scratching ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #15 */
pan2(combC(lfSaw([0.49, 1, 1.51, 1.89] * 200, 0) * 0.1, 1, rlpf(lfNoise2(0.1) * 0.4 + 0.6, 10, 1.1).clip(0.21, 1), 15).sum, 0, 1)

/* shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16a */
pan2(combC(sinOsc(100, 0), 2, lfTri(1.1389, 0) * 0.5 + 1.4, 80), 0, 0.1)

/* shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16b */
pan2(combC(sinOsc(200, 0), 2, lfNoise1(13.8389 * lfSaw(0.1, 0) + 14) * 0.5 + 1.4, 20), 0, 0.1)

/* shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16c */
pan2(combC(sinOsc(100, 0), 2, lfTri(lfNoise0(0.2) + 1, 0) * 0.6 + 1.4, 80), 0, 0.1)

/* shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16d */
pan2(combC(sinOsc(200, 0), 2, lfTri(lfSaw(1/9.pi, 0) * 9 + 9, 0) * 0.1 + 1.9, 20), 0, 0.1)
