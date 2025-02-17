# allButFirst

- _allButFirst(aSequence, anInteger)_
- _allButFirst(α)_ ⇒ _allButFirst(α, 1)_

Answer a copy of _aSequence_ containing all but the first _anInteger_ elements.
Signal an error if there are not enough elements.

```
>>> [1 .. 9].allButFirst(5)
[6 .. 9]

>>> 'text'.allButFirst(3)
't'
```

The unary form answers all but the first element.

```
>>> [1 .. 9].allButFirst
[2 .. 9]

>>> 'text'.allButFirst
'ext'
```

If the sequence has as many places as are discared answer the empty sequence:

```
>>> [1].allButFirst
[]
```

If there are too few items an `error` is signalled:

```
>>> { [].allButFirst }.ifError { true }
true
```

* * *

See also: allButLast

Categories: Accessing
