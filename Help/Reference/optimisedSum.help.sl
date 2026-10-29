# optimisedSum

- _optimisedSum(c)_

Sums the list of inputs _c_.
Unlike `sum`, implements optimization using the _Sum4_ primitive `Ugen`.

Sum a list of sawtooth oscillators:

~~~spl syn=A
[
	lfSaw(200.1, 0),
	lfSaw(500.2, 0),
	lfSaw(1200.3, 0),
	lfSaw(700.4, 0)
].optimisedSum * 0.04
~~~

The above is the same as this due to multichannel expansion:

~~~spl syn=B
lfSaw(
	[200.1 500.2 1200.3 700.4],
	0
).optimisedSum * 0.04
~~~

Sine oscillators:

~~~spl syn=C
[
	fSinOsc(600.2, 0),
	fSinOsc(622.0, 0),
	fSinOsc(641.3, 0),
	fSinOsc(677.7, 0)
].optimisedSum * 0.1
~~~

Sum nine oscillators, utilising two _Sum4_ Ugens and two `plus` Ugens:

~~~spl syn=D
sinOsc(
	{ rand(111, 555) } ! 9,
	0
).optimisedSum / 27
~~~

Where supported, `optimisedSum` is displayed as ∑.

* * *

See also: +, mix, plus, sum

Unicode: U+2211 ∑ N-Ary Summation

Categories: Ugen
