# withoutTrailingLineFeed

- _withoutTrailingLineFeed(aString)_

Remove any trailing line feed characters from _aString_.

```
>>> 'text\n'.withoutTrailingLineFeed
'text'

>>> 'text'.withoutTrailingLineFeed
'text'

>>> '\n'.withoutTrailingLineFeed
''
```

* * *

See also: isLineFeed, withoutTrailingBlanks
