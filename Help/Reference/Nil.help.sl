# Nil

`Nil` is the `Type` of the value `nil`.

```
>>> nil.typeOf
'Nil'
```

There are `ifNil` and `ifNotNil` control structures:

```
>>> nil.respondsTo(ifNil:/2)
true
```

There are two and three argument forms:

```
>>> let t = system.typeDictionary['Nil'];
>>> let m = t.methodDictionary;
>>> m.keys.includes('ifNil:/3')
true
```
* * *

See also: ?, ??, ~?, nil, ifNil, ifNotNil, Void

References:
_Smalltalk_
5.3.2

Categories: Object, Nil, Type
