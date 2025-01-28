/* http://sccode.org/1-4Qy (F0) ; 0239 */
let b = 0.11 / 1:6;
let q = ' #SuperCollider '.ascii.MidiCps;
let o = LfTri(Duty(b, 0, Dseq(Infinity, q)), 0);
Splay(CombC(o, 4, LfTri(b / 9, 0) % LfTri(b, 0) * 4 % 4, 5) / 6).Tanh

# Notes

_q_ derives frequencies from the Ascii encodings of each letter,
interpreted as midi note numbers:

```
>>> ' #SuperCollider '.ascii
[32 35 83 117 112 101 114 67 111 108 108 105 100 101 114 32]

>>> ' #SuperCollider '.ascii.MidiCps.rounded
[52 62 988 7040 5274 2794 5920 392 4978 4186 4186 3520 2637 2794 5920 52]
```

Plot of note numbers:

~~~
' #SuperCollider '.ascii.discretePlot
~~~
