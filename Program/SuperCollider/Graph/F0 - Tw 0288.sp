/* http://sccode.org/1-4Qy (F0) ; 0288 */
let b = [1 .. 4];
let c = b + 8;
let f = selectX(
	sinOscFb(0.1, 0) % (sinOscFb(b, 0)) * c,
	dc(':.UODD.Ed'.ascii.midiCps)
);
sinOscFb(f, sinOscFb(1 / c, 0)).splay / 3

/* Notes:

`ascii` derives note number from character encodings:

```
>>> ':.UODD.Ed'.ascii
[58 46 85 79 68 68 46 69 100]
```
*/
