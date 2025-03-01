# stringIntercalate

- _stringIntercalate(aList, aString)_

Join _aList_ (which must be a list of strings) into a string, intercalating _aString_ between each.

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

Categories: String
