# replicateEach

- _replicateEach([x₁ x₂ …], n)_

Replicate each element of the sequence _x_ the number of times indicated by _n_.

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

At `String`:

```
>>> 'xyz'.replicateEach([2 3 4])
'xxyyyzzzz'
```

* * *

See also: !, #, replicateApplying

Guides: List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Replicate),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/number#dyadic)

Categories: Copying
