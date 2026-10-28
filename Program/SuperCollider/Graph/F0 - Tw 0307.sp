/* http://sccode.org/1-4Qy (F0) ; 0307 */
let a = 2 + blip(3 / [8, 9], 2).round(1);
let c = a ^ lag(a, 0.1);
let o = blip(
	duty(
		1 / [9, 8],
		0,
		dseq(Infinity, 'AVVVF'.ascii.midiCps / a)
	),
	c
) * (c + 5);
combN(o, 0.2, 0.2, 1).tanh * 0.15

/* Notes:

`ascii` answers the Ascii byte encoding of a `String`:

```
>>> 'AVVVF'.ascii
[65 86 86 86 70]
```
*/
