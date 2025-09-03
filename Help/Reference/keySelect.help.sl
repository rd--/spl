# keySelect

- _keySelect(d, f:/1)_

Evaluate the block _f_ with each of the keys of the dictionary _d_ as the argument.
Collect into a new dictionary only those elements for which _f_ evaluates to `true`.

At `Record`, select keys that are letters:

```
>>> (a: 1, b: 2, '3': 3)
>>> .keySelect(isLetter:/1)
(a: 1, b: 2)
```

At `Map`, select keys that are even:

```
>>> [1: 'a', 2: 'b', 3: 'c']
>>> .keySelect(isEven:/1)
[2: 'b']
```

At `List`, select keys that odd:

```
>>> [1 -> 'a', 2 -> 'b', 3 -> 'c']
>>> .keySelect(isOdd:/1)
[1 -> 'a', 3 -> 'c']
```

* * *

See also: collect, detect, select, reject

Guides: Dictionary Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KeySelect.html)

Categories: Enumerating
