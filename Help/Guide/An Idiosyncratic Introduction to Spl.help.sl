# An Idiosyncratic Introduction to Sᴘʟ

Hui, R.K.W.
_An Idiosyncratic Introduction to J_
[1](https://github.com/jsoftware/labs_labs/blob/master/core/intro.ijt)

## Introduction

Sᴘʟ is executable mathematical notation.

```
>>> 2 + 3
5

>>> let x = 2;
>>> let y = 3;
>>> x + y
5
```

## Functions

There is a rich set of primitives.

```
>>> 2 + 3
5

>>> 2 - 3
-1

>>> 2 * 3
6

>>> 2 / 3
0.66667

>>> 2 ^ 3
8

>>> 2 ^ 0.5
1.41421

>>> -2J0 ^ 0.5
0J1.41421

>>> 3.log(2)
1.58496
```

## Arrays

Functions apply to arrays.

```
>>> 2 + [5 6 7]
[7 8 9]

>>> [2 3 4] * [5 6 7]
[10 18 28]

>>> [2 3 4] - [5 6 7]
[-3 -3 -3]

>>> [2 3 4] / [5 6 7]
[0.4 0.5 0.571429]
```

Shorter lists are extended by _recyling_:

```
>>> [2 3] / [5 6 7]
[0.4 0.5 0.28571]
```

Some functions make arrays.
_iota(n)_ is a list of the integers from 1 to _n_.

```
>>> 7.iota
[1 2 3 4 5 6 7]

>>> 1 + 7.iota
[2 3 4 5 6 7 8]

>>> 2 ^ 7.iota
[2 4 8 16 32 64 128]

>>> 7.iota - 1 ^ 0.5
[0 1 1.41421 1.73205 2 2.23607 2.44949]
```

_reshape(v, s)_ makes an array of shape _s_ using the elements _v_.

```
>>> [3 1 4 2].reshape([3 5])
[
	3 1 4 2 3;
	1 4 2 3 1;
	4 2 3 1 4
]

>>> let x = [3 1 4 2].reshape([3 5]);
>>> x * x
[
	 9  1 16  4  9;
	 1 16  4  9  1;
	16  4  9  1 16
]
```

## Assignment

An array or function can be assigned a name using _let_.

```
>>> 7.iota
[1 2 3 4 5 6 7]

>>> let x = 7.iota;
>>> x - 1 ^ 2
[0 1 4 9 16 25 36]

>>> let x = 7.iota - 1;
>>> let pow:/2 = ^;
>>> x.pow(0.5)
[0 1 1.41421 1.73205 2 2.23607 2.44949]
```

## Monadic or Dyadic

A function can be monadic or dyadic, depending on whether there is an argument on the right or on the left and right.

```
>>> 2 / 3
0.666667

>>> 3./
0.333333

>>> 2 ^ 3
8

>>> 3.^
20.0855
```

## More Primitives

The primitive functions include `+`, `-`, `*`, and `/`,
as well as `^`, `log`, `<`, `>`, `min`, `max`, `gcd`, `lcm`, `%`, `//` &etc.
And all of these can be monadic or dyadic, and apply to arrays.

`^` (raised to):

```
>>> 2 ^ [3 4 5 6]
[8 16 32 64]

>>> 2 ^ [0.5 3 -5]
[1.41421 8 0.03125]

>>> -2J0 ^ [0.5 6 7]
[0J1.41421 64 -128]
```

`gcd` & `lcm`:

```
>>> [0 0 1 1].gcd([0 1 0 1])
[0 1 1 1]

>>> [2 3 4 5].gcd([10 20 30 40])
[2 1 2 5]

>>> [2 3 4 5].lcm([10 20 30 40])
[10 60 60 40]
```

`%`, `min` & `max`:

```
>>> [10 20 30 40] % [2 3 4 5]
[0 2 2 0]

>>> [2 3 4 5].min([10 20 30 40])
[2 3 4 5]

>>> [2 3 4 5].max([10 20 30 40])
[10 20 30 40]
```

## Reduce

Reduce inserts its verb argument between the items of its argument.

Thus, _reduce(+)_ is `sum` and _reduce(*)_ is `product`.

These are the _big sigma_ and _big pi_ of conventional notation.

Moreover, `reduce` can be applied to any function:
`reduce` of `max` is maximum,
`reduce` of `min` is minimum, &etc.

```
>>> 1:7.reduce(+)
28

>>> 1:7.reduce(*)
5040

>>> 1:7.reduce(max:/2)
7

>>> 1:7.reduce(min:/2)
1

>>> 1:7.reduce(gcd:/2)
1

>>> 1:7.reduce(lcm:/2)
420
```

Many of these idioms are already named:

```
>>> 1:7.sum
28

>>> 1:7.product
5040

>>> 1:7.max
7

>>> 1:7.min
1

>>> 1:7.gcd
1

>>> 1:7.lcm
420
```

## Table

Adverbs modify verbs to produce new verbs.

_outer_ is an adverb that means _function table_.

Function tables are a good way to organize systematic experimentation on unfamiliar functions.

```
>>> 0:8 +.outer 0:8
[
	00 01 02 03 04 05 06 07 08;
	01 02 03 04 05 06 07 08 09;
	02 03 04 05 06 07 08 09 10;
	03 04 05 06 07 08 09 10 11;
	04 05 06 07 08 09 10 11 12;
	05 06 07 08 09 10 11 12 13;
	06 07 08 09 10 11 12 13 14;
	07 08 09 10 11 12 13 14 15;
	08 09 10 11 12 13 14 15 16
]

>>> 0:8 *.outer 0:8
[
	00 00 00 00 00 00 00 00 00;
	00 01 02 03 04 05 06 07 08;
	00 02 04 06 08 10 12 14 16;
	00 03 06 09 12 15 18 21 24;
	00 04 08 12 16 20 24 28 32;
	00 05 10 15 20 25 30 35 40;
	00 06 12 18 24 30 36 42 48;
	00 07 14 21 28 35 42 49 56;
	00 08 16 24 32 40 48 56 64
]

>>> (0:8 <.outer 0:8).boole
[
	0 1 1 1 1 1 1 1 1;
	0 0 1 1 1 1 1 1 1;
	0 0 0 1 1 1 1 1 1;
	0 0 0 0 1 1 1 1 1;
	0 0 0 0 0 1 1 1 1;
	0 0 0 0 0 0 1 1 1;
	0 0 0 0 0 0 0 1 1;
	0 0 0 0 0 0 0 0 1;
	0 0 0 0 0 0 0 0 0
]

>>> (0:8 >.outer 0:8).boole
[
	0 0 0 0 0 0 0 0 0;
	1 0 0 0 0 0 0 0 0;
	1 1 0 0 0 0 0 0 0;
	1 1 1 0 0 0 0 0 0;
	1 1 1 1 0 0 0 0 0;
	1 1 1 1 1 0 0 0 0;
	1 1 1 1 1 1 0 0 0;
	1 1 1 1 1 1 1 0 0;
	1 1 1 1 1 1 1 1 0
]

>>> max:/2.outer(0:8, 0:8)
[
	0 1 2 3 4 5 6 7 8;
	1 1 2 3 4 5 6 7 8;
	2 2 2 3 4 5 6 7 8;
	3 3 3 3 4 5 6 7 8;
	4 4 4 4 4 5 6 7 8;
	5 5 5 5 5 5 6 7 8;
	6 6 6 6 6 6 6 7 8;
	7 7 7 7 7 7 7 7 8;
	8 8 8 8 8 8 8 8 8
]

>>> min:/2.outer(0:8, 0:8)
[
	0 0 0 0 0 0 0 0 0;
	0 1 1 1 1 1 1 1 1;
	0 1 2 2 2 2 2 2 2;
	0 1 2 3 3 3 3 3 3;
	0 1 2 3 4 4 4 4 4;
	0 1 2 3 4 5 5 5 5;
	0 1 2 3 4 5 6 6 6;
	0 1 2 3 4 5 6 7 7;
	0 1 2 3 4 5 6 7 8
]

>>> gcd:/2.outer(0:8, 0:8)
[
	0 1 2 3 4 5 6 7 8;
	1 1 1 1 1 1 1 1 1;
	2 1 2 1 2 1 2 1 2;
	3 1 1 3 1 1 3 1 1;
	4 1 2 1 4 1 2 1 4;
	5 1 1 1 1 5 1 1 1;
	6 1 2 3 2 1 6 1 2;
	7 1 1 1 1 1 1 7 1;
	8 1 2 1 4 1 2 1 8
]

>>> lcm:/2.outer(0:8, 0:8)
[
	00 00 00 00 00 00 00 00 00;
	00 01 02 03 04 05 06 07 08;
	00 02 02 06 04 10 06 14 08;
	00 03 06 03 12 15 06 21 24;
	00 04 04 12 04 20 12 28 08;
	00 05 10 15 20 05 30 35 40;
	00 06 06 06 12 30 06 42 24;
	00 07 14 21 28 35 42 07 56;
	00 08 08 24 08 40 24 56 08
]
```

The Hilbert matrix is a simple function on the addition table.

```
>>> 1.r(1:7 +.outer 0:6)
[
	1/1  1/2  1/3  1/4  1/5  1/6  1/7;
	1/2  1/3  1/4  1/5  1/6  1/7  1/8;
	1/3  1/4  1/5  1/6  1/7  1/8  1/9;
	1/4  1/5  1/6  1/7  1/8  1/9 1/10;
	1/5  1/6  1/7  1/8  1/9 1/10 1/11;
	1/6  1/7  1/8  1/9 1/10 1/11 1/12;
	1/7  1/8  1/9 1/10 1/11 1/12 1/13
]
```

The reciprocal determinant of the Hilbert matrix of order _n_, has prime factors that are the primes less than _2 * n_.

```
>>> let n = 5L;
>>> let h = 1.r(1:n +.outer (1:n - 1));
>>> (1 / h.determinant).primeFactors.nub
[2 3 5 7]
```

The _triangle_ of Pascal is an example of a function table,
using the binomial coefficient function.

An advantage of looking at it as a table rather than as a triangle,
is that one can then apply matrix operations to it, such as matrix inverse.

```
>>> let x = 0:4;
>>> binomial:/2.table(x, x)
[
	1 0 0 0 0;
	1 1 0 0 0;
	1 2 1 0 0;
	1 3 3 1 0;
	1 4 6 4 1
]
```

## Prefix

Prefix can be implemented as a unary adverb,
applying a unary block to the prefixes of the argument.

```
>>> 1:7.prefixes
[1:1 1:2 1:3 1:4 1:5 1:6 1:7]

>>> 1:7.prefixes.collect(sum:/1)
[1 3 6 10 15 21 28]

>>> 1:7.prefixes.collect(product:/1)
[1 2 6 24 120 720 5040]

>>> 1:7.prefixes.collect(min:/1)
[1 1 1 1 1 1 1]

>>> 1:7.prefixes.collect(max:/1)
[1 2 3 4 5 6 7]

>>> 1:7.prefixes.collect(gcd:/1)
[1 1 1 1 1 1 1]

>>> 1:7.prefixes.collect(lcm:/1)
[1 2 6 12 60 60 420]
```

## Permutations

The dyadic function `@*` indexes a collection by a collection.
If _p_ is a permutation, _y @* p_ permutes _y_ by _p_.
(J is zero-indexed, hence adjustments.)

```
>>> let p = system.workspace::p := [
>>> 	04 22 16 15 18 14 07 08 00 21 03 13
>>> 	20 09 11 19 06 17 02 05 01 10 12
>>> ] + 1;
>>> let u = p @* p;
>>> [u - 1, u @* p - 1, p @* u - 1]
[
	18 12 06 19 02 11 08 00 04 10 15 09
	01 21 13 05 07 17 16 14 22 03 20
	;
	02 20 07 05 16 13 00 04 18 03 19 21
	22 10 09 14 08 17 06 11 12 15 01
	;
	02 20 07 05 16 13 00 04 18 03 19 21
	22 10 09 14 08 17 06 11 12 15 01
]
```

Reducing _m_ copies of _p_ using `@*` computes the _m_-th power of _p_.

```
>>> let p = system.workspace::p;
>>> p.reshape([3 23]).reduce(@*) - 1
[
	02 20 07 05 16 13 00 04 18 03 19 21
	22 10 09 14 08 17 06 11 12 15 01
]
```

The corresponding prefixes are the successive powers of _p_.

```
>>> let p = system.workspace::p;
>>> let m = p.reshape([3 23]);
>>> m.prefixes.collect { :each |
>>> 	each.reduce(@*) - 1
>>> }.middle
[
	18 12 06 19 02 11 08 00 04 10 15 09
	01 21 13 05 07 17 16 14 22 03 20
]
```

`permutationCycles` computes the cycles of a permutation.
The `lcm` of the cycle lengths is the order of the subgroup generated by the permutation.

```
>>> let p = system.workspace::p;
>>> let c = p.permutationCycles;
>>> c.collect(size:/1).lcm
40
```
