# paragraphs

- _paragraphs(aString)_

Answer a `List` of `String`, one for each paragraph in _aString_.

```
>>> 'a\nb\n\nc'.paragraphs.collect(lines:/1)
['a' 'b'; 'c']

>>> 'a\nb\nc'.paragraphs.collect(lines:/1)
[['a' 'b' 'c']]
```

At empty `String`:

```
>>> ''.paragraphs
['']
```

* * *

See also: lines, sentences, unlines, words

Categories: Converting
