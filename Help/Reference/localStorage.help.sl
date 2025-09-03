# localStorage

- _localStorage(system)_

Answer the local `Storage` value of `system`.

```
>>> let s = system.localStorage;
>>> (
>>> 	s.isStorage,
>>> 	s.isDictionary,
>>> 	s.size.isInteger
>>> )
(true, true, true)
```

Check if a key exists:

```
>>> system.localStorage.includesKey('Pi')
false
```

Store a value:

```
>>> let s = system.localStorage;
>>> s['Pi'] := 1.pi.asString;
>>> s.includesKey('Pi')
true
```

Read a value:

```
>>> system.localStorage['Pi']
1.pi.asString
```

Delete an entry:

```
>>> let s = system.localStorage;
>>> let x = s.removeKey('Pi');
>>> (x, s.includesKey('Pi'))
(1.pi.asString, false)
```

Remove all entries,
this can be useful to force re-fetching:

~~~spl cache
system.localStorage.removeAll
~~~

* * *

See also: :=, at, atPut, Dictionary, includesKey, sessionStorage, Storage, System

Guides: System Functions
