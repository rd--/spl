# isBitString

- _isBitString(s)_

Answer `true` if all the characters in the string _s_ are either _0_ or _1_.

At `String`:

```
>>> '010010'.isBitString
true

>>> '012210'.isBitString
false

>>> ''.isBitString
false
```

`isBitVector` is also implemented at `String`,
however it answers `true` for the empty string:

```
>>> ''.isBitVector
true
```

* * *

See also: boole, isBitVector

Guides: String Functions

Categories: Testing
