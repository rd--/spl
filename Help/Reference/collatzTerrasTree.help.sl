# collatzTerrasTree

- _collatzTerrasTree(k, x=4)_

Answer the Collatz-Terras tree to depth _k_,
beginning at _x_.

The Collatz-Terras tree,
OEIS [A248573](https://oeis.org/A248573):

```
>>> 7.collatzTerrasTree(4)
>>> .levelOrderValues
[
	4 8 5 16 3 10 32 6 20 21
	64 12 13 40 42 128 24 26 80 84
	85 256
]
```

Direct calculation of the the Collatz-Terras tree terms,
OEIS [A248573](https://oeis.org/A248573):

```
>>> { :x |
>>> 	x.collect { :y |
>>> 		(y % 3 = 2).if {
>>> 			[(2 * y - 1) / 3, 2 * y]
>>> 		} {
>>> 			[2 * y]
>>> 		}
>>> 	}.catenate
>>> }.nestList([4], 10)
[
	4
	;
	8
	;
	5 16
	;
	3 10 32
	;
	6 20 21 64
	;
	12 13 40 42 128
	;
	24 26 80 84 85
	256
	;
	48 17 52 53 160
	168 170 512
	;
	96 11 34 104 35
	106 320 336 113 340
	341 1024
	;
	192 7 22 68 69
	208 23 70 212 213
	640 672 75 226 680
	227 682 2048
	;
	384 14 44 45 136
	138 416 15 46 140
	141 424 426 1280 1344
	150 452 453 1360 151
	454 1364 1365 4096
]
```

Plot the Collatz-Terras tree:

~~~spl svg=A
5.collatzTerrasTree(4)
.treePlot
~~~

![](Help/Image/collatzTerrasTree-A.svg)

* * *

See also: collatzSequence, collatzTerrasSequence
