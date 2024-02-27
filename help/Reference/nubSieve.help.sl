# nubSieve

- _nubSieve(aSequence)_

`nubSieve` answers a `Boolean` vector indicating which items of _aSequence_ would be included in the result of `nub`.
More precisely, it indicates all items which do not match any earlier indicated item.
`nubSieve` is more informative than `nub` because it encodes not only which cells are unique but where they appear in the argument.

```
>>> 'Hello, World'.nubSieve.boole
[1 1 1 0 1 1 1 1 0 1 0 1]
```

* * *

See also: nub

References:
_Apl_
[1](https://aplwiki.com/wiki/Nub_Sieve)

Categories: Copying, Selecting
