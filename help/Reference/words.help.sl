# words

- _words(aString)_

Answer a `List` having as items the _words_ in _aString_, which were delimited by white space.
Trims any white spaces at the beginning and at the end before splitting.

```
>>> 'Lorem ipsum\ndolor'.words
['Lorem' 'ipsum' 'dolor']

>>> ' foo bar '.words
['foo' 'bar']

>>> 'first second third fourth'.words
['first' 'second' 'third' 'fourth']

>>> 'The quick brown fox jumps over the lazy dog.'.words.sort
['brown' 'dog.' 'fox' 'jumps' 'lazy' 'over' 'quick' 'the' 'The']
```

`unwords` can sometimes undo `words`:

```
>>> let string = 'The quick brown fox jumps over the lazy dog.';
>>> string.words.unwords
string
```

* * *

See also: lines, paragraphs, sentences, splitByRegExp, unwords

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:words),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TextWords.html)

Categories: Converting
