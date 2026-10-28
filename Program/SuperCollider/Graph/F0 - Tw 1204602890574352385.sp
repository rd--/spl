/* http://twitter.com/redFrik/status/1204602890574352385 */
let c = 1 + 1;
let d = 1 / ([1 .. 11] + 1) / 1;
let p = varSaw([11 - 1, 11 << 1, 11, 11 >> 1, 11 + 1] ^ (varSaw(11.1, 1, 1 / 11) + 1.11111111), 0, 0.5);
let q = varSaw(d, d, 1 / 11) * varSaw(1.11 / d, 1, 1.1 - d) * 11 + 1;
let r = (varSaw(d * 11 / 111, 1, 1 / c) + (1.1 / c)).max(0);
let z = combN((p * q).cos, d, d + 1 / (111 >> 1), r) / c;
leakDc(lpf(combN(z, c, c / 11 / d, 1).splay, 11111), 0.995).sin * 0.5
