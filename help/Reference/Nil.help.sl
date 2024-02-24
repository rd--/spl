# Nil

`Nil` is the `Type` of the value `nil`.

```
>>> nil.typeOf
'Nil'

>>> system.typeDictionary['Nil'].methodDictionary.keys.includes('ifNil:/2')
true

>>> nil.respondsTo(ifNil:/2)
true
```

* * *

See also: nil, Void

Categories: Nil, Type
