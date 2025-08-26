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
```

Remove stopwords from a string:

```
>>> 'the apple on the table was red'
>>> .words
>>> .deleteStopWords
['apple' 'table' 'red']

>>> 'The blue ball had rolled under the table.'
>>> .words
>>> .deleteStopWords
['blue' 'ball' 'rolled' 'table.']

>>> 'This door is no longer open on Sunday.'
>>> .words
>>> .deleteStopWords
['door' 'longer' 'open' 'Sunday.']

>>> 'to be or not to be'
>>> .words
>>> .deleteStopWords
[]
```

Remove stopwords from a list of strings:

```
>>> [
>>> 	'The sky is blue.'
>>> 	'The grass is green'
>>> ].collect { :each |
>>> 	each.words.deleteStopWords
>>> }
['sky' 'blue.'; 'grass' 'green']
```

* * *

See also: asLowerCase, englishStopWords, reject

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DeleteStopwords.html),
_W_
[1](https://en.wikipedia.org/wiki/Stop_word)
