# helpIndex

- _helpIndex(system)_

Answer a `HelpIndex` holding an index of the Sᴘʟ help files.

```
>>> system.helpIndex.typeOf
'HelpIndex'
```

Count entries:

```
>>> system.helpIndex.size
4241
```

Lookup a reference entry:

```
>>> system.helpIndex.find('SinOsc')
['Reference' 'SinOsc']
```

Lookup a guide entry:

```
>>> system
>>> .helpIndex
>>> .find('Tuning Functions')
['Guide' 'Tuning Functions']
```

To clear the help index from the cache:

~~~spl cache
system.libraryItem('HelpIndex').clearCache
~~~

_Note:_
The index is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: HelpFile, HelpIndex, LibraryItem

Guides: Help Functions, Library Catalogue, System Functions

Categories: Help
