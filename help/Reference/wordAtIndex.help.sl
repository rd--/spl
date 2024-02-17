# wordAtIndex

_wordAtIndex(aString, anInteger)_

Get the word in _aString_ at index _anInteger_:

```
>>> let s = 'a list of words';
>>> [1 3 8 11].collect { :each | s.wordAtIndex(each) }
['a' 'list' 'of' 'words']
```

If the index points to a space look backwards for a word:

```
>>> 'a list of words'.wordAtIndex(7)
'list'
```

* * *

See also: String

