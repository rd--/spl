# intervalName

- _intervalName(n/d)_

Answer a `String` naming the interval ratio _n/d_ according to the Scala interval name database.

The ragisma:

```
>>> 4375/4374.ratioToCents
0.39576

>>> 4375/4374.intervalName
'ragisma'

>>> 1.ragisma
 4375/4374
```

Schisma and diaschisma:

```
>>> [32805/32768 2048/2025]
>>> .ratioToCents
[1.95372 19.55357]

>>> 32805/32768
>>> .intervalName
'schisma'

>>> 1.schisma
32805/32768

>>> 2048/2025.intervalName
'diaschisma'

>>> 1.diaschisma
2048/2025
```

Semicommas:

```
>>> [2109375/2097152 126/125]
>>> .ratioToCents
[10.061 13.795]

>>> 2109375/2097152.intervalName
'semicomma, Fokker’s comma'

>>> 126/125.intervalName
'septimal semicomma, Starling comma'
```

Commas:

```
>>> [
>>> 	364/363 352/351 100/99 81/80
>>> 	531_441/524_288 64/63
>>> ].ratioToCents
[4.763 4.925 17.399 21.506 23.460 27.264]

>>> 364/363.intervalName
'gentle comma'

>>> 14/11 * 13/11 / 3/2
364/363

>>> 352/351.intervalName
'minthma'

>>> 100/99.intervalName
'Ptolemy’s comma'

>>> 81/80.intervalName
'syntonic comma, Didymus comma'

>>> 1.syntonicComma
81/80

>>> 531_441/524_288.intervalName
'Pythagorean comma, ditonic comma'

>>> 1.pythagoreanComma
531441/524288

>>> (3L ^ 12) / (2 ^ 19)
531441/524288

>>> 64/63.intervalName
'septimal comma, Archytas’ comma'
```

Dieses:

```
>>> [128/125 36/35 648/625]
>>> .ratioToCents
[41.059 48.770 62.565]

>>> 128/125.intervalName
'minor diesis, diesis'

>>> 648/625.intervalName
'major diesis'

>>> 36/35.intervalName
'septimal diesis, 1/4-tone'
```

Quarter-tones:

```
>>> [1053/1024 36/35 33/32]
>>> .ratioToCents
[48.35 48.77 53.27]

>>> 1053/1024.intervalName
'tridecimal major diesis'

>>> 36/35.intervalName
'septimal diesis, 1/4-tone'

>>> 33/32.intervalName
'undecimal comma, al-Farabi’s 1/4-tone'
```

Third-tones:

```
>>> [28/27 27/26 26/25]
>>> .ratioToCents
[62.96 65.34 67.90]

>>> 28/27.intervalName
'Archytas’ 1/3-tone'

>>> 27/26.intervalName
'tridecimal comma'

>>> 26/25.intervalName
'tridecimal 1/3-tone'
```

Semitones, also called half-tones or minor seconds or limmas or chromas:

```
>>> [
>>> 	25/24 256/243 135/128 128/121
>>> 	16/15 2187/2048
>>> ].ratioToCents
[70.67 90.22 92.18 97.36 111.73 113.69]

>>> 25/24.intervalName
'classic chromatic semitone, minor chroma'

>>> 10/9 / 16/15
25/24

>>> 5/4 / 6/5
25/24

>>> 5/3 / 8/5
25/24

>>> 15/8 / 9/5
25/24

>>> 128/121.intervalName
'undecimal semitone'

>>> 256/243.intervalName
'limma, Pythagorean minor second'

>>> 1.pythagoreanLimma
256/243

>>> 135/128.intervalName
'major chroma, major limma'

>>> 16/15.intervalName
'minor diatonic semitone'

>>> 6/5 / 9/8
16/15

>>> 4/3 / 5/4
16/15

>>> 8/5 / 3/2
16/15

>>> 16/9 / 5/3
16/15

>>> 2/1 / 15/8
16/15

>>> 2187/2048.intervalName
'apotome'

>>> 1.pythagoreanChroma
2187/2048
```

Neutral seconds:

```
>>> [88/81 35/32 11/10].ratioToCents
[143.50 155.14 165.00]

>>> 88/81.intervalName
'2nd undecimal neutral second'

>>> 35/32.intervalName
'septimal neutral second'

>>> 11/10.intervalName
'Ptolemy’s second, 4/5-tone'
```

Whole tones:

```
>>> [10/9 19/17 9/8 17/15].ratioToCents
[182.40 192.56 203.91 216.69]

>>> 10/9.intervalName
'minor whole tone'

>>> 19/17.intervalName
'quasi-meantone'

>>> 9/8.intervalName
'major whole tone'

>>> 17/15.intervalName
'septendecimal whole tone'
```

Minor thirds:

