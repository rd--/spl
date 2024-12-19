# paragraphs

- _paragraphs(aString)_

Answer a `List` of `String`, one for each paragraph in _aString_.

Two paragraphs, the first having two lines:

```
>>> 'a\nb\n\nc'
>>> .paragraphs
>>> .collect(lines:/1)
['a' 'b'; 'c']
```

One paragraph of three lines:

```
>>> 'a\nb\nc'
>>> .paragraphs
>>> .collect(lines:/1)
[['a' 'b' 'c']]
```

At empty `String` has one paragraph which is empty:

```
>>> ''.paragraphs
['']
```

* * *

See also: lines, sentences, unlines, words

Categories: Converting
