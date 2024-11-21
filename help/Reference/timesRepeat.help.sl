# timesRepeat

- _timesRepeat(anInteger, aBlock:/0)_

Evaluate the argument, _aBlock:/0_, the number of times represented by the receiver.

```
>>> let n = 2;
>>> 3.timesRepeat { n := n * n };
>>> n
256
```

Generate a symbolic continued fraction:

```
>>> let t = 3;
>>> 5.timesRepeat { t := 1 / (1 + t) };
>>> t
(1 / (1 + (1 / (1 + (1 / (1 + (1 / (1 + (1 / (1 + 3))))))))))
```

Build up a list of Mersenne primes:

```
>>> let t = [];
>>> 1:19.do { :n | let m = 2 ^ n - 1; m.isPrime.ifTrue { t.add([n, m]) } };
>>> t
[2 3; 3 7; 5 31; 7 127; 13 8191; 17 131071; 19 524287]
```

Unlike _toDo_, or _do_ at a Range the block does not receive the iteration counter as a parameter.

* * *

See also: do, iterate, toDo

Categories: Enumerating
