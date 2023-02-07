# String -- text

_String_ is the type of text literals and constants.
There is no character type, fetching an indexed location in a string answers a string.
Strings are immutable, there is no _atPut_ implementation.

```
'string'.typeOf = 'String'
'string'[1] = 's'
```
