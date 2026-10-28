/* http://sccode.org/1-4Qy (F0) ; 0360 */
let t = sinOsc([7.992, 8], 0);
let e = perc(t, 0.005, 0.2, -4);
let f = [1, 2].collect { :i |
	let q = [
		dseq(240, '@BGIJB@IGBJI'.ascii),
		dseq(120, '@LEGJLEG'.ascii),
		dseq(60, 'EGJL'.ascii)
	];
	demand(t[i], 0, dseq(1, q)).midiCps
};
let x = sinOsc(f, sinOsc(1 / [12, 9], 0) / 4 + 1 * sinOsc(f, e.pi)) * e / 2;
freeVerb2(x[1], x[2], 0.1, 1, 0)

/* Notes:

`ascii` derives note numbers from character encodings:

```
>>> '@BGIJB@IGBJI'.ascii
[64 66 71 73 74 66 64 73 71 66 74 73]

>>> '@LEGJLEG'.ascii
[64 76 69 71 74 76 69 71]

>>> 'EGJL'.ascii
[69 71 74 76]
```
*/
