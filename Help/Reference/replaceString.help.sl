# replaceString

- _replaceString(aString, searchString, replaceString)_

Replace substring:

```
>>> 'a short string'
>>> .replaceString('short', 'longer')
'a longer string'
```

Replace first occurence of one string with another:

```
>>> 'x x x'.replaceString('x', 'y')
'y x x'
```

Replacement must be a string:

```
>>> {
>>> 	'x x x'.replaceString('x', 1)
>>> }.ifError { true }
true
```

* * *

See also: replaceStringAll

Categories: Replacing
