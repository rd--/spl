# splitByRegExp

- _splitByRegExp(aString, aRegExpString)_

Regular expressions:

```
>>> 'A tree, an apple, four pears. And more: two sacks'.splitByRegExp('\\W+')
['A' 'tree' 'an' 'apple' 'four' 'pears' 'And' 'more' 'two' 'sacks']
```

Split into substrings separated by either delimiter:

```
>>> 'a-b:c-d:e-f-g'.splitByRegExp(':|-')
['a' 'b' 'c' 'd' 'e' 'f' 'g']
```

* * *

See also: splitBy
