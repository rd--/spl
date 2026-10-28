/* Tw 0224 (F0) ; http://www.fredrikolofsson.com/f0blog/?q=node/617 */
let c = 200000;
let b = bufAlloc(2, c).bufClear;
let d = bufRd(2, b, sinOsc([2 3] * 9, 0) * c, 0, 2);
let w = bufWr(b, sinOsc([99 145], 0).abs * c, 1, sinOsc(3 / [2 3], 0) / 3);
d.transpose.mix * 0.5 <! w
