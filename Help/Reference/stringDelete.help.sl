# stringDelete

- _stringDelete(s, x)_

Delete _x_,
which may be a string or a regular expression,
wherever it appears in the string _s_.

Remove whitespace from a string:

```
>>> '1 2 3 4 5 6 7 8 9'
>>> .stringDelete(' ')
'123456789'
```

Remove a specific character sequence:

```
>>> 'CACACGTCGACT'
>>> .stringDelete('CAC')
'ACGTCGACT'
```

Delete substrings matching a regular expression

```
>>> 'abcde12345abcde'.stringDelete(
>>> 	RegularExpression('[0-9]', 'g')
>>> )
'abcdeabcde'
```

* * *

See also: stringReplace

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringDelete.html),
