# LfClipNoise

- _LfClipNoise(freq)_

Clipped noise.
Randomly generates the values -1 or +1 at a rate given by the nearest integer division of the sample rate by the freq argument.
It is probably pretty hard on your speakers!

- freq: approximate rate at which to generate random values.

Fixed frequency:

```
LfClipNoise(1000) * 0.05
```

Modulate frequency:

```
LfClipNoise(XLine(1000, 10000, 10)) * 0.05
```

Texture program:

~~~spl textureProgram=A
{
	let freq = Rand(47, 69) * [1, 1.1];
	let mul = {
		Perc(LfClipNoise(Rand(3, 7)), 0.01, 1, -4) * 0.1
	} ! 2;
	let snd = [
		SinOsc(freq * [1, 2], 0),
		Saw(freq * [2, 3]),
		Pulse(freq * [3, 4], 0.5)
	] * mul;
	FreeVerb(snd.Sum, 0.33, 0.5, 0.5)
}.overlapTextureProgram(7, 7, 3)
~~~

* * *

See also: PinkNoise, WhiteNoise

Categories: Ugen, Noise
