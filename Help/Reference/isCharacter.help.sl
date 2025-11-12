# isCharacter

- _isCharacter(aCharacter | aString)_

Answer `true` if _aString_ has only one place.

A one element `String` is both a `Character`
(in that it implements the `Character` `Trait`)
and a `String`:

```
>>> ('c'.isCharacter, 'c'.isString)
(true, true)
```

A `Character` is not a `String`:

```
>>> let c = Character('c');
>>> (c.isCharacter, c.isString)
(true, false)
```

* * *

See also: Character, isString

Categories: Testing
