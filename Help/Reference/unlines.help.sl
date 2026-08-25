# unlines

- _unlines([s₁ s₂ …])_

Answer a `String` that joins together all of the input strings _s_,
after first appending a new line, also called a line feed, character to each.

```
>>> let list = ['a' 'bc' 'def'];
>>> let string = list.unlines;
>>> (string, string.lines)
('a\nbc\ndef\n', list)
```

Note that `unlines` and `lines` are not inverses when the input is not newline-terminated:

```
>>> 'a\nb'.lines.unlines
'a\nb\n'
```

* * *

See also: ++, concatenation, lines, stringIntercalate, stringJoin, unwords

Guides: String Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:unlines)

Categories: Converting
