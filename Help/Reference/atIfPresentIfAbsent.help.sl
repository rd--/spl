# atIfPresentIfAbsent

- _atIfPresentIfAbsent(c, k, α:/1, β:/0)_

Lookup the value associated with the key _k_ in the collection _c_.
If the key is present,
answer the value of evaluating the unary block _α_ with the value associated with the key.
Otherwise, evaluate the no-argument block _β_ as the answer.

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
