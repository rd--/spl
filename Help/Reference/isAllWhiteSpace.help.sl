# isAllWhiteSpace

- _isAllWhiteSpace(s)_

Answer `true` if the string _s_ contains only white space.
White space is defined here as `isSpace` or `isTab` or `isCarriageReturn` or `isLineFeed`.

One each of each white space character:

```
>>> ' \t\r\n'.isAllWhiteSpace
true
```

Not everything si white space:

```
>>> 'Plain text.'.isAllWhiteSpace
false
```

The empty line is all white space:

```
>>> ''.isAllWhiteSpace
true
```

* * *

See also: isBlankLine, isCarriageReturn, isLineFeed, isSpace, isTab

Categories: Testing, String
