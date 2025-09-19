# blockValue

- _blockValue(f:/0)_

Answers the answer of the no argument block _f_.
Unlike `value` this is only defined at `Block` objects.

```
>>> { 'x' }.blockValue
'x'

>>> {
>>> 	'x'.blockValue
>>> }.ifError { true }
true

>>> { 'x' }.value
'x'

>>> 'x'.value
'x'
```

* * *

See also: Block, cull, value

Guides: Block Functions
