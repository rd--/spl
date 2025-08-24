# deleteStopWords

- _deleteStopWords([s₁ s₂ …])_

Deletes stopwords from a list of words.

Remove stopwords from a list:

```
>>> ['the' 'plastic' 'bag']
>>> .deleteStopWords
['plastic' 'bag']

>>> ['all' 'words' 'in' 'the' 'dictionary']
>>> .deleteStopWords
['words' 'dictionary']

>>> 'the apple on the table was red'
>>> .words
>>> .deleteStopWords
['apple' 'table' 'red']

>>> 'to be or not to be'
>>> .words
>>> .deleteStopWords
[]
```

* * *

See also: englishStopWords, reject

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteStopwords.html),
_W_
[1](https://en.wikipedia.org/wiki/Stop_word)
