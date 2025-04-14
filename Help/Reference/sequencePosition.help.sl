# sequencePosition

- _sequencePosition(list, sublist)_

Answer a list of the starting and ending positions at which _sublist_ appears in _list_.

Find the positions of a sublist in a list:

```
>>> ['a' 'b' 'c' 'd'].sequencePosition(['b' 'c'])
[[2 3]]

>>> ['a' 'b' 'a' 'b' 'a' 'b'].sequencePosition(['a' 'b'])
[1 2; 3 4; 5 6]
```

Find sequences of integers in a list:

```
>>> let r = Sfc32(367184);
>>> let i = [1 .. 10].randomChoice(r, [1E4]);
>>> i.sequencePosition([2 3 4 5])
[1557 1560; 3882 3885; 5489 5492]
```

* * *

See also: indicesOfSubstring

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SequencePosition.html)
