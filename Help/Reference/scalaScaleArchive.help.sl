# scalaScaleArchive

- _scalaScaleArchive(aSystem)_

Answer a `List` holding the _Scala_ scale archive.

Count number of entries:

```
>>> system.scalaScaleArchive.size
3087
```

The items are are `Scale` objects:

```
>>> system
>>> .scalaScaleArchive
>>> .anyOne
>>> .isScale
true
```

Count the seven-note scales:

```
>>> system
>>> .scalaScaleArchive
>>> .count { :each |
>>> 	each.intervals.size = 7
>>> }
849
```

Count the scales where the `startIndex` is not `one`:

```
>>> system
>>> .scalaScaleArchive
>>> .count { :each |
>>> 	each.startIndex ~= 1
>>> }
17
```

Count the scales where the `stepArity` is not three
(scales with a step arity of two are called binary scales,
those with a step arity of three are called ternary scales):

```
>>> system
>>> .scalaScaleArchive
>>> .count { :each |
>>> 	each.stepArity = 3
>>> }
657
```

Look up an entry in the archive by name, and fetch the intervals:

```
>>> system
>>> .scalaScaleArchive
>>> .detect { :each |
>>> 	each.nameList.includes('Major')
>>> }
>>> .intervals
[2 2 1 2 2 2 1]
```

Select set of scales by name:

```
>>> system
>>> .scalaScaleArchive
>>> .select { :each |
>>> 	each.nameList.anySatisfy { :name |
>>> 		name = 'Antilydian'
>>> 	}
>>> }.collect(intervals:/1)
[
	2 2 2 3 2 2 3;
	3 3 3 4 3 3 4;
	3 3 3 5 3 3 5;
	4 4 4 5 4 4 5
]
```

_Note:_
The archive is a `LibraryItem`,
and this function requires the item be available locally.

The archive is stored in the file _modename.par_ in the Scala distribution.

* * *

See also: LibraryItem, namedScale, scalaTuningArchive, Scale

References:
_Scala_
[1](https://www.huygens-fokker.org/scala/)
