/* http://twitter.com/redFrik/status/1143262368392200192 */
let c = 4 / 4 / 4;
let d = c * 4 / 44.4;
let f = (varSaw(d, c, -4.sin) * 4).max(0).ceiling * 44 + 44;
let b = varSaw(f, 4, varSaw([44 - 4, 4, 44 + 4] / 4.44, 0, 0.5)) / 4;
let o = rlpf(varSaw(varSaw(c / 4, c, c).max(0) * 4 + 44, 4, varSaw([4, 4 / 44, c * 4], 0, 0.5).abs), 44 * 44, c);
let q = pitchShift(combC(b, c, c * 4 / f + d, 1), 4 - c, [4 + 4 + 4, 4 * 4, 4 + 4], c, c) * (c + c);
(o * line(0, 1, 4) + q).splay2 / 4
