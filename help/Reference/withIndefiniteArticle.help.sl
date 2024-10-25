# withIndefiniteArticle

- _withIndefiniteArticle(aString)_

Prepend the indefinite article to _aString_, which is presumably a noun or noun phrase.

```
>>> 'List'.withIndefiniteArticle
'a List'

>>> [1 3 6 9].typeOf.withIndefiniteArticle
'a List'
```

The article depends on the first letter of the noun:

```
>>> 'Object'.withIndefiniteArticle
'an Object'

>>> (1 -- 9).typeOf.withIndefiniteArticle
'an Interval'
```

* * *

Categories: Printing
