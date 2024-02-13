# An Idiosyncratic Introduction to Spl

## Introduction

Spl is executable mathematical notation.

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

>>> -2j0 ^ 0.5
0j1.41421

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

Some function make arrays.
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
[3 1 4 2 3; 1 4 2 3 1; 4 2 3 1 4]

>>> let x = [3 1 4 2].reshape([3 5]);
>>> x * x
[9 1 16 4 9; 1 16 4 9 1; 16 4 9 1 16]
```

# Assignment

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

# Monadic or Dyadic

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

The primitive functions include +, -, *, and /,
as well as ^, log, <, >, min, max, gcd, lcm, %, // &etc.
And all of these can be monadic or dyadic, and apply to arrays.

^:

```
>>> 2 ^ [3 4 5 6]
[8 16 32 64]

>>> 2 ^ [0.5 3 -5]
[1.41421 8 0.03125]

>>> -2j0 ^ [0.5 6 7]
[0j1.41421 64 -128]
```

_gcd_ & _lcm_:

```
>>> [0 0 1 1].gcd([0 1 0 1])
[0 1 1 1]

>>> [2 3 4 5].gcd([10 20 30 40])
[2 1 2 5]

>>> [2 3 4 5].lcm([10 20 30 40])
[10 60 60 40]
```

%, min & max:

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

Thus, reduce(+) is summation and reduce(*) is product.

These are the _big sigma_ and _big pi_ of conventional notation.

```
>>> 1:7.reduce(+)
28

>>> 1:7.reduce(*)
5040
```

Moreover, reduce can be applied to any function:
reduce of max is maximum,
reduce od min is minimum, &etc.

Many of these idioms are already named:

```
>>> 1:7.+
28

>>> 1:7.*
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

_t_ is an adverb that means _function table_.

Function tables are a good way to organize systematic experimentation on unfamiliar functions.

```
>>> 0:3 +.t 0:3
[0 1 2 3; 1 2 3 4; 2 3 4 5; 3 4 5 6]

>>> 0:3 *.t 0:3
[0 0 0 0; 0 1 2 3; 0 2 4 6; 0 3 6 9]

>>> (0:3 <.t 0:3).boole
[0 1 1 1; 0 0 1 1; 0 0 0 1; 0 0 0 0]

>>> (0:3 >.t 0:3).boole
[0 0 0 0; 1 0 0 0; 1 1 0 0; 1 1 1 0]

>>> 0:3 max.t 0:3
[0 1 2 3; 1 1 2 3; 2 2 2 3; 3 3 3 3]

>>> 0:3 min.t 0:3
[0 0 0 0; 0 1 1 1; 0 1 2 2; 0 1 2 3]

>>> 0:3 gcd.t 0:3
[0 1 2 3; 1 1 1 1; 2 1 2 1; 3 1 1 3]

>>> 0:3 lcm.t 0:3
[0 0 0 0; 0 1 2 3; 0 2 2 6; 0 3 6 3]
```

The _triangle_ of Pascal is an example of a function table,
using the binomial coefficient function.

An advantage of looking at it as a table rather than as a triangle,
is that one can then apply matrix operations to it, such as matrix inverse.

```
>>> let x = 0:4;
>>> x binomialCoefficient.t x
[1 0 0 0 0; 1 1 0 0 0; 1 2 1 0 0; 1 3 3 1 0; 1 4 6 4 1]
```

# Prefix

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

# Permutations

The dyadic function _atAll(y, x)_ indexes _y_ by _x_.
If _p_ is a permutation, _atAll(y, p)_ permutes _y_ by _p_.

```
>>> let p = [4 22 16 15 18 14 7 8 0 21 3 13 20 9 11 19 6 17 2 5 1 10 12] + 1;
>>> let u = p atAll: p;
>>> u atAll: p - 1
[2 20 7 5 16 13 0 4 18 3 19 21 22 10 9 14 8 17 6 11 12 15 1]
```

Reducing _m_ copies of _p_ using _atAll_ computes the _m_-th power of _p_.

```
>>> let p = [4 22 16 15 18 14 7 8 0 21 3 13 20 9 11 19 6 17 2 5 1 10 12] + 1;
>>> p.reshape([3 23]).reduce(atAll:/2) - 1
[2 20 7 5 16 13 0 4 18 3 19 21 22 10 9 14 8 17 6 11 12 15 1]
```

The corresponding prefixes are the successive powers of _p_.

```
>>> let p = [4 22 16 15 18 14 7 8 0 21 3 13 20 9 11 19 6 17 2 5 1 10 12] + 1;
>>> p.reshape([3 23]).prefixes.collect { :each | each.reduce(atAll:/2) - 1 }.middle
[18 12  6 19  2 11 8 0  4 10 15  9  1 21 13  5 7 17 16 14 22  3 20]
```

* * *

References:
Roger Hui
_An Idiosyncratic Introduction to J_
[1](https://github.com/jsoftware/labs_labs/blob/master/core/intro.ijt)
