# mod

- _mod(m, n, d=0)_

Answer the remainder on division of _m_ by _n_ using offset _d_.
In the case where _d=0_ the operator form is `%`.

Modulo table:

```
>>> %.swap.table(1:4, 1:10)
[
	0 0 0 0 0 0 0 0 0 0;
	1 0 1 0 1 0 1 0 1 0;
	1 2 0 1 2 0 1 2 0 1;
	1 2 3 0 1 2 3 0 1 2
]
```

Compute five modulo three:

```
>>> 5 % 3
2
```

At integer _m_ and _n_:

```
>>> (5 % 3, 5.mod(3))
(2, 2)

>>> (17 % 5, 17.mod(5))
(2, 2)
```

A number modulo itself is `zero`:

```
>>> (5 % 5, 5.mod(5))
(0, 0)
```

Zero modulo any number is `zero`:

```
>>> 0 % 5
0
```

_m%n_ is _m-qn_, where _q_ is the quotient of _m/n_, rounded toward zero to an integer:

```
>>> let [m, n] = [5, 3];
>>> m - ((m / n).floor * n)
2
```

At negative _m_:

```
>>> (-5 % 3, -5 % 4, -1 % 3)
(1, 3, 2)
```

At negative _n_, relation to `\\`:

```
>>> (19 % 12, 19 % -12)
(7, -5)

>>> (19 \\ 12, 19 \\ -12)
(7, 7)
```

At `LargeInteger`:

```
>>> -3213213213213213432453243L
>>> %
>>> -123434343439L
-26953727934L
```

Note errors in floating point math:

```
>>> 3L ^ 41 % 13
9

>>> 3 ^ 41 % 13
8
```

At `Fraction`:

```
>>> 5/2 % 2
1/2
```

Real numbers,
for positive _n_ answer the floating-point remainder of dividing _m_ by _n_:

```
>>> 28.sqrt % 3
(-3 + (2 * 7.sqrt))

>>> 1.pi % 2
(-2 + 1.pi)

>>> (1.pi % 2, 1.pi % -2)
(1.1416, -0.8584)

>>> 1.5 % 1
0.5

>>> -0.5 % 1
0.5
```

`%` threads over lists:

```
>>> [1 2 3 4 5] % 3
[1 2 0 1 2]

>>> [-2 -1 0 1 2 3 4 5] % 2
[0 1 0 1 0 1 0 1]

>>> [5 10 14] % 3.5
[1.5 3 0]
```

For integers,
_a % m_ answers the _common residue_ of _a_ modulo _m_,
i.e. non-negative and smaller than _m_:

```
>>> [-2 -1 12 13] % 12
[10 11 0 1]
```

Fermats little theorem:

```
>>> 7.gcd(11)
1

>>> 7 ^ (11 - 1) % 12
1
```

Eulers theorem:

```
>>> 7.gcd(12)
1

>>> 7 ^ 12.eulerPhi % 12
1
```

`%` is transitive:

```
>>> (5 % 3) = (2 % 3)
true

>>> (2 % 3) = (8 % 3)
true

>>> (8 % 3) = (5 % 3)
true
```

If _n_ divides _m_ then _m % n = 0_:

```
>>> 8.divisible(2)
true

>>> 8 % 2
0
```

For positive _n_,
the second part of the `quotientRemainder` is the same as `%`:

```
>>> 17.quotientRemainder(6)
[2 5]

>>> 17 % 6
5

>>> 17.quotientRemainder(-6)
[-2 5]

>>> 17 % -6
-1
```

The answers have the same sign as the modulus:

```
>>> [5 -5] % 3
[2 1]

>>> [5 -5] % -3
[-1 -2]
```

For a positive real number _x_, _x % 1_ gives the fractional part of _x_:

```
>>> 3.141 % 1
0.141

>>> 3.141.fractionalPart
0.141
```

Modulo of negative number with negative operand:

