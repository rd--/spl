# Magic Squares

Define a method to summarise the properties of a magic square:

~~~ spl methodDefinition
+List {
	magicSquareSummary { :m |
		let n = m.size;
		let mu = n * (n * n + 1) / 2;
		let v = List(n, 1);
		(
			mu,
			m.dot(v),
			v.dot(m),
			m.diagonal.sum,
			m.antidiagonal.sum,
			m.matrixRank
		)
	}
}
~~~

The only 3×3 magic square,
c.f. OEIS [A033812](https://oeis.org/A033812):

```
>>> [
>>> 	8 1 6;
>>> 	3 5 7;
>>> 	4 9 2
>>> ].magicSquareSummary
(15, [15 15 15], [15 15 15], 15, 15, 3)
```

A 5×5 magic square,
c.f. OEIS [A127907](https://oeis.org/A127907):

```
>>> [
>>> 	17 24  1  8 15;
>>> 	23  5  7 14 16;
>>> 	 4  6 13 20 22;
>>> 	10 12 19 21  3;
>>> 	11 18 25  2  9
>>> ].magicSquareSummary
(65, List(5, 65), List(5, 65), 65, 65, 5)
```

A 7×7 magic square,
c.f. OEIS [A126651](https://oeis.org/A126651):

```
>>> [
>>> 	71  1 51 32 50  2 80;
>>> 	21 41 61 56 26 13 69;
>>> 	31 81 11 20 62 65 17;
>>> 	34 40 60 43 28 64 18;
>>> 	48 42 22 54 39 75  7;
>>> 	33 53 15 68 16 44 58;
>>> 	49 29 67 14 66 24 38
>>> ].magicSquareSummary
(175, List(7, 287), List(7, 287), 287, 322, 7)
```

A 9×9 magic square,
c.f. OEIS [A126650](https://oeis.org/A126650):

```
>>> [
>>> 	71  1 51 32 50  2 80  3 79;
>>> 	21 41 61 56 26 13 69 25 57;
>>> 	31 81 11 20 62 65 17 63 19;
>>> 	34 40 60 43 28 64 18 55 27;
>>> 	48 42 22 54 39 75  7 10 72;
>>> 	33 53 15 68 16 44 58 77  5;
>>> 	49 29 67 14 66 24 38 59 23;
>>> 	76  4 70 73  8 37 36 30 35;
>>> 	6  78 12  9 74 45 46 47 52
>>> ].magicSquareSummary
(369, List(9, 369), List(9, 369), 369, 369, 9)
```

A 4×4×4 magic cube:

```
>>> let c = [
>>> 	32  5 52 41;
>>> 	 3 42 31 54;
>>> 	61 24 33 12;
>>> 	34 59 14 23:;
>>> 		10 35 22 63;
>>> 		37 64  9 20;
>>> 		27  2 55 46;
>>> 		56 29 44  1:;
>>> 			49 28 45  8;
>>> 			30  7 50 43;
>>> 			36 57 16 21;
>>> 			15 38 19 58:;
>>> 				39 62 11 18;
>>> 				60 17 40 13;
>>> 				 6 47 26 51;
>>> 				25  4 53 48
>>> ];
>>> let column = { :m :c | (1 .. m.size).collect { :r | m[r][c] } };
>>> let s = (34, [130 130 130 130], [130 130 130 130], 130, 130, 4);
>>> (
>>> 	c.collect(magicSquareSummary:/1),
>>> 	1:4.collect { :i | c.collect { :m | m[i] }.magicSquareSummary },
>>> 	1:4.collect { :i | c.collect { :m | column(m, i) }.magicSquareSummary }
>>> )
([s s s s], [s s s s], [s s s s])
```

* * *

References:
_OEIS_
[1](https://oeis.org/A033812)
[2](https://oeis.org/A126649)
[3](https://oeis.org/A126650)
[4](https://oeis.org/A126651)
[5](https://oeis.org/A127907)

Further Reading: Andrews 1908
