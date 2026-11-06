# Equal

`Equal` is a trait collecting behaviours for objects that are equatable.

The required method is either:

- `isEqualBy`

or both of:

- `isEqual`, `=`
- `isUnequal`, `!=`

The implemented methods are:

- `isSimilar`, `~`
- `isDissimilar`, `!~`

`Equal` is a `Trait`:

```
>>> system
>>> .traitDictionary['@Equal']
>>> .isTrait
true
```

* * *

See also: Compare, equal

Guides: Comparing Collections, Comparison Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-Eq.html#t:Eq)
_Rust_
[1](https://doc.rust-lang.org/std/cmp/trait.Eq.html)
