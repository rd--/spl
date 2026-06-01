# intervalName

- _intervalName(n/d)_

Answer a `String` naming the interval ratio _n/d_ according to the Scala interval name database.

Unison and octave:

```
>>> [1/1 2/1]
>>> .ratioToCents
[0 1200]

>>> 1/1.intervalName
'unison, perfect prime'

>>> 2/1.intervalName
'octave'
```

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
>>> [
>>> 	225/224 15625/15552
>>> 	2109375/2097152 126/125
>>> ].ratioToCents
[7.712 8.107 10.061 13.795]

>>> 225/224.intervalName
'septimal kleisma'

>>> 15625/15552.intervalName
'kleisma, semicomma majeur'

>>> 2109375/2097152.intervalName
'semicomma, Fokker’s comma'

>>> 126/125.intervalName
'septimal semicomma, Starling comma'
```

Commas:

```
>>> [
>>> 	364/363 352/351 100/99 81/80
>>> 	531_441/524_288 64/63 50/49
>>> ].ratioToCents
[
	4.763 4.925 17.399 21.506
	23.460 27.264 34.976
]

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

>>> 50/49.intervalName
'Erlich’s decatonic comma, tritonic diesis'
```

Dieses:

```
>>> [128/125 40/39 1053/1024 36/35 648/625]
>>> .ratioToCents
[41.059 43.831 48.348 48.770 62.565]

>>> 128/125.intervalName
'minor diesis, diesis'

>>> 40/39.intervalName
'tridecimal minor diesis'

>>> 1053/1024.intervalName
'tridecimal major diesis'

>>> 648/625.intervalName
'major diesis'

>>> 36/35.intervalName
'septimal diesis, 1/4-tone'
```

Quarter-tones:

```
>>> [36/35 246/239 33/32 32/31 31/30]
>>> .ratioToCents
[48.77 49.98 53.27 54.96 56.77]

>>> 246/239.intervalName
'Meshaqah’s 1/4-tone'

>>> 36/35.intervalName
'septimal diesis, 1/4-tone'

>>> 33/32.intervalName
'undecimal comma, al-Farabi’s 1/4-tone'

>>> 32/31.intervalName
'Greek enharmonic 1/4-tone'

>>> 31/30.intervalName
'31st-partial chroma'
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
>>> 	25/24	21/20	256/243
>>> 	135/128	19/18	128/121
>>> 	17/16	16/15	2187/2048
>>> 	15/14	27/25
>>> ].ratioToCents
[
	 70.67	84.47	90.22
	92.18	 93.60	97.36
	104.96	111.73	113.69
	119.44	133.24
]

>>> 19/18.intervalName
'undevicesimal semitone'

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

>>> 21/20.intervalName
'minor semitone'

>>> 128/121.intervalName
'undecimal semitone'

>>> 256/243.intervalName
'limma, Pythagorean minor second'

>>> 1.pythagoreanLimma
256/243

>>> 135/128.intervalName
'major chroma, major limma'

>>> 17/16.intervalName
'17th harmonic'

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

>>> 15/14.intervalName
'major diatonic semitone'

>>> 27/25.intervalNameList
[
	'large limma'
	'BP small semitone'
	'Zarlino semitone'
]
```

Neutral seconds, three-quarter tones and four-fifth tones:

```
>>> [88/81 241/221 12/11 35/32 11/10]
>>> .ratioToCents
[143.50 149.98 150.64 155.14 165.00]

>>> 88/81.intervalName
'2nd undecimal neutral second'

>>> 241/221.intervalName
'Meshaqah’s 3/4-tone'

>>> 12/11.intervalName
'undecimal neutral second, 3/4-tone'

>>> 35/32.intervalName
'septimal neutral second'

>>> 11/10.intervalName
'Ptolemy’s second, 4/5-tone'
```

Whole tones:

```
>>> [800/729 10/9 19/17 9/8 17/15 8/7]
>>> .ratioToCents
[160.90 182.40 192.56 203.91 216.69 231.17]

>>> 800/729.intervalName
'grave whole tone'

>>> 10/9.intervalName
'minor whole tone'

>>> 19/17.intervalName
'quasi-meantone'

>>> 9/8.intervalName
'major whole tone'

>>> 17/15.intervalName
'septendecimal whole tone'

>>> 8/7.intervalName
'septimal whole tone'
```

Augmented seconds and diminished thirds:

```
>>> [256/225 81/70 75/64 19683/16384]
>>> .ratioToCents
[223.46 252.68 274.58 317.60]

