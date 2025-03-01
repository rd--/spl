# unlines

- _unlines(aList)_

Given a `List` of `String`s,
answer a `String` that joins together all of the input strings separated by line feed (new line) characters.

```
>>> let list = ['a' 'bc' 'def'];
>>> let string = list.unlines;
>>> (string, string.lines)
('a\nbc\ndef', list)
```

* * *

See also: lines, stringIntercalate, unwords

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:unlines)

Categories: Converting
