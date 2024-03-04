# Nil

`Nil` is the `Type` of the value `nil`.

```
>>> nil.typeOf
'Nil'

>>> let nilType = system.typeDictionary['Nil'];
>>> nilType.methodDictionary.keys.includes('ifNil:/2')
true

>>> nil.respondsTo(ifNil:/2)
true
```

* * *

See also: nil, Void

References:
_Smalltalk_
5.3.2

Categories: Nil, Type
