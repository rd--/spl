# Bohlen-Pierce Scale

The Bohlen-Pierce scale divides the tritave into thirteen steps:

```
>>> let t = system
>>> .scalaRationalTuningArchive
>>> .at('bohlen-p');
>>> (
>>> 	t.ratios,
>>> 	t.size,
>>> 	t.octave,
>>> 	t.limit,
>>> 	t.ratiosWithOctave.ratios
>>> )
(
	[
		 1/1  27/25 25/21 9/7
		 7/5  75/49  5/3  9/5
		49/25 15/7   7/3 63/25
		25/9
	],
	13,
	3/1,
	7,
	[
		 27/25  625/567 27/25  49/45
		375/343  49/45  27/25  49/45
		375/343  49/45  27/25 625/567
		 27/25
	]
)
```

A nine note subset of the thirteen note Bohlen-Pierce scale:

```
>>> let t = system
>>> .scalaRationalTuningArchive
>>> .at('bohlen_l_ji');
>>> (
>>> 	t.ratios,
>>> 	t.size,
>>> 	t.octave,
>>> 	t.limit,
>>> 	t.ratiosWithOctave.ratios
>>> )
(
	[
		 1/1  25/21  9/7   7/5
		 5/3   9/5  15/7   7/3
		25/9
	],
	9,
	3/1,
	7,
	[
		25/21 27/25 49/45 25/21
		27/25 25/21 49/45 25/21
		27/25
	]
)
```

A second nine note subset of the thirteen note Bohlen-Pierce scale:

```
>>> let t = system
>>> .scalaRationalTuningArchive
>>> .at('bohlen-p_9a');
>>> (
>>> 	t.ratios,
>>> 	t.size,
>>> 	t.octave,
>>> 	t.limit,
>>> 	t.ratiosWithOctave.ratios
>>> )
(
	[
		  1/1  49/45  9/7  7/5
		 81/49  9/5  15/7  7/3
		135/49
	],
	9,
	3/1,
	7,
	[
		49/45 405/343 49/45 405/343
		49/45  25/21  49/45 405/343
		49/45
	]
)
```

* * *

References:
_W_
[1](https://en.wikipedia.org/wiki/Bohlen%E2%80%93Pierce_scale),
_Xenharmonic_
[1](https://en.xen.wiki/w/Bohlen%E2%80%93Pierce_scale)
[2](https://en.xen.wiki/w/4L_5s_(3/1-equivalent))
