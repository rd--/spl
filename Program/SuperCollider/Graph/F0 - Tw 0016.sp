/* http://sccode.org/1-4Qy ; tweet0016 */
let b = bufAlloc(2, 90000).bufClear;
let i = sweep(bufRd(2, b, saw(12) * 30000 + 40000, 1, 2), 90000);
let w = bufWrite(saw([8, 9]), b, i, 1);
(bufRd(2, b, i, 1, 2)  / 2 <! w).transpose.sum
