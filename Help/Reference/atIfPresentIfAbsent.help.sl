# atIfPresentIfAbsent

- _atIfPresentIfAbsent(aCollection, aKey, ifPresentBlock:/1, ifAbsentBlock:/0)_

Lookup the value associated with _aKey_ in _aCollection_.
If the key is present,
answer the value of evaluating _ifPresentBlock_ with the value associated with the key.
Otherwise, evaluate _ifAbsentBlock_.

```
>>> ['x' 'y' 'z'].collect { :each |
>>> 	(x: 1, y: 2)
>>> 	.atIfPresentIfAbsent(each) { :i |
>>> 		i
>>> 	} {
>>> 		nil
>>> 	}
>>> }
[1, 2, nil]
```

* * *

See also: at, atIfAbsent, atIfPresent

Categories: Accessing
