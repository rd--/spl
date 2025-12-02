# lukasiewiczWord

- _lukasiewiczWord(d)_

Answer the Łukasiewicz word associated with the Dyck word _d_.
The word is given in normal form,
that is without writing the (implicit) final zero.

```
>>> DyckWord([1 0])
>>> .lukasiewiczWord
[1]

>>> DyckWord([1 1 1 1 0 1 0 1 0 0 0 0 1 0])
>>> .lukasiewiczWord
[2 1 1 3 0 0 0]

>>> [2 1 1 3 0 0 0]
>>> .isLukasiewiczWord
true
```

* * *

See also: DyckWord, isLukasiewiczWord
