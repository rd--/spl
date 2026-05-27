# commaSeparated

- _commaSeparated([s₁ s₂ …])_

Answer the `String` items of the list _s_ joined togther with a comma and space intercalated.

```
>>> ['a' 'b' 'c'].commaSeparated
'a, b, c'

>>> ['a' 'b' 'c']
>>> .stringIntercalate(', ')
'a, b, c'
```

It is an error if any list item is not a string:

```
>>> { [1 2 3].commaSeparated }.hasError
true
```

The method `commaSeparatedString`,
unlike `commaSeparated`,
first processes the list items using `asString`:

```
>>> [1 2 3].commaSeparatedString
'1, 2, 3'

>>> [1.2 2.3 3.4]
>>> .commaSeparatedString
'1.2, 2.3, 3.4'
```

* * *

See also: asString, List, String, stringIntercalate, unlines, unwords

Guides: String Functions
