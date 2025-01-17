# iterate

- _iterate(aBlock:/1, anObject)_
- _iterate(aBlock:/1, anObject, anInteger)_

In the binary case,
answer an infinite `Stream` of repeated applications of _aBlock_ to _anObject_.

```
>>> not:/1.iterate(true).next(10)
[
	true false true false true
	false true false true false
]

>>> { :each |
>>> 	each + 3
>>> }.iterate(42).next(10)
[42 45 48 51 54 57 60 63 66 69]

>>> cos:/1.iterate(1).next(10)
[
	1.0000 0.5403 0.8576 0.6543 0.7935
	0.7014 0.7640 0.7221 0.7504 0.7314
]
```

In the ternary case,
apply _aBlock_ iteratively _anInteger_ times, initially to _anObject_.

```
>>> { :x | x ^ 2 }.iterate(2, 3)
256

>>> let x = 2;
>>> 3.timesRepeat {
>>> 	x := x ^ 2
>>> };
>>> x
256

>>> 2 ^ 2 ^ 2 ^ 2
256

>>> cos:/1.iterate(1, 9)
0.731404
```

Derive the seven tone Pythagorean scale:

```
>>> { :n |
>>> 	(n * 3/2).octaveReduced
>>> }.iterate(1/1).next(7).sort
[1/1 9/8 81/64 729/512 3/2 27/16 243/128]
```

The regular paper-folding (or dragon curve) sequence,
c.f. OEIS [A014707](https://oeis.org/A014707):

```
>>> { :l |
>>> 	l ++ [0] ++ (1 - l).reversed
>>> }.iterate([0], 5)
[
	0 0 1 0 0 1 1 0 0 0 1 1 0 1 1 0 0 0 1 0
	0 1 1 1 0 0 1 1 0 1 1 0 0 0 1 0 0 1 1 0
	0 0 1 1 0 1 1 1 0 0 1 0 0 1 1 1 0 0 1 1
	0 1 1
]
```

Show that the cumulative sum of approximate numbers can accumulate errors,
including in cases where multiplication does not:

```
>>> { :x |
>>> 	x + 0.01
>>> }.iterate(0, 100) > 1
true

>>> 0.01 * 100 > 1
false
```

Fractions are, of course, exact:

```
>>> { :x | x + 1/100 }.iterate(0, 100)
1/1
```

_Rationale:_
This notation can be more compact than a written out loop,
and can also be written in the middle of a sequence of bindings,
where a loop statement is not allowed.

* * *

See also: nestList, timesRepeat

References:
_Apl_
[1](https://aplwiki.com/wiki/Power_(operator)),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:iterate),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NestList.html),
_OEIS_
[1](https://oeis.org/A014707)

Categories: Enumerating
