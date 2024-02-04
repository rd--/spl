# Splay2

Stereo panner.

_Splay2(inList, spread=1, level=1, center=0, levelComp=true)_
_Splay2(inList)_ ⟹ _Splay2(inList, 1, 1, 0, true)_

Splay2 spreads a list of channels across a stereo field.

Mouse control:

```
let freq = 0:9.collect { :i |
	LfNoise2(Rand(10, 20)) * 200 + (i + 3 * 100)
};
Splay2(
	SinOsc(freq, 0),
	MouseY(1, 0, 0, 0.2),
	0.1,
	MouseX(-1, 1, 0, 0.2),
	true
)
```

_Note:_ The Sc Ugen is called _Splay_.

* * *

See also: Pan2, Splay, SplayAz

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Splay.html)
