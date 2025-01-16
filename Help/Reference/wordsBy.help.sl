# wordsBy

- _wordsBy(aString, separators)_

Answer a `List` containing the substrings in _aString_ separated by the elements of _separators_.

```
>>> 'abbccba'.wordsBy('ab')
['cc']

>>> 'a word, another'.wordsBy(' ,')
['a' 'word' 'another']
```

_Rationale_:
This is called _subStrings_ in Smalltalk,
however that name is awkward in relation to `substrings` and `substrings`.

* * *

See also: RegExp, splitBy, splitByRegExp, words

References:
_Smalltalk_
5.7.10.15

Categories: Converting
