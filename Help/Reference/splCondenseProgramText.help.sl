# splCondenseProgramText

- _splCondenseProgramText(s)_

At `String`,
delete any consecutive white space of any kind and replace with a single space,
deletes spaces after opening parentheses and brackets,
deletes spaces before full stops and closing parentheses and brackets.

```
>> ' ( 3\n + \n4 .square ) '
>> .splCondenseProgramText
(3 + 4.square)
```

* * *

See also: trim, withoutTrailingBlanks

Guides: Reflection Functions, String Functions
