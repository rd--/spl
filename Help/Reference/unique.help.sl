# unique

- _unique([x₁ x₂ …])_
- _unique(s)_

At `List`,
answer the same values as in _x_, but with no repetitions, and in sorted order.

```
>>> [1 1 2 1 2 3 1 2 3 4].unique
[1 2 3 4]

>>> [9 2 9 5].unique
[2 5 9]

>>> ['3' '2' '1' '2' '3'].unique
['1' '2' '3']
```

At `String`,
answers a copy of the string _s_ with a unique identifier appended.
The appended identifier is given by `uniqueId`.

```
>>> 'x'.unique
'x' ++ (system.uniqueId - 1).asString
```

* * *

See also: ++, nub, sort, String, uniqueElements, uniqueId

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Unique.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.unique.html)
