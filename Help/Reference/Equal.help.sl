# Equal

`Equal` is a `Trait` collecting behaviours for objects that are equatable.

```
>>> system
>>> .traitDictionary['Equal']
>>> .isTrait
true
```

The required method is either:

- `isEqualBy`

or both of:

- `isEqual`, `=`
- `isUnequal`, `!=`

The implemented methods are:

- `isSimilar`, `~`
- `isDissimilar`, `!~`

* * *

See also: Compare, equal

Guides: Comparing Collections

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-Eq.html#t:Eq)
_Rust_
[1](https://doc.rust-lang.org/std/cmp/trait.Eq.html)
