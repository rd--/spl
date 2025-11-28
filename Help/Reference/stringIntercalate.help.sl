# stringIntercalate

- _stringIntercalate([s₁ s₂ …], t)_

Join the list of strings _s_ into a string, intercalating the string _t_ between each.

Join a list of strings into a string, this form is equal to `stringCatenate`:

```
>>> ['x' 'y' 'z'].stringIntercalate('')
'xyz'
```

With a non-empty separator string:

```
>>> ['x' 'y' 'z'].stringIntercalate(', ')
'x, y, z'

>>> ['x' 'y' 'z'].commaSeparated
'x, y, z'
```

At the empty list:

```
>>> [].stringIntercalate(', ')
''
```

* * *

See also: ++, +++, catenate, flatten, intercalate, join, splitBy, stringCatenate, stringJoin

Guides: String Functions

Categories: String
