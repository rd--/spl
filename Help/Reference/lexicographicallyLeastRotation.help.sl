# lexicographicallyLeastRotation

- _lexicographicallyLeastRotation([x₁ x₂ …])_

Answer the rotation of the sequence _x_ that is lexicographically least of all the rotations.

Three rotations that are not least:

```
>>> [1 3 2 1; 3 2 1 1; 2 1 1 3].collect(
>>> 	lexicographicallyLeastRotation:/1
>>> )
[1 1 3 2; 1 1 3 2; 1 1 3 2]
```

Least rotation of the letters in a word:

```
>>> 'BCABDADAB'
>>> .lexicographicallyLeastRotation
'ABBCABDAD'

>>> 'abracadabra'
>>> .lexicographicallyLeastRotation
'aabracadabr'

>>> 'bbaaccaadd'
>>> .lexicographicallyLeastRotation
'aaccaaddbb'
```

The published form of Booths algorithm fails for cases such as:

```
>>> [0 0 1 0]
>>> .lexicographicallyLeastRotation
[0 0 0 1]
```

* * *

See also: duvalsAlgorithm, isNecklace, lexicographicallyLeastRotationStartIndex

Guides: Cominatorial Functions, List Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Lexicographically_minimal_string_rotation)

Further Reading: Booth 1980
