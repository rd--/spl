# nullaryApply

- _nullaryApply(f/0)_

Answers the answer of the no argument block _f_.

```
>>> { 'x' }.nullaryApply
'x'

>>> {
>>> 	'x'.nullaryApply
>>> }.hasError
true

>>> { 'x' }.apply
'x'
```

_Rationale_:
`apply` has forms at many arities,
each aliased to an arity specific form.

* * *

See also: Block, apply, cull

Guides: Block Functions
