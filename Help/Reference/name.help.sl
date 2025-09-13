# name

- _name(x)_

Answer the name of the object _x_, if it has one.

At `Block`:

```
>>> +.name
'plusSign:/2'

>>> sqrt:/1.name
'sqrt:/1'
```

The name of an anonymous block is the empty `String`:

```
>>> { }.name
''
```

At `Symbol`:

```
>>> `x`.name
'x'

>>> 𝒙.name
'x'
```

At `Error`:

```
>>> Error('message text').name
'Error'
```

At `Type`:

```
>>> [].typeDefinition.name
'List'
```

* * *

See also: description, error, Error, messageText

References:
_Smalltalk_
5.5.1.5

Categories: Errors
