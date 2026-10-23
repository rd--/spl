# normalArray

- _normalArray(x)_

Convert the object _x_ to a normal array from a special form.

At `SparseArray` answers a normal dense list:

```
>>> SparseArray([[4] -> 'a', [9] -> 'b'])
>>> .normalArray
[0 0 0 'a' 0 0 0 0 'b']
```

At `NumericArray` answers a normal dense list:

```
>>> NumericArray[1 2; 3 4; 5 6]
>>> .normalArray
[1 2; 3 4; 5 6]

>>> [3 3].iota
>>> .NumericArray
>>> .normalArray
[
	1 2 3;
	4 5 6;
	7 8 9
]
```

At `List` is the identity function if the list is in fact an array,
else an `error` is signalled:

```
>>> [1 2 3 4 5 6].normalArray
[1 2 3 4 5 6]

>>> [1 2 3; 4 5 6].normalArray
[1 2 3; 4 5 6]

>>> [1 2; 3 4:; 5 6; 7 8].normalArray
[1 2; 3 4:; 5 6; 7 8]

>>> {
>>> 	[1; 2 3; 4 5 6].normalArray
>>> }.hasError
true
```

* * *

See also: List, NumericArray, QuantityArray, SparseArray

Guides: Array Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Normal.html)
