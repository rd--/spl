{- Ascension ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #1 -}
Pan2(Rlpf(PinkNoise(), Phasor(1, (1 .. 8) / 200, 20, 20000, 0), 0.05).Sum, 0, 0.1)

{- Nostalgic sci-fi music ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #2 -}
CombC(SinOsc(LfNoise2([1, 1, 1, 1] * 0.1) * 440 + ([1, 2] * 440), 0).Sum * 0.01, 0.2, [0.13, 0.2], 15)

{- Busy forest ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #3 -}
CombC(Formant(LfNoise0([1, 0.7]) * 8 + 9, LfNoise0([1, 0.7]) * 4000 + 4000, 200) * 0.3, 0.2, 0.2, 1)

{- Inverted saw ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #4 -}
Pan2(Saw(LfNoise1(1) * 1000 + 1200) * FSinOsc(SampleRate() / 2, 1), 0, 0.3)

{- Hedge trimmer ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #5 -}
Pan2(Bpf(PinkNoise(), (1 .. 64) * (LfNoise2(4) * 30 + 100), 0.01).Sum, 0, 0.6)

{- Spectral harp ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #6 -}
let p = SinOsc(1760, 0) * [0.01, 0.01];
p + CombC(p, 0.1, LfNoise1(0.5) * 0.1 + 0.1, -10)

{- Spectral harp ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #6 ; edit (Rd) -}
let p = SinOsc(1760, 0) * [0.01, 0.01];
p + CombC(p, 0.1, LfNoise1(0.5) * 0.1 + 0.1, [-10, 10])

{- Fm curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7a -}
SinOsc(1, SinOsc(333, SinOsc(143, 0) * (LfNoise2(0.2 ! 2) * 100 + 110))) * 0.1

{- Fm curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7b -}
SinOsc(1, SinOsc(33, SinOsc(1403, 0) * (LfNoise2(0.2 ! 2) * 10 + 11)) * 10) * 0.1

{- Fm curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7c -}
SinOsc(1, SinOsc(14003, 0) * (LfNoise2(0.2 ! 2) * 100 + 101)) * 0.1

{- Fm curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7d -}
SinOsc(2, SinOsc(6003, 0) * (LfNoise2(1 ! 2) * 200 + 201)) * 0.1

{- Fm curio ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #7e -}
SinOsc(0, SinOsc(9005, 0) * (LfNoise2(1 ! 2) * 100 + 101)) * 0.1

{- Blizzard ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #8 ; edit (rd) -}
let f = 0.2 ! 8;
Bpf(PinkNoise() * 0.2, LfNoise1(f) * 1000 + 1040, LfNoise1(f) * 0.3 + 0.31).Splay

{- Fey emissions ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #9 -}
let d = Dust(2 ! 2);
CombN(Bpf(d, LfNoise0(10) * 3000 + 3040, 0.001) * 200, 0.2, 0.2, 5)

{- Sine slurps ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #10 -}
SinOsc(0, Bpf(Dust(10 ! 2) * 20000, LfNoise1(10 ! 2) * 4000 + 4000, 0.1)) * 0.2

{- Noise slurps ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #11 -}
SinOsc(0, Bpf(WhiteNoise(2) * 1000, LfNoise1(0.1 ! 2) * 2000 + 4000, 0.001)) * 0.1

{- feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12a -}
let p = Saw(440 + [0, 0.2]) * 0.02;
p + CombC(p, 0.1, LfNoise0(10) * 0.08 + 0.08, -10000)

{- Feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12b -}
let p = Saw(440 + [0, 0.2]) * 0.02;
p + CombC(p, 0.1, LfNoise1(10) * 0.08 + 0.08, -10000)

{- Feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12c -}
let p = PinkNoise(2) * 0.03;
p + CombC(p, 0.2, LfNoise0(1) * 0.2 + 0.2, -10000)

{- Feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12d -}
let p = WhiteNoise(2) * 0.02;
p + CombC(p, 0.1, LfNoise1(10) * 0.08 + 0.08, -10000)

{- Feedback racket ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #12e -}
let p = Dust2(200 ! 2) * 0.2;
p + CombC(p, 0.4, LfNoise0(2) * 0.4 + 0.4, -10000)

{- Trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13a -}
let p = [1, 3, 5];
Pan2(SinOsc(800 * (SinOsc(p * 0.1, 0) / p).RoundTo(1 / 6).Sum, 0), 0, 0.2)

{- Trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13b -}
let p = [1, 2] + 0.01;
Pan2(SinOsc(1000 * Lag((LfSaw(p * 0.4, 0) / p).RoundTo(1 / 6), 0.002).Sum, 0), 0, 0.2)

{- trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13c -}
let p = [0.5, 1, 2];
Pan2(SinOsc(1000 * Lag((LfSaw(p * 0.4, 0) / p).RoundTo(1 / 8), 0.002).Sum, 0), 0, 0.2)

{- trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13d -}
let p = [1, 2] + 0.04;
Pan2(SinOsc(1400 * Lag((LfTri(p * 0.2, 0) / p).RoundTo(1 / 8), 0.002).Sum, 0), 0, 0.2)

{- trills ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #13e -}
let p = [1, 4] + 0.01;
Pan2(SinOsc(1400 * Lag((LfTri(p * 0.2, 0) / p).RoundTo(1 / 8), 0.002).Sum, 0), 0, 0.2)

{- short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14a -}
Pan2(SinOsc(Lpf(Stepper(Impulse(80, 0), 0, 1, 512, 84, 0), 1000) * 20, 0), 0, 0.2)

{- short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14b -}
Pan2(SinOsc(Lpf(Stepper(Impulse(10, 0), 0, 1, 12, [3, 4, 10], 1), 1000) * 100, 0).Sum, 0, 0.2)

{- short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14c -}
Pan2(SinOsc(Lpf(Stepper(Impulse(10, 0), 0, 1, 16, [4, 7, 10, 12], 1), 1000) * 70, 0).Sum, 0, 0.2)

{- short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14d -}
Pan2(SinOsc(Lpf(Stepper(Impulse(10, 0), 0, 1, 16, [3, 7, 10, 11], 1), 1000) * 90, 0).Sum, 0, 0.2)

{- short-loops ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #14e -}
Pan2(SinOsc(Rlpf(Stepper(Impulse(8, 0), 0, 1, 8, [1, 2, 3], 1), 1000, 0.01) * 200, 0).Sum, 0, 0.1)

{- saw scratching ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #15 -}
Pan2(CombC(LfSaw([0.49, 1, 1.51, 1.89] * 200, 0) * 0.1, 1, Clip(Rlpf(LfNoise2(0.1) * 0.4 + 0.6, 10, 1.1), 0.21, 1), 15).Sum, 0, 1)

{- shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16a -}
Pan2(CombC(SinOsc(100, 0), 2, LfTri(1.1389, 0) * 0.5 + 1.4, 80), 0, 0.1)

{- shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16b -}
Pan2(CombC(SinOsc(200, 0), 2, LfNoise1(13.8389 * LfSaw(0.1, 0) + 14) * 0.5 + 1.4, 20), 0, 0.1)

{- shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16c -}
Pan2(CombC(SinOsc(100, 0), 2, LfTri(LfNoise0(0.2) + 1, 0) * 0.6 + 1.4, 80), 0, 0.1)

{- shifty feedback ; https://w2.mat.ucsb.edu/l.putnam/sc3one/index.html #16d -}
Pan2(CombC(SinOsc(200, 0), 2, LfTri(LfSaw(pi / 9, 0) * 9 + 9, 0) * 0.1 + 1.9, 20), 0, 0.1)
