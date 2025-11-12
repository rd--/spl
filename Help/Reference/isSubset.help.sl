# isSubset

- _isSubset(c₁, c₂)_

Answer `true` if the collection _c₁_ is a subset of the _c₂_.

_1,3,5_ is a subset of _1,3,5,7_:

```
>>> [1 3 5].isSubset([1 3 5 7])
true

>>> [1 3 5 7].includesAll([1 3 5])
true
```

The empty list is a subset of every list:

```
>>> [].isSubset([])
true

>>> [].isSubset([1 2 3])
true
```

Every list is a subset of itself,
c.f. `isProperSubset`:

```
>>> [1 2 3].isSubset([1 2 3])
true
```

A lipogrammatic panagram (Ezra 7:21):

```
>>> let e = 'english'.namedAlphabet;
>>> let l = e.without('j');
>>> let v = [
>>> 	'And I, even I Artaxerxes'
>>> 	'the king, do make a decree'
>>> 	'to all the treasurers which'
>>> 	'are beyond the river,'
>>> 	'that whatsoever Ezra the'
>>> 	'priest, the scribe of the'
>>> 	'law of the God of heaven,'
>>> 	'shall require of you, it'
>>> 	'be done speedily'
>>> ].unwords.asLowerCase;
>>> let t = v.contents.withoutAll(
>>> 	[' ' ',']
>>> );
>>> t.isSubset(l) & {
>>> 	l.isSubset(t)
>>> }
true
```

* * *

See also: includes, includesAll, isProperSubset

Guides: Set Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SubsetQ.html),
SuperCollider
[1](https://doc.sccode.org/Classes/Collection.html#-isSubsetOf)

Categories: Testing
