# atPutWrap

- _atPutWrap(aSequence, index, value)_

Store _value_ into _aSequence_ at _index_.
If _index_ is out of bounds, let it wrap around from the end to the beginning until it is in bounds.
Answer _value_.

```
>>> let l = [1 nil 3];
>>> let z = l.atPutWrap(5, 2);
>>> (l, z)
([1 2 3], 2)
```

* * *

See also: atPut, atPutPin, atWrap

Categories: Acccessing
