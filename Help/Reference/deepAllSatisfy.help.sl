# deepAllSatisfy

- _deepAllSatisfy(aCollection, aBlock:/1)_

Evaluate _aBlock_ with the elements of _aCollection_.
If _aBlock_ answers `false` for any element,
answers `false`,
otherwise answers `true`.
Only tests elements until one answers `false`.

```
>>> [3 3].iota.deepAllSatisfy(isInteger:/1)
true
```

* * *

See also: allSatisfy, deepDo

Categories: Testing
