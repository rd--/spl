# isSubsetOf

- _isSubsetOf(alpha, beta)_ ⟹ _includesAllOf(beta, alpha)_

Answer `true` if the first collection is a subset of the second,
the inverse of `includesAllOf` which answers if the second collection is a subset of the first.

_1,3,5_ is a subset of _1,3,5,7_:

```
>>> [1 3 5].isSubsetOf([1 3 5 7])
true
```

The empty list is a subset of every list:

```
>>> [].isSubsetOf([])
true

>>> [].isSubsetOf([1 2 3])
true
```

Every list is a subset of itself,
c.f. `isProperSubsetOf`:

```
>>> [1 2 3].isSubsetOf([1 2 3])
true
```

A lipogrammatic panagram (Ezra 7:21):

```
>>> let l = 'english'.alphabet.without('j');
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
>>> t.isSubsetOf(l) & {
>>> 	l.isSubsetOf(t)
>>> }
true
```

* * *

See also: includes, includesAllOf, isProperSubsetOf

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SubsetQ.html),
SuperCollider
[1](https://doc.sccode.org/Classes/Collection.html#-isSubsetOf)

Categories: Testing
