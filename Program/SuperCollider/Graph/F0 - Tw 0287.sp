/* http://sccode.org/1-4Qy (F0) ; 0287 */
let o = saw((':>AEH.'.ascii - (2 ^ lfSaw([1 .. 5] / 32, 0)).ceiling).midiCps);
let e = o % lfSaw([1 1 6], 0) % (lfSaw(2, [1 2] / 8) * 2);
hpf(e.splay, 9) / 2

/* Notes:

`ascii` derives note numbers from character encodings:

```
':>AEH.'.ascii
[58 62 65 69 72 46]
```
*/
