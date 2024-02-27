# atAll

- _atAll(aSequence, indices)_

Answer a new collection like _aSequence_ containing all elements of _aSequence_ at _indices_.

```
>>> ['one' 'two' 'three' 'four'].atAll([3 2 4])
['three' 'two' 'four']
```

The infix form of this is `@*`:

```
>>> ['1' '2' '3' '4'] @* [3 2 4]
['3' '2' '4']

At `String`:

```
>>> 'abcde'.atAll([2 4 1 3 5])
'bdace'
```

* * *

See also: at, atAllPut

References:
_Apl_
[1](https://aplwiki.com/wiki/From),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/curlylf#dyadic)

Categories: Accessing
