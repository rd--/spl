# asApproximateFraction

- _asApproximateFraction(aNumber, epsilon)_

```
>>> [0.1 0.01 0.001].collect { :each | (27 / 32).asApproximateFraction(each) }
[3/4 11/13 27/32]

>>> [0.1 0.01 0.001 0.0001 0.00001].collect { :each | pi.asApproximateFraction(each) }
[3/4 11/13 27/32 333/106 355/113]
```

* * *

See also: convergents, semiconvergents
