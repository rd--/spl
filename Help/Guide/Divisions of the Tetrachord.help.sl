# Divisions of the Tetrachord

Chalmers, J.H.
_Divisions of the Tetrachord: A Prolegomenon to the Construction of Musical Scales_
Frog Peak Music, NH, 1993.

## 1. The tetrachord in experimental music

The tetrachord is the interval of a _perfect fourth_,
the _diatessaron_ of the Greeks,
divided into three subintervals by the interposition of two additional notes.
The four notes,
or strings,
of the tetrachord were named _hypate_,
_parhypate_,
_lichanos_,
and _mese_ in ascending order from I/I to 4/3 in the first tetrachord ofthe central octave of the Greater Perfect System,
the region of the scale of most concern to theorists.
Ascending through the second tetrachord,
they were called _paramese_,
_trite_,
_paranete_,
and _nete_. [p.4]

Harry Partch used the pentatonic form of the enharmonic (16/15 5/4 9/8 16/15 5/4)
in the first of his _Two Studies on Ancient Greek Scales_ (1946) [p.5]:

```
>>> let i = [1/1 16/15 5/4 9/8 16/15 5/4];
>>> i.scan(*)
[1/1 16/15 4/3 3/2 8/5 2/1]

>>> let r = [1/1 16/15 4/3 3/2 8/5 2/1];
>>> r.ratioToCents.round
[0 112 498 702 814 1200]
```

and the microtonal form in the second (in Archytas’s tuning, 28/27 · 36/35 · 5/4) [p.6]:

```
>>> [1/1 28/27 36/35 5/4].scan(*)
[1/1 28/27 16/15 4/3]

>>> [1/1 28/27 16/15 4/3].ratioToCents.round
[0 63 112 498]
```

## 2. Pythagoras, Ptolemy, and the arithmetic tradition

The scale derived from the _Timaeus_ is the so-called Pythagorean
tuning of Western European theory, but it is most likely of Babylonian origin [p.7]:

```
>>> [
>>> 	1/1 9/8 81/64 4/3 3/2 27/16 243/128 2/1
>>> ].ratioToCents.round
[0 204 408 498 702 906 1110 1200]
```

Archytas’s genera (enharmonic, chromatic, diatonic) [p.8]:

```
>>> [
>>> 	28/27 36/35 5/4;
>>> 	28/27 243/224 32/27;
>>> 	28/27 8/7 9/8
>>> ].ratioToCents.round
[
	63 49 386;
	63 141 294;
	63 231 204
]
```

Eratosthene’s genera (enharmonic, chromatic, diatonic) [p.8]:

```
>>> [
>>> 	40/39 39/38 19/15;
>>> 	20/19 19/18 6/5;
>>> 	256/243 9/8 9/8
>>> ].ratioToCents.round
[
	44 45 409;
	89 94 316;
	90 204 204
]
```

Didymos’s genera (enharmonic, chromatic, diatonic) [p.8]:

```
>>> [
>>> 	32/31 31/30 5/4;
>>> 	16/15 25/24 6/5;
>>> 	16/15 10/9 9/8
>>> ].ratioToCents.round
[
	55 57 386;
	112 71 316;
	112 182 204
]
```

The genus 56/55 · 22/21 · 5/4 (31 + 81 + 386 cents) is also attributed to Ptolemy [p.8]

```
>>> [56/55 22/21 5/4].ratioToCents.round
[31 81 386]
```

Archytas’s genera represent a considerable departure from the austerity of the older Pythagorean forms (enharmonic, chromatic, diatonic).
The enharmonic genus is shown as a trichord because the tuning of the enharmonic genus before Archytas is not precisely known.  [p.9]:

```
>>> [
>>> 	256/243 81/64;
>>> 	256/243 2187/2048 32/27;
>>> 	256/243 9/8 9/8
>>> ].ratioToCents.round
[
	90 408;
	90 114 294;
	90 204 204
]
```

