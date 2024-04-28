# Divisions of the Tetrachord

The tetrachord is the interval of a _perfect fourth_, the _diatessaron_ of the Greeks, divided into three subintervals by the interposition of two additional notes.
The four notes, or strings, of the tetrachord were named _hypate_, _parhypate_, _lichanos_, and _mese_ in ascending order from I/I to 4/3 in the first tetrachord ofthe central octave of the Greater Perfect System, the region of the scale of most concern to theorists.
Ascending through the second tetrachord, they were called _paramese_, _trite_, _paranete_, and _nete_. [p4]

Harry Partch used the pentatonic form of the enharmonic (16/15 5/4 9/8 16/15 5/4)
in the first of his _Two Studies on Ancient Greek Scales_ (1946) [p.5]:

```
>>> [1/1 16/15 5/4 9/8 16/15 5/4].prefixes.collect(product:/1)
[1/1 16/15 4/3 3/2 8/5 2/1]

>>> [1/1 16/15 4/3 3/2 8/5 2/1].ratioToCents.rounded
[0 112 498 702 814 1200]
```

and the microtonal form in the second (in Archytas’s tuning, 28/27 · 36/35 · 5/4) [p.6]:

```
>>> [1/1 28/27 36/35 5/4].prefixes.collect(product:/1)
[1/1 28/27 16/15 4/3]

>>> [1/1 28/27 16/15 4/3].ratioToCents.rounded
[0 63 112 498]
```

The scale derived from the _Timaeus_ is the so-called Pythagorean
tuning ofWestern European theory, but it is most likely of Babylonian origin [p.7]:

```
>>> [1/1 9/8 81/64 4/3 3/2 27/16 243/128 2/1].ratioToCents.rounded
[0 204 408 498 702 906 1110 1200]
```

Archytas’s genera (enharmonic, chromatic, diatonic), p.8:

```
>>> [
>>> 	28/27 36/35 5/4;
>>> 	28/27 243/224 32/27;
>>> 	28/27 8/7 9/8
>>> ].ratioToCents.rounded
[
	63 49 386;
	63 141 294;
	63 231 204
]
```

Eratosthene’s genera (enharmonic, chromatic, diatonic), p.8:

```
>>> [
>>> 	40/39 39/38 19/15;
>>> 	20/19 19/18 6/5;
>>> 	256/243 9/8 9/8
>>> ].ratioToCents.rounded
[
	44 45 409;
	89 94 316;
	90 204 204
]
```

Didymos’s genera (enharmonic, chromatic, diatonic), p.8:

```
>>> [
>>> 	32/31 31/30 5/4;
>>> 	16/15 25/24 6/5;
>>> 	16/15 10/9 9/8
>>> ].ratioToCents.rounded
[
	55 57 386;
	112 71 316;
	112 182 204
]
```

The genus 56/55 · 22/21 · 5/4 (31 + 81 + 386 cents) is also attributed to Ptolemy [p.8]

```
>>> [56/55 22/21 5/4].ratioToCents.rounded
[31 81 386]
```

Archytas’s genera represent a considerable departure from the austerity of the older Pythagorean forms (enharmonic, chromatic, diatonic).
The enharmonic genus is shown as a trichord because the tuning of the enharmonic genus before Archytas is not precisely known.  [p.9]:

```
>>> [
>>> 	256/243 81/64;
>>> 	256/243 2187/2048 32/27;
>>> 	256/243 9/8 9/8
>>> ].ratioToCents.rounded
[
	90 408;
	90 114 294;
	90 204 204
]
```

Ptolemy’s own tunings (enharmonic, soft chromatic, intense chromatic, soft diatonic, diatonon toniaion, diatonon ditonianon, intense diatonic, equable diatonic) [p.9]:

```
>>> [
>>>	46/45 24/23 5/4;
>>>	28/27 15/14 6/5;
>>>	22/21 12/11 7/6;
>>>	21/20 10/9 8/7;
>>>	28/27 8/7 9/8;
>>>	256/243 9/8 9/8;
>>>	16/15 9/8 10/9;
>>>	12/11 11/10 10/9
>>> ].ratioToCents.rounded
[
	38 74 386;
	63 119 316;
	81 151 267;
	84 182 231;
	63 231 204;
	90 204 204;
	112 204 182;
	151 165 182
]
```

Hofmann’s list of completely superparticular divisions. This table has been recomposed after Hofmann from Vogel (1975) [p.11]:

```
>>> [
>>> 	256/255 17/16 5/4;
>>> 	136/135 18/17 5/4;
>>> 	96/95 19/18 5/4;
>>> 	76/75 20/19 5/4;
>>> 	64/63 21/20 5/4;
>>> 	56/55 22/21 5/4;
>>> 	46/45 24/23 5/4;
>>> 	40/39 26/25 5/4;
>>> 	28/27 36/35 5/4;
>>> 	32/31 31/30 5/4;
>>> 	100/99 11/10 6/5;
>>> 	55/54 12/11 6/5;
>>> 	40/39 13/12 6/5;
>>> 	28/27 15/14 6/5;
>>> 	16/15 25/24 6/5;
>>> 	20/19 19/18 6/5;
>>> 	64/63 9/8 7/6;
>>> 	36/35 10/9 7/6;
>>> 	22/21 12/11 7/6;
>>> 	16/15 15/14 7/6;
>>> 	49/48 8/7 8/7;
>>> 	28/27 8/7 9/8;
>>> 	21/20 10/9 8/7;
>>> 	14/13 13/12 8/7;
>>> 	16/15 9/8 10/9;
>>> 	12/11 11/10 10/9
>>> ].ratioToCents.rounded
[
	7 105 386;
	13 99 386;
	18 94 386;
	23 89 386;
	27 84 386;
	31 81 386;
	38 74 386;
	44 68 386;
	63 49 386;
	55 57 386;
	17 165 316;
	32 151 316;
	44 139 316;
	63 119 316;
	112 71 316;
	89 94 316;
	27 204 267;
	49 182 267;
	81 151 267;
	112 119 267;
	36 231 231;
	63 231 204;
	84 182 231;
	128 139 231;
	112 204 182;
	151 165 182
]
```

Ptolemy’s interpretation of Aristoxenos’s genera [p.13]:

```
>>> [
>>> 	40/39 39/38 19/15;
>>> 	30/29 29/28 56/45;
>>> 	80/77 77/74 37/30;
>>> 	20/19 19/18 6/5;
>>> 	20/19 38/35 7/6;
>>> 	20/19 19/17 17/15
>>> ].ratioToCents.rounded
[
	44 45 409;
	59 61 379;
	66 69 363;
	89 94 316;
	89 142 267;
	89 193 217
]
```

Boethius’s tuning for the tetrachords in the three principal genera (enharmonic, chromatic, diatonic) are [p.13]:

```
>>> [
>>> 	512/499 499/486 81/64;
>>> 	256/243 81/76 19/16;
>>> 	256/243 9/8 9/8
>>> ].ratioToCents.rounded
[
	45 46 408;
	90 110 298;
	90 204 204
]
```
