# deepAllSatisfy

- _deepAllSatisfy(c, f:/1)_

Evaluate the block _f_ with the elements of the collection _c_.
If _f_ answers `false` for any element,
answers `false`,
otherwise answers `true`.
Only tests elements until one answers `false`.

```
>>> [3 3].iota.deepAllSatisfy(isInteger:/1)
true
```

* * *

See also: allSatisfy, deepDo, isArray

Guides: Boolean Functions, Array Functions

Categories: Testing
