# superColliderProgramIndex

- _superColliderProgramIndex(aSystem)_

Answer the `SuperColliderProgramIndex`.

Count entries:

```
>>> system
>>> .superColliderProgramIndex
>>> .size
492
```

The programs are organised into `categories`:

```
>>> system
>>> .superColliderProgramIndex
>>> .categories
[
	'Graph',
	'Graph Collection',
	'Texture',
	'Texture Collection'
]
```

The `contents` of the index is a `List` of three element lists,
of the form _[Category, Author, ProgramName]_:

```
>>> system
>>> .superColliderProgramIndex
>>> .contents
>>> .includes(
>>> 	['Texture', 'Jmcc', 'Sidereal time']
>>> )
true
```

_Note:_
The catalogue is a `LibraryItem`,
and this function requires the item be available locally.

* * *

See also: SuperColliderProgramIndex
