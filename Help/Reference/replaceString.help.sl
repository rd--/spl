# replaceString

- _replaceString(s₁, s₂, s₃)_

Replace the first occurence of the search string _s₂_ with the replacement string _s₃_ in the string _s₁_.

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
>>> }.hasError
true
```

* * *

See also: replaceStringAll

Guides: String Functions

Categories: Replacing
