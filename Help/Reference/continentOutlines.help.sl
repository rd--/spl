# continentOutlines

- _continentOutlines(aSystem, dataSet)_

Answer the named data set of continent outlines as a `GeoJson` value.

```
>>> system.continentOutlines(
>>> 	'LowResolution'
>>> ).isGeoJson
true
```

Draw the Gall-Peters projection of the continents labeled 'Africa' and 'Australia':

~~~spl svg=A
system
.continentOutlines(
	'LowResolution'
)
.features
.select { :each |
	['Africa', 'Australia'].includes(
		each.property('Continent')
	)
}
.collect { :each |
	each.geometryValues('Gall-Peters')
}
.LineDrawing
~~~

![](sw/spl/Help/Image/continentOutlines-A.svg)

_Note:_
The outline data sets are `LibraryItem` instances,
and this function requires the item be in the interpreter cache.

* * *

See also: GeoJson

Guides: Geodetic Functions, Library Catalogue