>>> 256/225.intervalName
'Neapolitan diminished third'

>>> 81/70.intervalName
'Al-Hwarizmi’s lute middle finger'

>>> 75/64.intervalName
'classic augmented second'

>>> 19683/16384.intervalName
'Pythagorean augmented second'
```

Minor thirds:

```
>>> [
>>> 	7/6 27/23 13/11 32/27 19/16
>>> 	25/21 6/5 135/112
>>> ].ratioToCents
[
	266.87 277.59 289.21 294.13 297.51
	301.85 315.64 323.35
]

>>> 7/6.intervalName
'septimal minor third'

>>> 27/23.intervalName
'vicesimotertial minor third'

>>> 13/11.intervalName
'tridecimal minor third'

>>> 32/27.intervalName
'Pythagorean minor third'

>>> 32/27 / 352/351
13/11

>>> 19/16.intervalName
'19th harmonic'

>>> 25/21.intervalName
'BP second, quasi-equal minor third'

>>> 6/5.intervalName
'minor third'

>>> 135/112.intervalName
'septimal wide minor third'
```

Neutral thirds:

```
>>> [128/105 11/9 27/22 16/13]
>>> .ratioToCents
[342.91 347.41 354.58 359.47]

>>> 128/105.intervalName
'septimal neutral third'

>>> 11/9.intervalName
'undecimal neutral third'

>>> 27/22.intervalName
'neutral third, Zalzal wosta of al-Farabi'

>>> 16/13.intervalName
'tridecimal neutral third'
```

Major thirds:

```
>>> [100/81 5/4 24/19 81/64]
>>> .ratioToCents
[364.81 386.31 404.44 407.82]

>>> 100/81.intervalName
'grave major third'

>>> 5/4.intervalName
'major third'

>>> 81/64.intervalName
'Pythagorean major third'

>>> 9/8 ^ 2
81/64

>>> 24/19.intervalName
'smaller undevicesimal major third'
```

Augmented thirds and diminished fourths:

```
>>> [8192/6561 32/25 125/96 177147/131072]
>>> .ratioToCents
[384.36 427.37 456.99 521.51]

>>> 8192/6561.intervalName
'Pythagorean diminished fourth'

>>> 32/25.intervalName
'classic diminished fourth'

>>> 125/96.intervalName
'classic augmented third'

>>> 177147/131072.intervalName
'Pythagorean augmented third'
```

Perfect fourths:

```
>>> [320/243 4/3 75/56]
>>> .ratioToCents
[476.54 498.04 505.76]

>>> 320/243.intervalName
'grave fourth'

>>> 4/3.intervalName
'perfect fourth'

>>> 75/56.intervalName
'marvelous fourth'
```

Augmented fourths and diminished fifths:

```
>>> [
>>> 	15/11 11/8 18/13 25/18
>>> 	7/5 45/32 729/512 36/25
>>> ].ratioToCents
[
	536.95 551.32 563.38 568.72
	582.51 590.22 611.73 631.29
]

>>> 15/11.intervalName
'undecimal augmented fourth'

>>> 11/8.intervalName
'undecimal semi-augmented fourth'

>>> 18/13.intervalName
'tridecimal augmented fourth'

>>> 25/18.intervalName
'classic augmented fourth'

>>> 7/5.intervalName
'septimal or Huygens’ tritone, BP fourth'

>>> 45/32.intervalName
'diatonic tritone'

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
>>> [40/27 112/75 3/2]
>>> .ratioToCents
[680.45 694.24 701.96]

>>> 40/27.intervalName
'grave fifth'

>>> 112/75.intervalName
'marvelous fifth'

>>> 3/2.intervalName
'perfect fifth'
```

Minor sixths:

```
>>> [128/81 27/17 8/5]
>>> .ratioToCents
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
>>> [13/8 18/11 105/64]
>>> .ratioToCents
[840.53 852.59 857.09]

>>> 13/8.intervalName
'tridecimal neutral sixth'

>>> 18/11.intervalName
'undecimal neutral sixth'

>>> 105/64.intervalName
'septimal neutral sixth'
```

Major sixths:

```
>>> [400/243 5/3 27/16 22/13 12/7]
>>> .ratioToCents
[862.85 884.36 905.87 910.79 933.13]

>>> 400/243.intervalName
'grave major sixth'

>>> 5/3.intervalName
'major sixth, BP sixth'

>>> 27/16.intervalName
'Pythagorean major sixth'

