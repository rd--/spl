# superColliderProgramIndex

- _superColliderProgramIndex(system)_

Answer the `SuperColliderProgramIndex`.

Count entries:

```
>>> system
>>> .superColliderProgramIndex
>>> .size
510
```

The programs are organised into `categories`:

```
>>> system
>>> .superColliderProgramIndex
>>> .categories
[
	'Graph'
	'Graph Collection'
	'Scheduler'
	'Scheduler Collection'
	'Texture'
	'Texture Collection'
]
```

The `contents` of the index is a `List` of three element lists,
of the form _[Category, Author, ProgramName]_:

```
>>> system
>>> .superColliderProgramIndex
>>> .programList
>>> .includes(
>>> 	['Texture', 'Jmcc', 'Sidereal time']
>>> )
true
```

To clear the help index from the cache:

~~~spl cache
system.libraryItem('SuperColliderProgramIndex').clearCache
~~~

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: SuperColliderProgramIndex

Guides: Library Catalogue
