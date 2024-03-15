# lineCount

- _lineCount(aString)_

Answer the number of lines at _aString_,
where the empty string has one line,
and every line feed adds one line.

```
>>> ''.lineCount
1

>>> 'a\nb c'.lineCount
2
```

If the last character is a new line that does not add to the count:

```
>>> 'a\nb c\n'.lineCount
2
```

* * *

See also: isCarriageReturn, isLineFeed