```
>>> [-5 -4 -3 -2 -1 0] % -5
[0, -4, -3, -2, -1, 0]

>>> [-5.1 -4.1 -3.1 -2.1 -1.1 -0.1] % -5
[-0.1 -4.1 -3.1 -2.1 -1.1 -0.1]
```

Number of squares modulo _n_,
OEIS [A000224](https://oeis.org/A000224):

```
>>> 1:72.collect { :n |
>>> 	1:n.collect { :k |
>>> 		k.square % n
>>> 	}.nub.size
>>> }
[
	 1  2  2  2  3  4  4  3  4  6
	 6  4  7  8  6  4  9  8 10  6
	 8 12 12  6 11 14 11  8 15 12
	16  7 12 18 12  8 19 20 14  9
	21 16 22 12 12 24 24  8 22 22
	18 14 27 22 18 12 20 30 30 12
	31 32 16 12 21 24 34 18 24 24
	36 12
]
```

Modular multiplication tables:

```
>>> 4:5.collect { :m |
>>> 	{ :i :j |
>>> 		(i * j) % m
>>> 	}.table(1:m, 1:m)
>>> }
[
	1 2 3 0;
	2 0 2 0;
	3 2 1 0;
	0 0 0 0
	:;
	1 2 3 4 0;
	2 4 1 3 0;
	3 1 4 2 0;
	4 3 2 1 0;
	0 0 0 0 0
]
```

At `Symbol`:

```
>> `m` % `n`
(% m n)
```

The remainder on division of five by three offset to start with one:

```
>>> 5.mod(3, 1)
2

>>> 17.mod(5, 1)
2

>>> 23.mod(13, -6)
-3
```

Threads over lists:

```
>>> 1:5.mod(3, 0)
[1 2 0 1 2]

>>> 1:5.mod(3, 1)
[1 2 3 1 2]

>>> -3:3.mod(3, 0)
[0 1 2 0 1 2 0]

>>> -3:3.mod(3, 1)
[3 1 2 3 1 2 3]
```

Extract parts of a list cyclically:

```
>>> ['a' 'b' 'c'] @* 1:10.mod(3, 1)
['a' 'b' 'c' 'a' 'b' 'c' 'a' 'b' 'c' 'a']
```

Numbers that are congruent to `zero` modulo two,
Messiaen’s first mode of limited transposition,
OEIS [A005843](https://oeis.org/A005843):

```
>>> 0:25.select { :n |
>>> 	n % 2 = 0
>>> }
[0 2 4 6 8 10 12 14 16 18 20 22 24]

>>> [2 -1].linearRecurrence([0 2], 13)
[0 2 4 6 8 10 12 14 16 18 20 22 24]
```

Numbers that are congruent to `zero` or `one` modulo three,
Messiaen’s second mode of limited transposition,
OEIS [A032766](https://oeis.org/A032766):

```
>>> 0:23.select { :n |
>>> 	[0 1].includes(n % 3)
>>> }
[0 1 3 4 6 7 9 10 12 13 15 16 18 19 21 22]

>>> [1 1 -1].linearRecurrence([0 1 3], 16)
[0 1 3 4 6 7 9 10 12 13 15 16 18 19 21 22]
```

Numbers that are not congruent to `one` modulo four,
Messiaen’s third mode of limited transposition,
OEIS [A004772](https://oeis.org/A004772):

```
>>> 0:20.select { :n |
>>> 	n % 4 != 1
>>> }
[0 2 3 4 6 7 8 10 11 12 14 15 16 18 19 20]

>>> [1 0 1 -1].linearRecurrence(
>>> 	[0 2 3 4], 16
>>> )
[0 2 3 4 6 7 8 10 11 12 14 15 16 18 19 20]
```

Numbers that are congruent to _0,1,2,5_ modulo six,
Messiaen’s fourth mode of limited transposition,
OEIS [A047269](https://oeis.org/A047269):

```
>>> 0:23.select { :n |
>>> 	[0 1 2 5].includes(n % 6)
>>> }
[0 1 2 5 6 7 8 11 12 13 14 17 18 19 20 23]

>>> [1 0 0 1 -1].linearRecurrence(
>>> 	[0 1 2 5 6], 16
>>> )
[0 1 2 5 6 7 8 11 12 13 14 17 18 19 20 23]
```

Numbers that are congruent to _0,1,5_ modulo six,
Messiaen’s fifth mode of limited transposition,
OEIS [A047266](https://oeis.org/A047266):

```
>>> 0:23.select { :n |
>>> 	[0 1 5].includes(n % 6)
>>> }
[0 1 5 6 7 11 12 13 17 18 19 23]

>>> [1 0 1 -1].linearRecurrence(
>>> 	[0 1 5 6], 12
>>> )
[0 1 5 6 7 11 12 13 17 18 19 23]
```

Numbers that are congruent to _0,2,4,5_ modulo six,
Messiaen’s sixth mode of limited transposition,
OEIS [A047262](https://oeis.org/A047262):

```
>>> 0:23.select { :n |
>>> 	[0 2 4 5].includes(n % 6)
>>> }
[0 2 4 5 6 8 10 11 12 14 16 17 18 20 22 23]

>>> [2 -2 2 -1].linearRecurrence(
>>> 	[0 2 4 5], 16
>>> )
[0 2 4 5 6 8 10 11 12 14 16 17 18 20 22 23]
```

Numbers that are congruent to _0,1,2,3,5_ modulo six,
Messiaen’s seventh mode of limited transposition,
OEIS [A047256](https://oeis.org/A047256):

```
>>> 0:19.select { :n |
>>> 	[0 1 2 3 5].includes(n % 6)
>>> }
[0 1 2 3 5 6 7 8 9 11 12 13 14 15 17 18 19]

>>> [1 0 0 0 1 -1].linearRecurrence(
>>> 	[0 1 2 3 5 6], 17
>>> )
[0 1 2 3 5 6 7 8 9 11 12 13 14 15 17 18 19]
```

Count symmetric patterns in cellular automaton,
OEIS [A060547](https://oeis.org/A060547):

```
>>> 1:16.collect { :n |
>>> 	2 ^ ((n / 3).floor + (n % 3 % 2))
>>> }
[2 1 2 4 2 4 8 4 8 16 8 16 32 16 32 64]
```

_n%4_,
OEIS [A010873](https://oeis.org/A010873):

```
>>> 0:15 % 4
[0 1 2 3 0 1 2 3 0 1 2 3 0 1 2 3]
```

Numbers that are zero modulo four or have a divisor of the form _x^2-1_,
OEIS [A059267](https://oeis.org/A059267):

```
>>> 0:40.select { :n |
>>> 	n.divisors.anySatisfy { :d |
>>> 		n % (d + 2) = 0
>>> 	}
>>> }
[
	 3  4  6  8  9 12 15 16 18 20
	21 24 27 28 30 32 33 35 36 39
	40
]
```

Polyrhythmic sequence _P(3,4)_,
OEIS [A267027](https://oeis.org/A267027),
the first differences are _3,1,2,2,1,3_ repeating:

```
>>> 1:40.select { :n |
>>> 	n % 3 = 1 | { n % 4 = 1 }
>>> }
[
	 1  4  5  7  9 10 13 16 17 19
	21 22 25 28 29 31 33 34 37 40
]

>>> [2 -2 2 -2 2 -1].linearRecurrence(
>>> 	[1 4 5 7 9 10], 20
>>> )
[
	 1  4  5  7  9 10 13 16 17 19
	21 22 25 28 29 31 33 34 37 40
]
```

The y-coordinates of the magic tori that display the Agrippa _Saturn_ magic square,
OEIS [A060588](https://oeis.org/A060588):

```
>>> let n = 0:26;
>>> (-n - (n / 3).floor) % 3
[
	0 2 1 2 1 0 1 0 2
	0 2 1 2 1 0 1 0 2
	0 2 1 2 1 0 1 0 2
]
```

Repeat _0,1,2,2,0,1,1,2,0_,
OEIS [A270740](https://oeis.org/A270740):

```
>>> let n = 0:26;
>>> (n - (n // 3)) % 3
[
	0 1 2 2 0 1 1 2 0
	0 1 2 2 0 1 1 2 0
	0 1 2 2 0 1 1 2 0
]
```

Numbers that are congruent to _0,2,4,6,9_ modulo twelve,
a major pentatonic scale,
OEIS [A175884](https://oeis.org/A175884):

```
>>> 0:33.select { :n |
>>> 	[0 2 4 7 9].includes(n % 12)
>>> }
[0 2 4 7 9 12 14 16 19 21 24 26 28 31 33]

>>> let n = 0:14;
>>> (12 * n) // 5
[0 2 4 7 9 12 14 16 19 21 24 26 28 31 33]

>>> let n = 1:15;
>>> let a = ((n - 4) / 5).floor;
>>> let b = ((n - 1) / 5).floor;
>>> (2 * n) - 1 + a + b
[0 2 4 7 9 12 14 16 19 21 24 26 28 31 33]
```

Numbers that are congruent to _0,2,4,5,7,9,11_ modulo twelve,
a major diatonic scale,
OEIS [A083026](https://oeis.org/A083026):

```
>>> 0:24.select { :n |
>>> 	[0 2 4 5 7 9 11].includes(n % 12)
>>> }
[0 2 4 5 7 9 11 12 14 16 17 19 21 23 24]

>>> let n = 1:15;
>>> (12 * n) // 7 - 1
[0 2 4 5 7 9 11 12 14 16 17 19 21 23 24]
```

Numbers that are congruent to _0,2,3,5,7,8,11_ modulo twelve,
a minor diatonic scale with a raised seventh,
OEIS [A083028](https://oeis.org/A083028):

```
>>> 0:24.select { :n |
>>> 	[0 2 3 5 7 8 11].includes(n % 12)
>>> }
[0 2 3 5 7 8 11 12 14 15 17 19 20 23 24]
```

Numbers that are congruent to _0,2,4,6,7,9,11_ modulo twelve,
the Lydian mode,
OEIS [A083089](https://oeis.org/A083089):

```
>>> 0:24.select { :n |
>>> 	[0 2 4 6 7 9 11].includes(n % 12)
>>> }
[0 2 4 6 7 9 11 12 14 16 18 19 21 23 24]

>>> let n = 1:15;
>>> let m = 2 * (n - 1);
>>> m - (m // 7)
[0 2 4 6 7 9 11 12 14 16 18 19 21 23 24]
```

Numbers that are congruent to _0,2,4,5,7,9,10_ modulo twelve,
the Mixolydian mode,
OEIS [A083120](https://oeis.org/A083120):

```
>>> 0:24.select { :n |
>>> 	[0 2 4 5 7 9 10].includes(n % 12)
>>> }
[0 2 4 5 7 9 10 12 14 16 17 19 21 22 24]

>>> let n = 1:15;
>>> (4 * (3 * n - 2)) // 7
[0 2 4 5 7 9 10 12 14 16 17 19 21 22 24]
```

Numbers that are congruent to _0,2,3,5,7,9,10_ modulo twelve,
the Dorian mode,
OEIS [A083033](https://oeis.org/A083033):

```
>>> 0:24.select { :n |
>>> 	[0 2 3 5 7 9 10].includes(n % 12)
>>> }
[0 2 3 5 7 9 10 12 14 15 17 19 21 22 24]

>>> let n = 1:15;
>>> (3 * (4 * n - 3)) // 7
[0 2 3 5 7 9 10 12 14 15 17 19 21 22 24]
```

Numbers that are congruent to _0,2,3,5,7,8,10_ modulo twelve,
the Aeolian mode,
OEIS [A060107](https://oeis.org/A060107):

```
>>> 0:24.select { :n |
>>> 	[0 2 3 5 7 8 10].includes(n % 12)
>>> }
[0 2 3 5 7 8 10 12 14 15 17 19 20 22 24]

>>> let n = 1:15;
>>> (3 * (4 * n - 3)) // 7
[0 2 3 5 7 9 10 12 14 15 17 19 21 22 24]
```

Numbers that are congruent to _0,1,3,5,6,8,10_ modulo twelve,
the Hypophrygian mode,
also Fludd’s sequence,
OEIS [A082977](https://oeis.org/A082977):

```
>>> 0:24.select { :n |
>>> 	[0 1 3 5 6 8 10].includes(n % 12)
>>> }
[0 1 3 5 6 8 10 12 13 15 17 18 20 22 24]

>>> let n = 0:14;
>>> (n * 12 / 7).floor
[0 1 3 5 6 8 10 12 13 15 17 18 20 22 24]
```

Numbers that are congruent to _0,1,3,5,7,8,10_ modulo twelve,
the Phrygian mode,
OEIS [A083034](https://oeis.org/A083034):

```
>>> 0:24.select { :n |
>>> 	[0 1 3 5 7 8 10].includes(n % 12)
>>> }
[0 1 3 5 7 8 10 12 13 15 17 19 20 22 24]

>>> let n = 1:15;
>>> (n * 12 - 11) // 7
[0 1 3 5 7 8 10 12 13 15 17 19 20 22 24]
```

Numbers that are congruent to _0,4,7_ modulo twelve,
the major common chord,
OEIS [A083030](https://oeis.org/A083030):

```
>>> 0:48.select { :n |
>>> 	[0 4 7].includes(n % 12)
>>> }
[0 4 7 12 16 19 24 28 31 36 40 43 48]

>>> [1 0 1 -1].linearRecurrence(
>>> 	[0 4 7 12], 13
>>> )
[0 4 7 12 16 19 24 28 31 36 40 43 48]
```

Numbers that are congruent to _0,3,7_ modulo twelve,
the minor common chord,
OEIS [A083031](https://oeis.org/A083031):

```
>>> 0:48.select { :n |
>>> 	[0 3 7].includes(n % 12)
>>> }
[0 3 7 12 15 19 24 27 31 36 39 43 48]

>>> [1 0 1 -1].linearRecurrence(
>>> 	[0 3 7 12], 13
>>> )
[0 3 7 12 15 19 24 27 31 36 39 43 48]
```

Numbers that are congruent to _0,4,7,10_ modulo twelve,
the dominant seventh chord,
OEIS [A083032](https://oeis.org/A083032):

```
>>> 0:36.select { :n |
>>> 	[0 4 7 10].includes(n % 12)
>>> }
[0 4 7 10 12 16 19 22 24 28 31 34 36]
```

Numbers that are congruent to _1,2,3,5,6_ modulo seven,
OEIS [A032796](https://oeis.org/A032796):

```
>>> 0:22.select { :n |
>>> 	[1 2 3 5 6].includes(n % 7)
>>> }
[1 2 3 5 6 8 9 10 12 13 15 16 17 19 20 22]
```

Numbers that are congruent to _1,3,5,6_ modulo seven,
also Fludd’s sequence,
OEIS [A047329](https://oeis.org/A047329):

```
>>> 0:22.select { :n |
>>> 	[1 3 5 6].includes(n % 7)
>>> }
[1 3 5 6 8 10 12 13 15 17 19 20 22]

>>> let n = 1:13;
>>> ((7 * n - 1) / 4).floor
[1 3 5 6 8 10 12 13 15 17 19 20 22]
```

Numbers that are congruent to _3,6_ modulo seven,
OEIS [A047280](https://oeis.org/A047280):

```
>>> 0:36.select { :n |
>>> 	[3 6].includes(n % 7)
>>> }
[3 6 10 13 17 20 24 27 31 34]

>>> let n = 1:10;
>>> 4 * n - 1 - (n / 2).floor
[3 6 10 13 17 20 24 27 31 34]
```

Numbers that are congruent to _1,5_ modulo seven,
OEIS [A047383](https://oeis.org/A047383):

```
>>> 0:36.select { :n |
>>> 	[1 5].includes(n % 7)
>>> }
[1 5 8 12 15 19 22 26 29 33 36]

>>> let n = 1:11;
>>> 7 * n // 2 - 2
[1 5 8 12 15 19 22 26 29 33 36]
```

Numbers that are congruent to _0,3,6_ modulo eight,
OEIS [A047399](https://oeis.org/A047399):

```
>>> 0:36.select { :n |
>>> 	[0 3 6].includes(n % 8)
>>> }
[0 3 6 8 11 14 16 19 22 24 27 30 32 35]

>>> let n = 0:13;
>>> 3 * n - (n / 3).floor
[0 3 6 8 11 14 16 19 22 24 27 30 32 35]

>>> let n = 1:14;
>>> ((8 * n - 6) / 3).floor
[0 3 6 8 11 14 16 19 22 24 27 30 32 35]
```

Numbers _k_ such that the fractional part of _(3/2)^k_ decreases monotonically to zero,
integer harmonics that offer monotonically closer approximations to the stacks of just-intonated perfect fifths,
OEIS [A081464](https://oeis.org/A081464):

```
>>> let i = 1;
>>> let a = [];
>>> 1.toDo(10 ^ 3) { :n |
>>> 	let j = (3/2 ^ n) % 1;
>>> 	(j < i).ifTrue {
>>> 		a.add(n);
>>> 		i := j
>>> 	}
>>> };
>>> a
[1 2 4 29 95 153 532 613 840]
```

Circle of fifths cycle,
counterclockwise,
OEIS [A258054](https://oeis.org/A258054):

```
>>> let n = 1:12;
>>> (5 * (n - 1) + 1).mod(12, 1)
[1 6 11 4 9 2 7 12 5 10 3 8]
```

Circle of fifths cycle,
clockwise,
OEIS [A257811](https://oeis.org/A257811):

```
>>> let n = 1:12;
>>> (7 * (n - 1) + 1).mod(12, 1)
[1 8 3 10 5 12 7 2 9 4 11 6]
```

Vulgar fractions whose denominators are numbers ending with nine,
the case 1/19,
OEIS [A254065](https://oeis.org/A254065):

```
>>> let n = 1:22;
>>> (2 ^ (n - 1) % 19) % 10
[1 2 4 8 6 3 7 4 9 8 7 5 1 3 6 2 5 0 1 2 4 8]
```

_n%6_,
OEIS [A010875](https://oeis.org/A010875):

```
>>> 0:21 % 6
[0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3 4 5 0 1 2 3]
```

An integer sequence modulo an integer,
_n%8_,
i.e. with a fixed modulus,
OEIS [A010877](https://oeis.org/A010877):

~~~spl svg=A oeis=A010877
(0:65 % 8).discretePlot
~~~

![](Help/Image/mod-A.svg)

An integer modulo an integer sequence,
_100%n_,
i.e. varying the modulus,
OEIS [A090976](https://oeis.org/A090976):

~~~spl svg=B oeis=A090976
(100 % 1:65).discretePlot
~~~

![](Help/Image/mod-B.svg)

Binomial coefficients modulo two:

~~~spl png=C
let k = [0L .. 64L];
{ :i :j |
	(i >= j).if {
		i.binomial(j) % 2
	} {
		0
	}
}.table(k, k).Bitmap
~~~

![](Help/Image/mod-C.png)

A spiral matrix where numbers are colored based on their congruence:

~~~spl png=D
(109.spiralMatrix % 109 / 109)
.Greymap
~~~

![](Help/Image/mod-D.png)

Modular addition tables:

~~~spl svg=E
{ :a :b |
	a + b % 4
}.table(0:8, 0:8).matrixPlot
~~~

![](Help/Image/mod-E.svg)

Modulo sum pattern:

~~~spl svg=F
let m = 7;
let n = 2;
{ :i :j |
	((i % m) + (j % m)) = n
}.table(0:25, 0:25).boole.matrixPlot
~~~

![](Help/Image/mod-F.svg)

Simulate a particle bouncing in a noncommensurate box:

~~~spl svg=G
[0, 0.01 .. 15].collect { :t |
	t % [2.sqrt 1]
}.Line
~~~

![](Help/Image/mod-G.svg)

Number of squares modulo _n_,
OEIS [A000224](https://oeis.org/A000224):

~~~spl svg=H oeis=A000224
1:150.collect { :n |
	1:n.collect { :k |
		k.square % n
	}.nub.size
}.scatterPlot
~~~

![](Help/Image/mod-H.svg)

Quadratic residue triangle,
OEIS [A048152](https://oeis.org/A048152):

~~~spl svg=I oeis=A048152
1:22.triangularArray { :q :p |
	p.square % q
}.catenate.scatterPlot
~~~

![](Help/Image/mod-I.svg)

Modular multiplication table:

~~~spl svg=J
let m = 14;
{ :i :j |
	(i * j) % m
}.table(1:m, 1:m).matrixPlot
~~~

![](Help/Image/mod-J.svg)

Left inverse of binary expansions,
OEIS [A028897](https://oeis.org/A028897):

~~~spl svg=K oeis=A028897
let a = { :n |
	(n < 10).if {
		n
	} {
		(n % 10 != 0).if {
			a(n - 1) + 1
		} {
			2 * a(n / 10)
		}
	}
};
0:200.collect(a:/1).scatterPlot
~~~

![](Help/Image/mod-K.svg)

First differences of the ones-counting sequence,
OEIS [A088705](https://oeis.org/A088705):

~~~spl svg=L oeis=A088705
let a = Map { :n |
	(n < 1).if {
		0
	} {
		(n % 2 = 0).if {
			a[n / 2] - 1
		} {
			1
		}
	}
};
a[0:127].discretePlot
~~~

![](Help/Image/mod-L.svg)

Implement the Park-Miller generator,
which is correct when caculated with 64-bit IEEE floating point math:

~~~spl svg=M
let a = 48271;
let m = 2 ^ 31 - 1;
let s = 618379;
let n = 100;
let r = { :x |
	(a * x) % m
}.nestList(s, n);
(r / m).discretePlot
~~~

![](Help/Image/mod-M.svg)

The largest _m_ such that _n_ is congruent to -1, 0 or 1 `mod` _k_ for all _k_ from 1 to _m_,
OEIS [A187824](https://oeis.org/A187824):

~~~spl svg=N oeis=A187824
2:99.collect { :n |
	let k = 4;
	{
		let r = n % k;
		r < 2 | { k - r < 2 }
	}.whileTrue {
		k := k + 1
	};
	k - 1
}.scatterPlot
~~~

![](Help/Image/mod-N.svg)

The smallest non-negative integer not already in the sequence such that _a(n-1)_ is congruent to _a(n)%n_,
OEIS [A125717](https://oeis.org/A125717):

~~~spl svg=O oeis=A125717
let l = [0];
1:200.do { :n |
	let k = l.last.mod(n);
	{ l.includes(k) }.whileTrue {
		k := k + n
	};
	l.add(k)
};
l.scatterPlot
~~~

![](Help/Image/mod-O.svg)

The table of _n%k_ read by downward antidiagonals,
OEIS [A051126](https://oeis.org/A051126):

~~~spl svg=P oeis=A051126
1:11.collect { :n |
	n:1:-1.collect { :k |
		(n - k + 1) % k
	}
}.catenate.stepPlot
~~~

![](Help/Image/mod-P.svg)

Earliest sequence with _a(a(n))=2n_,
OEIS [A002516](https://oeis.org/A002516):

~~~spl svg=Q oeis=A002516
let a = { :n |
	[
		{ n = 0 } -> {
			0
		},
		{ n % 2 = 0 } -> {
			2 * a(n / 2)
		},
		{ n % 4 = 1 } -> {
			n + 2
		},
		{ n % 4 = 3 } -> {
			2 * (n - 2)
		}
	].which
};
0:200.collect(a:/1).scatterPlot
~~~

![](Help/Image/mod-Q.svg)

Triangle of descending moduli,
OEIS [A051778](https://oeis.org/A051778):

~~~spl svg=R oeis=A051778
3:23.collect { :n |
	let m = n - 1;
	m:2:-1.collect { :i |
		n % i
	}
}.catenate.scatterPlot
~~~

![](Help/Image/mod-R.svg)

Prefix sum of _n%9_,
OEIS [A130487](https://oeis.org/A130487):

~~~spl svg=S oeis=A130487
(0:44 % 9).prefixSum.scatterPlot
~~~

![](Help/Image/mod-S.svg)

Multiplicative suborder of _2_ and _2n+1_,
OEIS [A003558](https://oeis.org/A003558):

~~~spl svg=T oeis=A003558
0:200.collect { :n |
	let m = 1;
	{
		let a = 2 * n;
		let b = (2 ^ m) % (a + 1);
		b = 1 | { b = a }
	}.whileFalse {
		m := m + 1
	};
	m
}.scatterPlot
~~~

![](Help/Image/mod-T.svg)

_P(n)%(n-1)_,
OEIS [A004649](https://oeis.org/A004649):

~~~spl svg=U oeis=A004649
2:135.collect { :n |
	n.prime % (n - 1)
}.scatterPlot
~~~

![](Help/Image/mod-U.svg)

Triangle of modular inverses of _b_ modulo _m_ for where zero indicates no modular inverse exists,
OEIS [A102057](https://oeis.org/A102057):

~~~spl svg=V oeis=A102057
let g = { :m :b :x :y |
	(b = 0).if {
		(m = 1).if {
			x
		} {
			0
		}
	} {
		g(
			b,
			m % b,
			y,
			x - (y * (m // b))
		)
	}
};
2:15.collect { :m |
	let n = m - 1;
	1:n.collect { :b |
		g(m, b, 0, 1) % m
	}
}.catenate.discretePlot
~~~

![](Help/Image/mod-V.svg)

Pattern by Andy Newark,
OEIS [A132376](https://oeis.org/A132376):

~~~spl svg=W oeis=A132376
let a = [0 3 5 9 11 13 18 23 26 27];
let b = [6 9 14 15 16 21 26 30 31];
let f = { :n |
	a.includes(n % 32).if {
		2
	} {
		g(n)
	}
};
let g = { :n |
	b.includes(n % 32).if {
		3
	} {
		h(n)
	}
};
let h = { :n |
	(n % 32 = 20).if {
		1
	} {
		k(n)
	}
};
let k = { :n |
	(n % 32 = 19).if {
		4
	} {
		5
	}
};
1:150.collect(f:/1).scatterPlot
~~~

![](Help/Image/mod-W.svg)

* * *

See also: %, /, //, \\, commonResidue, minimalResidue, modularInverse, positiveResidue, quotient, remainder

Guides: Arithemtic Functions, Integer Functions, Modular Arithmetic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Congruence.html)
[2](https://mathworld.wolfram.com/Modulus.html)
[3](https://mathworld.wolfram.com/CommonResidue.html)
[4](https://reference.wolfram.com/language/ref/Mod.html),
_OEIS_
[1](https://oeis.org/A000224)
[2](https://oeis.org/A048152)
[3](https://oeis.org/A028897)
[4](https://oeis.org/A088705),
_W_
[1](https://en.wikipedia.org/wiki/Modulo)

Categories: Math, Operator
