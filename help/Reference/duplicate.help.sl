# duplicate

- _duplicate(aBlock:/0, anInteger | aSequence)_
- _duplicate(alpha)_ ⟹ _duplicate(alpha, 2)_

Evaluate _aBlock_ _anInteger_ times and collect the results into a List.

```
>>> { 1 }.duplicate(3)
[1 1 1]

>>> { 1.duplicate(3) }.ifError { true }
true
```

In the Sequence case evaluate _aBlock_ to fill an array of the indicated shape:

``
>>> { 1 }.duplicate([2 3])
[1 1 1; 1 1 1]

>>> { 1 }.duplicate([3 2 3])
[1 1 1; 1 1 1:; 1 1 1; 1 1 1:; 1 1 1; 1 1 1]
```

* * *

See also: !, replicate, replicateApplying

Categories: Copying
