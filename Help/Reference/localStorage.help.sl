# localStorage

- _localStorage(aSystem)_

Answer the local `Storage` value of _aSystem_.

```
>>> let s = system.localStorage;
>>> (s.isStorage, s.isDictionary)
(true, true)
```

Check if a key exists:

```
>>> system.localStorage.includesKey('PI')
false
```

Store a value:

```
>>> let s = system.localStorage;
>>> s['PI'] := 1.pi.asString;
>>> s.includesKey('PI')
true
```

Read a value:

```
>>> system.localStorage['PI']
1.pi.asString
```

Delete an entry:

```
>>> let s = system.localStorage;
>>> let x = s.removeKey('PI');
>>> (x, s.includesKey('PI'))
(1.pi.asString, false)
```

* * *

See also: Storage
