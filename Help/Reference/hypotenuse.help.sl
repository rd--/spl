# hypotenuse

- _hypotenuse(x, y)_

Answer the square root of the sum of the squares of _x_ and _y_,
Equivalently, the distance from the origin to the point _(x, y)_.

Integer answers:

```
>>> 3.hypotenuse(4)
5

>>> 5.hypotenuse(12)
13
```

At large numbers:

```
>>> hypotenuse(1E13, 1E13)
1.41421E13
```

`hypotenuse` can be used to calculate a doppler shift pitch and amplitude based on distance.
Object travels 200 meters in 6 secs (=120kph) passing 10 meters from the listener,
the speed of sound is 344 m/s:

```
let x = 10;
let y = lfSaw(1 / 6, 0) * 100;
let distance = hypotenuse(x, y);
let velocity = slope(distance);
let pitchRatio = (344 - velocity) / 344;
let amplitude = 10 / distance.square;
sinOsc(1000 * pitchRatio, 0) * amplitude
```

The next example uses the distance to modulate a delay line:

```
let x = 10;
let y = lfSaw(1 / [6, 11], [0, 1]) * 100;
let distance = hypotenuse(x, y);
let amplitude = 40 / distance.square;
let motorSound = rlpf(
	sinOsc(
		200,
		0
	) * lfPulse(
		[31.3, 23.1],
		0,
		0.4
	),
	400,
	0.3
);
delayL(
	motorSound,
	110 / 344,
	distance / 344
) * amplitude
```

The hypotenuse gives the distance of a point _(x,y)_ from the origin:

~~~spl png=A
let i = (-1 -- 1).subdivide(99);
{ :x :y |
	x.hypotenuse(y)
}.table(i, i).clip(0, 1).Greymap
~~~

![](Help/Image/hypotenuse-A.png)

* * *

See also: +, abs, norm, sqrt, sum

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Hypotenuse.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/hypot.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/numbers-and-dates.html#sec-math.hypot),
_W_
[1](https://en.wikipedia.org/wiki/Hypotenuse)
