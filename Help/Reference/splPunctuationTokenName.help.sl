# splPunctuationTokenName

- _splPunctuationTokenName(s)_

Answer the name,
which is a `String`,
of the punctuation token string _s_.

For single character tokens this is the unicode table name of the character:

```
>>> ','.splPunctuationTokenName
'comma'
```

For multiple character names, the indidual names are joined together:

```
>>> ':;'.splPunctuationTokenName
'colonSemicolon'
```

It is an `error` if the string is not a punctuation character:

```
>>> {
>>> 	'x'.splPunctuationTokenName
>>> }.hasError
true
```

* * *

See also: splOperatorNameTable, splOperatorTokenName, splPunctuationCharacterNameTable

Guides: Reflection Functions

Categories: Reflection
