# whiteSpaceDelimitedWordAtIndex

- _whiteSpaceDelimitedWordAtIndex(s, n)_

Get the word in the string _s_ at index _n_:

```
>>> let s = 'a list of words';
>>> [1 3 8 11].collect { :each |
>>> 	s.whiteSpaceDelimitedWordAtIndex(each)
>>> }
['a' 'list' 'of' 'words']
```

If the index points to a space look backwards for a word:

```
>>> 'p q'.whiteSpaceDelimitedWordAtIndex(2)
'p'

>>> ' p q'.whiteSpaceDelimitedWordAtIndex(1)
''

>>> 'p q '.whiteSpaceDelimitedWordAtIndex(4)
'q'
```

If the index is out of range answer signal an error:

```
>>> {
>>> 	'four'.whiteSpaceDelimitedWordAtIndex(5)
>>> }.hasError
true
```

* * *

See also: String, wordAtIndex

Categories: Accessing
