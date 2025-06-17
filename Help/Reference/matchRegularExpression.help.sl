# matchRegularExpression

- _matchRegularExpression(s, r)_

Answer the part of the string _s_ that matches the regular expression _r_,
else `nil` if there is no match.
_r_ will be compiled if required.

With `String` regular expression:

```
>>> 'caddar'.matchRegularExpression('c(a|d)+r')
'caddar'
```

With a compiled `RegularExpression`:

```
>>> let r = RegularExpression('c(a|d)+r');
>>> '-caddar-'.matchRegularExpression(r)
'caddar'
```

Answer `nil` if no match:

```
>>> 'xyz'.matchRegularExpression('c(a|d)+r')
nil
```

Punctuation:

```
>>> '>>>'.matchRegularExpression('(-|>)+')
'>>>'

>>> '>- '.matchRegularExpression('(-|>)+')
'>-'
```

* * *

See also: asRegularExpression, match, matches, RegularExpression, search

Categories: Testing
