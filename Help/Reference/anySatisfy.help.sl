# anySatisfy

- _anySatisfy(c, f:/1)_

Evaluate the block _f_ with the elements of the collection _c_.
If _f_ answers `true` for any element return `true`, otherwise return `false`.
Only tests elements until one elements answers `true`.

```
>>> [1 3 5 7 9].anySatisfy(isEven:/1)
false

>>> [1 2 3 4 5].anySatisfy(isEven:/1)
true
```

An empty collection always answers `false`:

```
>>> [].anySatisfy(isEven:/1)
false
```

At `Record`:

```
>>> (a: 2, b: 3, c: 6).anySatisfy(isOdd:/1)
true
```

At `String`:

```
>>> 'Text'.anySatisfy(isUpperCase:/1)
true
```

Natural numbers _n_ such that there are _s_ and _w_ satisfying _0<s<w_ and _2s+5w=n_,
OEIS [A162918](https://oeis.org/A162918):

```
>>> 1:92.select { :n |
>>> 	1:n.anySatisfy { :s |
>>> 		let t = s + 1;
>>> 		t:n.anySatisfy { :w |
>>> 			(2 * s) + (5 * w) = n
>>> 		}
>>> 	}
>>> }
[
	12 17 19 22 24 26 27 29 31 32
	33 34 36 37 38 39 40 41 42 43
	44 45 46 47 48 49 50 51 52 53
	54 55 56 57 58 59 60 61 62 63
	64 65 66 67 68 69 70 71 72 73
	74 75 76 77 78 79 80 81 82 83
	84 85 86 87 88 89 90 91 92
]
```

* * *

See also: allSatisfy, noneSatisfy

Guides: Boolean Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:any)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AnyTrue.html),
_Smalltalk_
5.7.1.2

Categories: Testing
