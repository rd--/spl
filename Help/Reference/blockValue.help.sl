# blockValue

- _blockValue(f/0)_

Answers the answer of the no argument block _f_.
Unlike `value` this is only defined at `Block` objects.

```
>>> { 'x' }.blockValue
'x'

>>> {
>>> 	'x'.blockValue
>>> }.hasError
true

>>> { 'x' }.value
'x'

>>> 'x'.value
'x'
```

_Rationale_:
This form is required to allow methods to require that a parameter be a block,
it subverts the `Value Protocol`.

* * *

See also: Block, cull, value

Guides: Block Functions
