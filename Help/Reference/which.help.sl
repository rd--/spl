# which

- _which(l)_

Iterate over the association list _l_ and answer the `value` of the `value` associated with the first key whose `value` is `true`.
If no clause answers `true`, answer `nil`.

```
>>> let a = 2;
>>> [
>>> 	a = 1 -> 'x',
>>> 	a = 2 -> 'b'
>>> ].which
'b'
```

Use `true` for an else clause that always matches:

```
>>> [-2 0 3].collect { :x |
>>> 	[
>>> 		x < 0 -> -1,
>>> 		x > 0 -> 1,
>>> 		true -> 0
>>> 	].which
>>> }
[-1 0 1]
```

* * *

See also: caseOf, caseOfOtherwise, if

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Which.html)

Categories: Casing
