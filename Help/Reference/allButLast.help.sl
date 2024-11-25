# allButLast

- _allButLast(aSequence, anInteger)_
- _allButLast(α)_ ⇒ _allButLast(α, 1)_

Answer a copy of _aSequence_ containing all but the last _anInteger_ elements.
Signal an error if there are not enough elements.

```
>>> [1 .. 9].allButLast(5)
[1 .. 4]

>>> [1 .. 9].allButLast(9)
[]
```

It is an error if too many items are discarded:

```
>>> { [1 .. 9].allButLast(23) }.ifError { true }
true
```

The unary form answers all but the last element.

```
>>> [1 .. 9].allButLast
[1 .. 8]

>>> [1].allButLast
[]
```

At an empty list signals an error:

```
>>> { [].allButLast }.ifError { true }
true
```

At `String`:

```
>>> 'text'.allButLast(3)
't'

>>> 'text'.allButLast
'tex'

>>> 'tex'.allButLast(3)
''

>>> 't'.allButLast
''
```

At `String` it is likewise an error to discard too many items:

```
>>> { ''.allButLast }.ifError { true }
true
```

* * *

See also: allButFirst, copyFromTo, first, last

Categories: Accessing
