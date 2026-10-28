/* http://sccode.org/1-4Qy (F0) ; 0336 */
let d = lfSaw(1 / 9, 0);
let b = bufAlloc(1, 30000).bufClear;
let c = grainBuf(2, d, 24, b, -2, 0, 2, 0, -1, 512);
let o = bpf(saw(d > 0 + 1 / 3 * 99) + c, 99, 4).mean;
c <! bufRec(b, 1, o)
