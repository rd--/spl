# Splay2 -- stereo panner

_Splay2(inArray, spread=1, level=1, center=0, levelComp=true)_
_Splay2(inArray)_ ⟹ _Splay2(inArray, 1, 1, 0, true)_

Splay2 spreads an array of channels across a stereo field.

Mouse control:

```
var freq = (0 .. 9).collect { :i |
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

_Note:_ The primitive Sc Ugen is called _Splay_.

* * *

See also: Pan2, Splay, SplayAz
