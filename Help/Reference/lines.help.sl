# lines

- _lines(s)_

Answer a `List` of `String`, one for each line of the string _s_, without the line ending delimiters.

```
>>> 'a\nbc\ndef'.lines
['a' 'bc' 'def']
```

The empty `String` contains no lines:

```
>>> ''.lines
[]
```

Single empty line:

```
>>> '\n'.lines
['']
```

Single unterminated line:

```
>>> 'one'.lines
['one']
```

Single non-empty line:

```
>>> 'one\n'.lines
['one']
```

Second line is empty:

```
>>> 'one\n\n'.lines
['one' '']
```

Second line is unterminated:

```
>>> 'one\ntwo'.lines
['one' 'two']
```

Two non-empty lines:

```
>>> 'one\ntwo\n'.lines
['one' 'two']
```

The inverse is `unlines`:

```
>>> ['a' 'bc' 'def']
>>> .unlines.lines
['a' 'bc' 'def']
```

* * *

See also: paragraphs, sentences, unlines, words

Guides: String Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:lines)

Categories: Accessing
