# detectIndexIfFoundIfNone

- _detectIndexIfFoundIfNone(aSequence, predicate:/1, ifFound:/1, ifNotFound:/0)_

Detect index of first item at _aSequence_ that answers `true` for _predicate_,
applying _ifFound_ to the located index,
else evaluating _ifNotFound_.

```
>>> let x = [];
>>> [isZero:/1, isOne:/1].collect { :each |
>>> 	1:9.detectIndexIfFoundIfNone(each) { :i |
>>> 		x.add(i)
>>> 	} {
>>> 		x.add(nil)
>>> 	}
>>> };
>>> x
[nil 1]
```

* * *

See also: bisect, detect, detectIndex, indexOf
