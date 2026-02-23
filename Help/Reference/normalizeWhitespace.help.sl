# normalizeWhitespace

- _normalizeWhitespace(s)_

Replace any consecutive whitespace at the string _s_ with a space character and then trim blanks.

```
>>> ' a  b	c '.normalizeWhitespace
'a b c'
```

Replaces tab and newline and carriage return characters:

```
>>> 'a  b\t\tc\n\nd\r\re\n\r\t f'
>>> .normalizeWhitespace
'a b c d e f'
```

* * *

See also: trim

Guides: String Functions
