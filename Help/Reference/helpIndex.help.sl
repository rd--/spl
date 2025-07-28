# helpIndex

- _helpIndex(aSystem)_

Answer a `HelpIndex` holding an index of the Spl help files.

```
>>> system.helpIndex.typeOf
'HelpIndex'
```

Count entries:

```
>>> system.helpIndex.size
3403
```

Lookup a reference entry:

```
>>> system.helpIndex.find('SinOsc')
['Reference', 'SinOsc']
```

Lookup a guide entry:

```
>>> system
>>> .helpIndex
>>> .find('Tuning Functions')
['Guide', 'Tuning Functions']
```

_Note:_
The index is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: HelpFile, HelpIndex, LibraryItem

Categories: Help
