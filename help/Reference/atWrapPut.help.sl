# atWrapPut

- _atWrapPut(aSequence, index, value)_

Store _value_ into _aSequence_ at _index_.
If _index_ is out of bounds, let it wrap around from the end to the beginning until it is in bounds.
Answer _value_.

```
>>> let l = [1 nil 3];
>>> let z = l.atWrapPut(5, 2);
>>> (l, z)
([1 2 3], 2)
```

* * *

See also: atPut, atPinPut, atWrap

Categories: Acccessing
