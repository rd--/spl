# whiteSpaceDelimitedWordAtIndex

- _whiteSpaceDelimitedWordAtIndex(aString, anInteger)_

Get the word in _aString_ at index _anInteger_:

```
>>> let s = 'a list of words';
>>> [1 3 8 11].collect { :each |
>>> 	s.whiteSpaceDelimitedWordAtIndex(each)
>>> }
['a' 'list' 'of' 'words']
```

If the index points to a space look backwards for a word:

```
>>> 'inner space'.whiteSpaceDelimitedWordAtIndex(6)
'inner'

>>> ' leading space'.whiteSpaceDelimitedWordAtIndex(1)
''

>>> 'trailing space '.whiteSpaceDelimitedWordAtIndex(15)
'space'
```

If the index is out of range answer signal an error:

```
>>> { 'four'.whiteSpaceDelimitedWordAtIndex(5) }.ifError { true }
true
```

* * *

See also: String, wordAtIndex

Categories: Accessing
