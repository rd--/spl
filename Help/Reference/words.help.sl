# words

- _words(s)_

Answer a `List` having as items the words in the string _s_, which were delimited by white space.
Trims any white spaces at the beginning and at the end before splitting.

```
>>> 'Lorem ipsum\ndolor'.words
['Lorem' 'ipsum' 'dolor']

>>> ' foo bar '.words
['foo' 'bar']

>>> 'first second third fourth'.words
['first' 'second' 'third' 'fourth']

>>> 'The quick brown fox jumps over'
>>> .words
>>> .sort
[
	'brown' 'fox' 'jumps'
	'over' 'quick' 'The'
]
```

The empty string has zero words:

```
>>> ''.words
[]
```

`unwords` can sometimes undo `words`:

```
>>> 'The quick brown fox jumps over'
>>> .words
>>> .unwords
'The quick brown fox jumps over'
```

Multiple spaces are treated as one space:

```
>>> '  a   b    c     '.words
['a' 'b' 'c']
```

* * *

See also: lines, paragraphs, RegularExpression, sentences, splitByRegularExpression, unwords

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:words),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TextWords.html)

Categories: Converting
