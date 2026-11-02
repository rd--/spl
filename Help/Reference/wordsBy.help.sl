# wordsBy

- _wordsBy(s₁, s₂)_

Answer a `List` containing the substrings in the string _s₁_,
separated by any one of the elements of the string _s₂_.

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

See also: RegularExpression, stringSplit, stringSplitRegularExpression, words

References:
_Smalltalk_
5.7.10.15

Categories: Converting
