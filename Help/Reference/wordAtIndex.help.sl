# wordAtIndex

- _wordAtIndex(aString, anInteger)_

Answer the word in _aString_ at index _anInteger_:

```
>>> let s = 'a list of words';
>>> [1 3 8 11].collect { :each |
>>> 	s.wordAtIndex(each)
>>> }
['a' 'list' 'of' 'words']
```

If the index points to a space look backwards for a word:

```
>>> 'inner space'.wordAtIndex(6)
'inner'

>>> ' leading space'.wordAtIndex(1)
''

>>> 'trailing space '.wordAtIndex(15)
'space'
```

If the index is out of range answer signal an error:

```
>>> {
>>> 	'four'.wordAtIndex(5)
>>> }.ifError { true }
true
```

* * *

See also: RegExp, String, whiteSpaceDelimitedWordAtIndex

Categories: Accessing
