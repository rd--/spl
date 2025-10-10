# paragraphs

- _paragraphs(s)_

Answer a list of strings, one for each paragraph in the input string _s_.

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

Guides: String Functions

Categories: Converting
