# match

- _match(r, s)_

Answer the part of the string _s_ that matches the regular expression _r_.
else `nil` if there is no match.

Match entire string:

```
>>> RegularExpression('c(a|d)+r')
>>> .match('caddar')
'caddar'
```

Match interior string:

```
>>> RegularExpression('c(a|d)+r')
>>> .match('-caddar-')
'caddar'
```

No match:

```
>>> RegularExpression('c(a|d)+r')
>>> .match('xyz')
nil
```

Match prefix:

```
>>> RegularExpression('(-|>)+')
>>> .match('>>> ')
'>>>'
```

Match prefix:

```
>>> RegularExpression('(-|>)+')
>>> .match('>- ')
'>-'
```

* * *

See also: matches, matchRegularExpression, RegularExpression, search

Categories: Testing
