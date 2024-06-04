# replicateEach

- _replicateEach(aSequence, anInteger | aSequence)_

Replicate each element of _aSequence_ the indicated number of times.

With `Integer` count:

```
>>> [1 3 5].replicateEach(3)
[1 1 1 3 3 3 5 5 5]

>>> [1 3 5] # 3
[1 1 1 3 3 3 5 5 5]
```

C.f. `!`:

```
>>> [1 3 5] ! [3]
[
	1 3 5;
	1 3 5;
	1 3 5
]
```

With `Sequence` count:

```
>>> [1 3 5].replicateEach([2 3 4])
[1 1 3 3 3 5 5 5 5]

>>> [1 3 5] # [2 3 4]
[1 1 3 3 3 5 5 5 5]
```

* * *

See also: !, #, replicateApplying

References:
_Apl_
[1](https://aplwiki.com/wiki/Replicate),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/number#dyadic)

Categories: Copying
