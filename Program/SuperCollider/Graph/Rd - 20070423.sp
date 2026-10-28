/* 20070423 ; rd ; requires=kr */
let eggcrate = { :x :y | x.pi.cos * y.pi.sin };
let p = [64 72 96 128 256 6400 7200 8400 9600];
let x = brownNoise();
let y = brownNoise();
let t = dust(2.4);
let f = linLin(eggcrate(x, y), -1, 1, tChoose(t, p), tChoose(t, p));
let a = linLin(x, -1, 1, 0, 0.1);
eqPan(sinOsc(f.kr, 0), y.kr) * a.kr
