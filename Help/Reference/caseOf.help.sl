# caseOf

- _caseOf(anObject, aCollection)_

The elements of _aCollection_ are `Association`s between `Block` values.
Answer the evaluated `value` of the first association whose evaluated key equals _anObject_.

With both `key` and `value` of each association as constants:

```
>>> let c = [
>>> 	'a' -> 1,
>>> 	'b' -> 2,
>>> 	'c' -> 3
>>> ];
>>> 'b'.caseOf(c)
2
```

With both `key` and `value` of each association as `Block`s:

```
>>> let c = [
>>> 	{ 'a' } -> { 1 * 1 },
>>> 	{ 'b' } -> { 2 * 2 },
>>> 	{ 'c' } -> { 3 * 3 }
>>> ];
>>> 'b'.caseOf(c)
4
```

If no match is found, report an error:

```
>>> let c = ['a' -> 1, 'b' -> 2, 'c' -> 3];
>>> {
>>> 	'd'.caseOf(c)
>>> }.ifError { true }
true
```

If _aCollection_ does not contain associations, report an `error`:

```
>>> {
>>> 	'x'.caseOf(['x' 'y' 'z'])
>>> }.ifError { true }
true
```

* * *

See also: =, caseOfOtherwise, if, value, which

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Switch.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Object.html#-switch)

Categories: Casing
