# replicateEach

- _replicateEach(aSequence, anInteger | aSequence)_

Replicate each element of _aSequence_ the indicated number of times.

With Integer count:

```
>>> [1 3 5].replicateEach(3)
[1 1 1 3 3 3 5 5 5]

>>> [1 3 5].replicate(3)
[1 3 5; 1 3 5; 1 3 5]
```

With Sequence count:

```
>>> [1 3 5].replicateEach([2 3 4])
[1 1 3 3 3 5 5 5 5]

>>> [0 1].replicate([2 3])
[0 1; 0 1; 0 1:;0 1; 0 1; 0 1]
```

* * *

See also: duplicate, replicate, replicateApplying

References:
_Apl_
[1](https://aplwiki.com/wiki/Replicate)

Categories: Copying