Ptolemy’s own tunings (enharmonic, soft chromatic, intense chromatic, soft diatonic, diatonon toniaion, diatonon ditonianon, intense diatonic, equable diatonic) [p.9]:

```
>>> [
>>> 	46/45 24/23 5/4;
>>> 	28/27 15/14 6/5;
>>> 	22/21 12/11 7/6;
>>> 	21/20 10/9 8/7;
>>> 	28/27 8/7 9/8;
>>> 	256/243 9/8 9/8;
>>> 	16/15 9/8 10/9;
>>> 	12/11 11/10 10/9
>>> ].ratioToCents.round
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
>>> ].ratioToCents.round
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

The numerical technique employed by Eratosthenes, Didymos, and Ptolemy to define the majority of their tetrachords is called _linear division_ and may be identified with the process known in Greek as _katapyknosis_.

```
>>> let n = 16/15;
>>> { :i :r |
>>> 	let p = n.numerator * i;
>>> 	let q = n.denominator * i;
>>> 	r.if {
>>> 		let m = Fraction(p, p - 1);
>>> 		[m, n / m]
>>> 	} {
>>> 		let m = Fraction(q + 1, q);
>>> 		[n / m, m]
>>> 	}
>>> }.map(2:6, [true, false])
[
	32/31 31/30;
	24/23 46/45;
	64/63 21/20;
	20/19 76/75;
	96/95 19/18
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
>>> ].ratioToCents.round
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
>>> ].ratioToCents.round
[
	45 46 408;
	90 110 298;
	90 204 204
]
```

Al-Farabi analogizes from the 256/243 · 9/8 · 9/8 of the Pythagorean tuning and proposes reduplicated genera such as 49/48 · 8/7 · 8/7 and 27/25 · 10/9 · 10/9.

```
>>> [
>>> 	256/243 9/8 9/8;
>>> 	49/48 8/7 8/7;
>>> 	27/25 10/9 10/9
>>> ].ratioToCents.round
[
	90 204 204;
	36 231 231;
	133 182 182
]
```

Surprisingly, I have been unable to trace the apparently missing reduplicated genus, 1/10 · 1/10 · 400/363 (165 + 165 + 168 cents) that is a virtually equally-tempered division of the 4/3.

```
>>> [11/10 11/10 400/363].ratioToCents.round
[165, 165, 168]
```

## 3. Aristoxenos and the geometrization of musical space

Aristoxenos described his genera in units of twelfths of a tone (Macran 1902),
but later theorists,
notably Cleonides,
translated these units into a cipher consisting of 30 parts (_moria_) to the fourth (Barbera 1978)...
These two medieval Islamic tetrachords are Aristoxenian approximations to Ptolemy’s equable diatonic...
The intonation of the liturgical music of the Byzantine and Slavonic Orthodox churches is a complex problem ... [p.18-22]:

```
>>> [
>>> 	3 3; 4 4; 9/2 9/2; 6 6; 6 9; 6 12;
>>> 	4 8; 4 14; 9/2 17/2; 6 3; 9/2 7/2;
>>> 	12 9; 10 10;
>>> 	9 15; 6 18; 6 12; 12 12;
>>> 	8 14; 10 8; 8 12; 8 16; 6 20;
>>> 	7 16; 5 19; 12 11; 6 12
>>> ].collect { :each |
>>> 	let parts = (each ++ [30 - each.sum]);
>>> 	let tones = (parts / 12).asFraction;
>>> 	let cents = parts.collect { :n |
>>> 		(n * (50 / 3)).round
>>> 	};
>>> 	[tones, cents]
>>> }
[
	1/4 1/4 2/1; 50 50 400:;
	1/3 1/3 11/6; 67 67 367:;
	3/8 3/8 7/4; 75 75 350:;
	1/2 1/2 3/2; 100 100 300:;
	1/2 3/4 5/4; 100 150 250:;
	1/2 1/1 1/1; 100 200 200:;
	1/3 2/3 3/2; 67 133 300:;
	1/3 7/6 1/1; 67 233 200:;
	3/8 17/24 17/12; 75 142 283:;
	1/2 1/4 7/4; 100 50 350:;
	3/8 7/24 11/6; 75 58 367:;
	1/1 3/4 3/4; 200 150 150:;
	5/6 5/6 5/6; 167 167 167:;
	3/4 5/4 1/2; 150 250 100:;
	1/2 3/2 1/2; 100 300 100:;
	1/2 1/1 1/1; 100 200 200:;
	1/1 1/1 1/2; 200 200 100:;
	2/3 7/6 2/3; 133 233 133:;
	5/6 2/3 1/1; 167 133 200:;
	2/3 1/1 5/6; 133 200 167:;
	2/3 4/3 1/2; 133 267 100:;
	1/2 5/3 1/3; 100 333 67:;
	7/12 4/3 7/12; 117 267 117:;
	5/12 19/12 1/2; 83 317 100:;
	1/1 11/12 7/12; 200 183 117:;
	1/2 1/1 1/1; 100 200 200
]
```

## 4. The construction of new genera

The term hyperenharmonic is originally from Wilson ... [p.26]:

```
>>> let n = [40 36 34 33 32 31 30 28 27 26 25];
>>> n.withIndexCollect { :each :index |
>>> 	let pyknon = Fraction(each, each - 1);
>>> 	let interval = 4/3 / pyknon;
>>> 	let cents = interval.ratioToCents.round;
>>> 	[index, interval, pyknon, cents, 498 - cents]
>>> }
[
	 1  13/10  40/39 454 44;
	 2  35/27  36/35 449 49;
	 3  22/17  34/33 446 52;
	 4  128/99 33/32 445 53;
	 5  31/24  32/31 443 55;
	 6  40/31  31/30 441 57;
	 7  58/45  30/29 439 59;
	 8   9/7   28/27 435 63;
	 9 104/81  27/26 433 65;
	10  50/39  26/25 430 68;
	11  32/25  25/24 427 71
]
```

One useful technique, originated by Ervin Wilson, is a variation of the katapyknotic process [p.27]:

```
>>> [4 5 6].collect { :m |
>>> 	let p = 4 * m;
>>> 	let q = 3 * m;
>>> 	(p - 1).toBy(q + 2, -1).collect { :i |
>>> 		(i - 1).toBy(q + 1, -1).collect { :j |
>>> 			[
>>> 				[p, i, j, q],
>>> 				[
>>> 					Fraction(p, i),
>>> 					Fraction(i, j),
>>> 					Fraction(j, q)
>>> 				].sort
>>> 			]
>>> 		}
>>> 	}.catenate
>>> }.catenate
[
	16 15 14 12; 16/15 15/14 7/6:;
	16 15 13 12; 16/15 13/12 15/13:;
	16 14 13 12; 14/13 13/12 8/7:;
	20 19 18 15; 20/19 19/18 6/5:;
	20 19 17 15; 20/19 19/17 17/15:;
	20 19 16 15; 20/19 16/15 19/16:;
	20 18 17 15; 18/17 10/9 17/15:;
	20 18 16 15; 16/15 10/9 9/8:;
	20 17 16 15; 17/16 16/15 20/17:;
	24 23 22 18; 24/23 23/22 11/9:;
	24 23 21 18; 24/23 23/21 7/6:;
	24 23 20 18; 24/23 10/9 23/20:;
	24 23 19 18; 24/23 19/18 23/19:;
	24 22 21 18; 22/21 12/11 7/6:;
	24 22 20 18; 12/11 11/10 10/9:;
	24 22 19 18; 19/18 12/11 22/19:;
	24 21 20 18; 21/20 10/9 8/7:;
	24 21 19 18; 19/18 21/19 8/7:;
	24 20 19 18; 20/19 19/18 6/5
]
```

* * *

Further Reading: Chalmers 1993
