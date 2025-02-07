# Splay2

- _Splay2(inList, spread=1, level=1, center=0, levelComp=true)_

Stereo panner.
Splay2 spreads a list of channels across a stereo field.

Mouse control:

```
let freq = 0:9.collect { :i |
	LfNoise2(
		Rand(10, 20)
	) * 200 + (i + 3 * 100)
};
Splay2(
	SinOsc(freq, 0),
	MouseY(1, 0, 0, 0.2),
	0.1,
	MouseX(-1, 1, 0, 0.2),
	true
)
```

Texture graph:

```
{ :tr |
	let k = 7;
	let o = SinOsc(
		{
			TiRand(40, 90, tr).MidiCps
		} ! k,
		0
	);
	let a = {
		TRand(0.05, 0.1, tr)
	} ! k;
	Splay2(o * a)
}.OverlapTexture(6, 3, 3).Mix
```

Texture program:

~~~spl texture
{
	let k = 7;
	let o = SinOsc(
		{ IRand(40, 90).MidiCps } ! k,
		0
	);
	let a = { Rand(0.05, 0.1) } ! k;
	Splay2(o * a)
}.overlapTextureProgram(6, 3, 3)
~~~

_Note:_ The Sc Ugen is called _Splay_.

* * *

See also: Pan2, Splay, SplayAz

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Splay.html)

Categories: Ugen
