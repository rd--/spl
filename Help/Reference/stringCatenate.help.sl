# stringCatenate

- _stringCatenate([s₁ s₂ …])_

Join together the `String` items of the sequence _s_.
Equivalent to `stringIntercalate` with the empty string.

At `List`:

```
>>> ['p' 'q' 'r' 's'].stringCatenate
'pqrs'

>>> ['p' 'q' 'r' 's'].stringIntercalate('')
'pqrs'
```

At the empty list:

```
>>> [].stringCatenate
''
```

The items must be `String` values,
compare to `stringJoin`:

```
>>> {
>>> 	['1' 2 '3'].stringCatenate
>>> }.hasError
true

>>> ['1' 2 '3'].stringJoin
'123'
```

* * *

See also: catenate, join, interleave, intersperse, splitBy, stringIntercalate, stringJoin

Guides: String Functions

Categories: Rearranging, String
