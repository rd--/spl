# HelpIndex

- _HelpIndex([k₁ t₁; k₂ t₂; …])_

A `Type` holding an index of the Sᴘʟ help files.
Each entry in the index is a list _(kind,topic)_.

The `helpIndex` method `System` answers a `HelpIndex`:

```
>>> system.helpIndex.typeOf
'HelpIndex'
```

Count _Reference_ files:

```
>>> system.helpIndex
>>> .names('Reference')
>>> .size
3965
```

Count _Guide_ files:

```
>>> system.helpIndex
>>> .names('Guide')
>>> .size
259
```

* * *

See also: helpIndex, HelpFile

Guides: Help Functions
