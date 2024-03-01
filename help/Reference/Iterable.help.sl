# Iterable

`Iterable` is a collection `Trait`.

To implement `Iterable` a type must provide `do`.

Iterable defines `size` in terms of `do`, but for many types a more efficient form is possible.

```
>>> system.traitDictionary['Iterable'].isTrait
true

>>> system.traitTypes('Iterable').includes('List')
true
```

* * *

See also: Collection, do, size, Trait

Categories: Trait
