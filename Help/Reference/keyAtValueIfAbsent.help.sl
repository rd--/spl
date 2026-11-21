# keyAtValueIfAbsent

- _keyAtValueIfAbsent(d, x, f/0)_

Answer the key that is the external name for the argument value _x_ in the dictionary _d_.
If there is none, evaluate and answer _f_.

```
>>> (x: 1, y: 2, z: 3)
>>> .keyAtValueIfAbsent(3) {
>>> 	nil
>>> }
'z'

>>> (x: 1, y: 2)
>>> .keyAtValueIfAbsent(3) {
>>> 	nil
>>> }
nil
```

* * *

See also: keyAtValue

References:
_Smalltalk_
5.7.2.8

Categories: Accessing
