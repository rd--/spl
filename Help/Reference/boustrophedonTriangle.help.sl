# boustrophedonTriangle

- _boustrophedonTriangle([x₁ x₂ …])_

Answer the boustrophedon triangle of the sequence _x_.

The boustrophedon triangle of `one` and then `zero`,
equal to the `entringerTriangle`,
OEIS [A008281](https://oeis.org/A008281):

```
>>> [1 0 0 0 0 0 0 0]
>>> .boustrophedonTriangle
[
	1;
	0 1;
	0 1 1;
	0 1 2 2;
	0 2 4 5 5;
	0 5 10 14 16 16;
	0 16 32 46 56 61 61;
	0 61 122 178 224 256 272 272
]
```

The boustrophedon triangle of `one` repeated:

```
>>> [1 1 1 1 1 1 1 1]
>>> .boustrophedonTriangle
[
	1;
	1 2;
	1 3 4;
	1 5 8 9;
	1 10 18 23 24;
	1 25 48 66 76 77;
	1 78 154 220 268 293 294;
	1 295 588 856 1076 1230 1308 1309
]
```

The boustrophedon triangle of `one` and negative one repeating:

```
>>> [1 -1 1 -1 1 -1 1 -1 1]
>>> .boustrophedonTriangle
[
	1;
	-1 0;
	1 1 0;
	-1 -1 0 1;
	1 2 2 1 0;
	-1 -1 0 2 4 5;
	1 6 10 12 12 11 10;
	-1 9 20 32 44 54 60 61;
	1 62 122 176 220 252 272 281 280
]
```

The boustrophedon triangle from the `prime` numbers:

```
>>> [2 3 5 7 11 13 17]
>>> .boustrophedonTriangle
[
	2;
	3 5;
	5 10 13;
	7 20 30 35;
	11 46 76 96 103;
	13 116 212 288 334 345;
	17 362 696 984 1196 1312 1325
]
```

The boustrophedon triangle of the `fibonacci` numbers:

```
>>> [1 1 2 3 5 8 13]
>>> .boustrophedonTriangle
[
	1;
	1 2;
	2 4 5;
	3 8 12 14;
	5 19 31 39 42;
	8 50 89 120 139 144;
	13 157 296 416 505 555 563
]
```

The boustrophedon triangle of the `factorial` numbers:

```
>>> [1 1 2 6 24 120 720]
>>> .boustrophedonTriangle
[
	1;
	1 2;
	2 4 5;
	6 11 15 17;
	24 41 56 67 73;
	120 193 260 316 357 381;
	720 1101 1458 1774 2034 2227 2347
]
```

* * *

See also: boustrophedonTransform, triangularArray

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BoustrophedonTransform.html),
_OEIS_
[1](https://oeis.org/A008281),
_W_
[1](https://en.wikipedia.org/wiki/Boustrophedon_transform)
