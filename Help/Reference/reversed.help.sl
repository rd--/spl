# reversed

- _reversed(aSequence | aDictionary, anInteger=1)_

Answer a copy of _aSequence_ in the reverse order.
The answer is a new value of the same `species` as _aSequence_.

At `List`:

```
>>> [1 3 5 7].reversed
[7 5 3 1]
```

Not in place, see `reverse` for in place variant:

```
>>> let a = [1 3 5 7];
>>> let b = a.reversed;
>>> (a ~= b, b)
(true, [7 5 3 1])
```

At `String`:

```
>>> 'abcde'.reversed
'edcba'

>>> 'Backwards text'.reversed
'txet sdrawkcaB'

>>> 'no word, no bond, row on.'.reversed
'.no wor ,dnob on ,drow on'
```

`reversed` is its own inverse:

```
>>> 'Backwards text'.reversed.reversed
'Backwards text'
```

Row-reversed matrix:

```
>>> [1 2 3].diagonalMatrix.reversed
[
	0 0 3;
	0 2 0;
	1 0 0
]
```

Column-reversed matrix:

```
>>> [1 2 3].diagonalMatrix.reversed(2)
[
	0 0 1;
	0 2 0;
	3 0 0
]

>>> [1 2 3].diagonalMatrix.collect(reversed:/1)
[0 0 1; 0 2 0; 3 0 0]
```

Reverse is its own inverse:

```
>>> [1 2 3 4].reversed.reversed
[1 2 3 4]
```

At `Map`,
`reversed` swaps keys and values,
requiring that each value be both unique,
so that it can act as a key,
and also _immediate_:

```
>>> (x: 1, y: 2, z: 3).asMap.reversed
[(1 -> 'x'), (2 -> 'y'), (3 -> 'z')].asMap
```

Iteratively join a string to its reverse:

```
>>> { :x |
>>> 	x ++ x.reversed
>>> }.nestList('.|', 4)
[
	'.|'
	'.||.'
	'.||..||.'
	'.||..||..||..||.'
	'.||..||..||..||..||..||..||..||.'
]
```

Where supported `reversed` is displayed as ᴙ.

* * *

See also: reverse

References:
_Apl_
[1](https://aplwiki.com/wiki/Reverse),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bardot),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Reverse.html)
[1](https://reference.wolfram.com/language/ref/StringReverse.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#reversed),
_Smalltalk_
5.7.8.26

Unicode: U+1D19 ᴙ Latin Letter Small Capital Reversed R

Categories: Copying, Rearranging
