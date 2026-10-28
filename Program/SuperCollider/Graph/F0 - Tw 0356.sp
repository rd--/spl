/* http://sccode.org/1-4Qy (F0) ; 0356 ; requires=BHiPass4,BLowPass4 */
let b = [4 16 3];
let o = lfTri(b, 0) * lfTri(b * b, 0);
let f1 = 8 ^ lfTri(b / 50, 0).round(1) * 99;
let f2 = 3 ^ lfTri(1 / b, 0) * 99;
bHiPass4(bLowPass4(o, f1, 1), f2, 0.1).splay.sin
