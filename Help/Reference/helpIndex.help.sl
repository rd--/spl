# helpIndex

- _helpIndex(aSystem)_

Answer a `HelpIndex` holding an index of the Spl help files.

```
>>> system.helpIndex.typeOf
'HelpIndex'
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
and this function requires the item be available locally.

* * *

See also: HelpFile, HelpIndex, LibraryItem

Categories: Help
