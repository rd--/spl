# punctuationTokenName

- _punctuationTokenName(aString)_

Answer the name,
which is a `String`,
of the punctuation token _aString_.

For single character tokens this is the unicode table name of the character:

```
>>> ','.punctuationTokenName
'comma'
```

For multiple character names, the indidual names are joined together:

```
>>> ':;'.punctuationTokenName
'colonSemicolon'
```

It is an `error` if the string is not a punctuation character:

```
>>> { 'x'.punctuationTokenName }.ifError { true }
true
```

* * *

See also: operatorNameTable, operatorTokenName, punctuationCharacterNameTable

Categories: Reflection
