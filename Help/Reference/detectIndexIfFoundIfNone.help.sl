# detectIndexIfFoundIfNone

- _detectIndexIfFoundIfNone(a, f/1, g/1, h/0)_

Detect index of first item at the sequence _a_ that answers `true` for the predicate block _f_,
applying the block _g_ to the located index,
else evaluating _h_.

```
>>> let x = [];
>>> [isZero/1, isOne/1].collect { :each |
>>> 	1:9.detectIndexIfFoundIfNone(each) { :i |
>>> 		x.add!(i)
>>> 	} {
>>> 		x.add!(nil)
>>> 	}
>>> };
>>> x
[nil 1]
```

* * *

See also: bisect, detect, detectIndex, indexOf