>>> 22/13.intervalName
'tridecimal major sixth'

>>> 12/7.intervalName
'septimal major sixth'
```

Augmented sixths and diminished sevenths:

```
>>> [17/10 128/75 26/15 225/128]
>>> .ratioToCents
[918.64 925.42 952.26 976.54]

>>> 17/10.intervalName
'septendecimal diminished seventh'

>>> 128/75.intervalName
'diminished seventh'

>>> 26/15.intervalName
'tridecimal semi-augmented sixth'

>>> 225/128.intervalName
'augmented sixth'
```

Minor sevenths:

```
>>> [7/4 16/9 9/5 29/16 20/11]
>>> .ratioToCents
[968.83 996.09 1017.60 1029.58 1035.00]

>>> 7/4.intervalName
'harmonic seventh'

>>> 16/9.intervalName
'Pythagorean minor seventh'

>>> 9/5.intervalName
'just minor seventh, BP seventh'

>>> 29/16.intervalName
'29th harmonic'

>>> 20/11.intervalName
'large minor seventh'
```

Neutral sevenths:

```
>>> [64/35 11/6 13/7]
>>> .ratioToCents
[1044.86 1049.36 1071.70]

>>> 64/35.intervalName
'septimal neutral seventh'

>>> 11/6.intervalName
'undecimal neutral seventh, 21/4-tone'

>>> 13/7.intervalName
'16/3-tone'
```

Major sevenths:

```
>>> [50/27 15/8 243/128 19/10 27/14]
>>> .ratioToCents
[1066.76 1088.27 1109.78 1111.20 1137.04]

>>> 50/27.intervalName
'grave major seventh'

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
>>> [48/25 31/16 35/18]
>>> .ratioToCents
[1129.33 1145.04 1151.23]

>>> 48/25.intervalName
'classic diminished octave'

>>> 31/16.intervalName
'31st harmonic'

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

Simple whole-number ratios that approximate 20-EDO (Balzano 1980):

```
>>> [
>>> 	28/27 15/14 10/9 8/7 32/27
>>> 	49/40 32/25 21/16 48/35 45/32
>>> ].collect { :r |
>>> 	r.intervalName
>>> 	->
>>> 	r.ratioToCents.round
>>> }
[
	'Archytas’ 1/3-tone' -> 63,
	'major diatonic semitone' -> 119,
	'minor whole tone' -> 182,
	'septimal whole tone' -> 231,
	'Pythagorean minor third' -> 294,
	'larger approximation to neutral third' -> 351,
	'classic diminished fourth' -> 427,
	'narrow fourth' -> 471,
	'septimal semi-augmented fourth' -> 547,
	'diatonic tritone' -> 590
]
```

Tuning of the piano in Ben Johnston’s _Suite for Microtonal Piano_ (Gann 2009):

```
>>> [
>>> 	1/1 17/16 9/8 19/16 5/4 21/16
>>> 	11/8 3/2 13/8 27/16 7/4 15/8
>>> ].intervalName
[
	'unison, perfect prime'
	'17th harmonic'
	'major whole tone'
	'19th harmonic'
	'major third'
	'narrow fourth'
	'undecimal semi-augmented fourth'
	'perfect fifth'
	'tridecimal neutral sixth'
	'Pythagorean major sixth'
	'harmonic seventh'
	'classic major seventh'
]

>>> [
>>> 	1/1 17/16 9/8 19/16 5/4 21/16
>>> 	11/8 3/2 13/8 27/16 7/4 15/8
>>> ].divide(9/8).octaveReduce
>>> .rotateLeft(2).intervalName
[
	'unison, perfect prime'
	'undevicesimal semitone'
	'minor whole tone'
	'septimal minor third'
	'undecimal neutral third'
	'perfect fourth'
	'tridecimal diminished fifth'
	'perfect fifth'
	'septimal minor sixth'
	'major sixth, BP sixth'
	'Pythagorean minor seventh'
	'septendecimal major seventh'
]
```

Intervals not in the database answer as un-named:

```
>>> 135/124.intervalName
'*unnamed interval*'

>>> 135/124.primeExponents
[-2 3 1 0 0 0 0 0 0 0 -1]
```

_Note:_
The database is a `LibraryItem`,
and this function requires the item be in the interpreter cache.
The answer replaces apostrophe characters with right single quotation marks.

* * *

See also: intervalNameList, LibraryItem, namedInterval, scalaIntervalArchive

Guides: Tuning Functions

Categories: Tuning
