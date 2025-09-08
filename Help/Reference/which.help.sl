# which

- _which([p₁ → f₁, p₂ → f₂, …])_

Iterate over an association list and answer the value of the block _f_ associated with the first key _p_ whose value is `true`.
If no clause answers `true`, answer `nil`.

```
>>> let a = 2;
>>> [
>>> 	{ a = 1 } -> { 'x' },
>>> 	{ a = 2 } -> { 'b' }
>>> ].which
'b'
```

Use `true` for an else clause that always matches:

```
>>> [-2 0 3].collect { :x |
>>> 	[
>>> 		{ x < 0 } -> { -1 },
>>> 		{ x > 0 } -> { 1 },
>>> 		{ true } -> { 0 }
>>> 	].which
>>> }
[-1 0 1]
```

* * *

See also: caseOf, if

Guides: Control Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Which.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-case)

Categories: Casing
