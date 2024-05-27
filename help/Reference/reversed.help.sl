# reversed

- _reversed(aSequence)_

Answer a copy of _aSequence_ in the reverse order.
The answer is a new value of the same _species_ as _aSequence_.

At `List`:

```
>>> [1 3 5 7].reversed
[7 5 3 1]

>>> let a = [1 3 5 7];
>>> a.reversed ~= a
true
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
>>> [1 2 3].diagonalMatrix.collect(reversed:/1)
[
	0 0 1;
	0 2 0;
	3 0 0
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
_Smalltalk_
5.7.8.26

Unicode: U+1D19 ᴙ Latin Letter Small Capital Reversed R

Categories: Copying
