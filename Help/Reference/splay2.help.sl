# splay2

- _splay2(inList, spread=1, level=1, center=0, levelComp=true)_

Stereo panner.
splay2 spreads a list of channels across a stereo field.

Mouse control:

~~~spl syn=A
let freq = 0:9.collect { :i |
	lfNoise2(
		rand(10, 20)
	) * 200 + (i + 3 * 100)
};
splay2(
	sinOsc(freq, 0),
	mouseY(1, 0, 0, 0.2),
	0.1,
	mouseX(-1, 1, 0, 0.2),
	true
)
~~~

Texture graph:

~~~spl syn=B
{ :tr |
	let k = 7;
	let o = sinOsc(
		{
			tiRand(40, 90, tr).midiCps
		} ! k,
		0
	);
	let a = {
		tRand(0.05, 0.1, tr)
	} ! k;
	splay2(o * a)
}.overlapTexture(6, 3, 3).mix
~~~

Texture program:

~~~spl texture
{
	let k = 7;
	let o = sinOsc(
		{ iRand(40, 90).midiCps } ! k,
		0
	);
	let a = { rand(0.05, 0.1) } ! k;
	splay2(o * a)
}.overlapTextureProgram(6, 3, 3)
~~~

_Note:_ The Sc Ugen is called _splay_.

* * *

See also: pan2, splay, splayAz

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Splay.html)

Categories: Ugen
