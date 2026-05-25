# intervalNameList

- _intervalNameList(n/d)_

Answer a `List` of `String`,
derived by separating the answer to `intervalName`.

Two commas, each with two names:

```
>>> 81/80.intervalNameList
[
	'syntonic comma'
	'Didymus comma'
]

>>> 531441/524288
>>> .intervalNameList
[
	'Pythagorean comma'
	'ditonic comma'
]
```

Harmonic division of the octave (Daniélou 1943, p. 153):

```
>>> [
>>> 	81/80 46/45 31/30 25/24
>>> 	256/243 16/15 27/25 135/124
>>> 	11/10 10/9 9/8
>>> ].collect { :r |
>>> 	r.intervalNameList
>>> 	->
>>> 	r.ratioToCents
>>> }
[
	[
		'syntonic comma'
		'Didymus comma'
	] -> 21.506,
	[
		'23rd-partial chroma'
	] -> 38.05,
	[
		'31st-partial chroma'
	] -> 56.77,
	[
		'classic chromatic semitone'
		'minor chroma'
	] -> 70.67,
	[
		'limma'
		'Pythagorean minor second'
	] -> 90.22,
	[
		'minor diatonic semitone'
	] -> 111.73,
	[
		'large limma'
		'BP small semitone'
		'Zarlino semitone'
	] -> 133.24,
	[
		'*unnamed interval*'
	] -> 147.14,
	[
		'Ptolemy’s second'
		'4/5-tone'
	] -> 165.00,
	[
		'minor whole tone'
	] -> 182.40,
	[
		'major whole tone'
	] -> 203.91
]
```

* * *

See also: intervalName, namedInterval, scalaIntervalArchive

Guides: Tuning Functions

Categories: Tuning
