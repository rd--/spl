/* http://sccode.org/1-4Qy (F0) ; 0232 ; requires=pyramid */
let b = [4, 3];
let q = [1 .. 9].fibonacci.pyramid(1) * 99;
let o = sinOsc(duty(1 / b, 0, dseq(Infinity, q)), 0);
let e = sinOsc(b / 9, 0);
let d = sinOsc(b / 999, 0).abs + 0.01;
combC(o * e, 1.01, d, 9).tanh / 2

/* Notes:

`pyramid` applies a counting algorithm to a sequence:

```
>>> [1 .. 9].fibonacci.pyramid(1)
[
	1
	1 1
	1 1 2
	1 1 2 3
	1 1 2 3 5
	1 1 2 3 5 8
	1 1 2 3 5 8 13
	1 1 2 3 5 8 13 21
	1 1 2 3 5 8 13 21 34
]
```
*/
