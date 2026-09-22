# nubSieve

- _nubSieve([x₁ x₂ …])_

`nubSieve` answers a `Boolean` vector indicating which items of the sequence _x_ would be included in the result of `nub`.
More precisely, it indicates all items which do not match any earlier indicated item.
`nubSieve` is more informative than `nub` because it encodes not only which cells are unique but where they appear in the argument.

```
>>> 'Hello, World'.nubSieve.boole
[1 1 1 0 1 1 1 1 0 1 0 1]
```

Implement `nub`:

```
>>> let a = 'Hello, World';
>>> let b = a.nubSieve;
>>> let i = b.indicesOf(true);
>>> a.atAll(i)
'Helo, Wrd'
```

* * *

See also: copyWithoutIdenticalElements, nub, nubBy

References:
_Apl_
[1](https://aplwiki.com/wiki/Nub_Sieve)

Categories: Copying, Selecting
