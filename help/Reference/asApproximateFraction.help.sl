# asApproximateFraction

- _asApproximateFraction(aNumber, epsilon)_

```
>>> -1:-3.collect { :each | (27 / 32).asApproximateFraction(10 ^ each) }
[3/4 11/13 27/32]

>>> 0:-5.collect { :each | pi.asApproximateFraction(10 ^ each) }
[3/1 16/5 22/7 201/64 333/106 355/113]
```

* * *

See also: convergents, rationalize, semiconvergents