```
>>> [7/6 13/11 32/27 6/5].ratioToCents
[266.87 289.21 294.13 315.64]

>>> 7/6.intervalName
'septimal minor third'

>>> 13/11.intervalName
'tridecimal minor third'

>>> 32/27.intervalName
'Pythagorean minor third'

>>> 32/27 / 352/351
13/11

>>> 6/5.intervalName
'minor third'
```

Neutral thirds:

```
>>> [11/9 16/13].ratioToCents
[347.41 359.47]

>>> 11/9.intervalName
'undecimal neutral third'

>>> 16/13.intervalName
'tridecimal neutral third'
```

Major thirds:

```
>>> [5/4 24/19 81/64].ratioToCents
[386.31 404.44 407.82]

>>> 5/4.intervalName
'major third'

>>> 81/64.intervalName
'Pythagorean major third'

>>> 9/8 ^ 2
81/64

>>> 24/19.intervalName
'smaller undevicesimal major third'
```

Perfect fourths:

```
>>> [4/3 75/56].ratioToCents
[498.04 505.76]

>>> 4/3.intervalName
'perfect fourth'

>>> 75/56.intervalName
'marvelous fourth'
```

Augmented fourths and diminished fifths:

```
>>> [11/8 729/512 36/25].ratioToCents
[551.32 611.73 631.29]

>>> 11/8.intervalName
'undecimal semi-augmented fourth'

>>> 729/512.intervalName
'Pythagorean tritone'

>>> 9/8 ^ 3
729/512

>>> (3/2 ^ 6).octaveReduce
729/512

>>> 36/25.intervalName
'classic diminished fifth'
```

Perfect fifths:

```
>>> [112/75 3/2].ratioToCents
[694.24 701.96]

>>> 112/75.intervalName
'marvelous fifth'

>>> 3/2.intervalName
'perfect fifth'
```

Minor sixths:

```
>>> [128/81 27/17 8/5].ratioToCents
[792.18 800.91 813.69]

>>> 8/5.intervalName
'minor sixth'

>>> 27/17.intervalName
'septendecimal minor sixth'

>>> 128/81.intervalName
'Pythagorean minor sixth'
```

Neutral sixths:

```
>>> [13/8 18/11].ratioToCents
[840.53 852.59]

>>> 13/8.intervalName
'tridecimal neutral sixth'

>>> 18/11.intervalName
'undecimal neutral sixth'
```

Major sixths:

```
>>> [5/3 27/16 22/13].ratioToCents
[884.36 905.87 910.79]

>>> 5/3.intervalName
'major sixth, BP sixth'

>>> 27/16.intervalName
'Pythagorean major sixth'

>>> 22/13.intervalName
'tridecimal major sixth'
```

Minor sevenths:

```
>>> [16/9 7/4 9/5].ratioToCents
[996.09 968.83 1017.60]

>>> 7/4.intervalName
'harmonic seventh'

>>> 16/9.intervalName
'Pythagorean minor seventh'

>>> 9/5.intervalName
'just minor seventh, BP seventh'
```

Major sevenths:

```
>>> [15/8 243/128 19/10 27/14]
>>> .ratioToCents
[1088.27 1109.78 1111.20 1137.04]

>>> 15/8.intervalName
'classic major seventh'

>>> 243/128.intervalName
'Pythagorean major seventh'

>>> (3/2 ^ 5).octaveReduce
243/128

>>> 19/10.intervalName
'undevicesimal major seventh'

>>> 27/14.intervalName
'septimal major seventh'
```

Diminished octaves:

```
>>> [48/25 35/18].ratioToCents
[1129.33 1151.23]

>>> 48/25.intervalName
'classic diminished octave'

>>> 35/18.intervalName
'septimal semi-diminished octave'
```

Threads over lists:

```
>>> [
>>> 	128/125 648/625 256/243
>>> ].intervalName
[
	'minor diesis, diesis'
	'major diesis'
	'limma, Pythagorean minor second'
]
```

The first twenty-one superparticular ratios:

```
>>> Fraction(2:22, 1:21).intervalName
[
	'octave'
	'perfect fifth'
	'perfect fourth'
	'major third'
	'minor third'
	'septimal minor third'
	'septimal whole tone'
	'major whole tone'
	'minor whole tone'
	'Ptolemy’s second, 4/5-tone'
	'undecimal neutral second, 3/4-tone'
	'tridecimal 2/3-tone'
	'2/3-tone'
	'major diatonic semitone'
	'minor diatonic semitone'
	'17th harmonic'
	'Arabic lute index finger'
	'undevicesimal semitone'
	'small undevicesimal semitone'
	'minor semitone'
	'undecimal minor semitone'
]
```

Intervals not in the database answer as un-named:

```
>>> 27/28.intervalName
'*unnamed interval*'
```

_Note:_
The database is a `LibraryItem`,
and this function requires the item be in the interpreter cache.
The answer replaces apostrophe characters with right single quotation marks.

* * *

See also: LibraryItem, namedInterval, scalaIntervalArchive

Guides: Tuning Functions

Categories: Tuning
