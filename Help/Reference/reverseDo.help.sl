# reverseDo

- _reverseDo(aSequence, aBlock:/1)_

Evaluate _aBlock_ with each element of _aSequence_ as the argument,
starting with the last element and taking each in sequence up to the first.
This is the reverse of the enumeration for `do`.

```
>>> let s = '';
>>> [1 9 2 8 3 7 4 6].reverseDo { :i |
>>> 	s := s ++ i
>>> };
>>> s
'64738291'
```

* * *

See also: do, Iterable

References:
_Smalltalk_
5.7.8.27

Categories: Enumerating
