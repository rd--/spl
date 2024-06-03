# unique

- _unique(aString)_

Answers a copy of _aString_ with a unique identifier appended.
The appended identifier is given by `uniqueId`.


```
>>> 'x'.unique
('x' ++ (system.uniqueId - 1).asString)
```

* * *

See also: ++, uniqueId

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Unique.html)
