# GeoJson

- _GeoJson(aRecord)_

A `Type` holding a `Record` conforming to the GeoJson protocol.

Each `GeoJson` object has a `type`,
which will either 'Feature',
or 'FeatureCollection',
or 'GeometryCollection'.
or one of six primitive geometry types.

The primitive geometry types are:
'Point', 'MultiPoint'
'LineString', 'MultiLineString',
'Polygon' and 'MultiPolygon'.

A 'Feature' object has two fields.
A `properties` field holds an arbitrary `Record`,
which may be `nil`,
and a `geometry` field that is either
a primitive geometry object,
or a geometry collection,
and which may also be `nil`.

Collect information about a `GeoJson` object:

```
>>> let c = sytem.continentOutlines(
>>> 	'UniversityOfLatvia'
>>> );
>>> [
>>> 	c.isGeoJson,
>>> 	c.type,
>>> 	c.isFeatureCollection,
>>> 	c.isFeature,
>>> 	c.isGeometry,
>>> 	c.isGeometryCollection,
>>> 	c.features.size,
>>> 	c.geometries.size,
>>> 	c.geometries('Polygon').size,
>>> 	c.polygons.size,
>>> 	c.simplePolygons.size,
>>> 	c.simplePolygonCoordinates.size
>>> ]
[
	true,
	'FeatureCollection',
	true, false, false, false,
	153, 153, 153, 153, 153, 153, 153
]
```

Draw the Gall-Peters projection of the continents labeled 'Australia' and 'Africa':

~~~spl svg=A
sytem.continentOutlines(
	'UniversityOfLatvia'
).features.select { :each |
	['Africa', 'Australia'].includes(
		each.property('Continent')
	)
}.collect { :each |
	Line(
		each
		.simplePolygonCoordinates(
			gallPetersProjection:/1
		)
	)
}.LineDrawing
~~~

![](sw/spl/Help/Image/GeoJson-A.svg)

Accessors:

- `features`
- `geometries`
- `geometry`
- `polygons`
- `properties`
- `property`
- `simplePolygons`
- `type`

Predicates:

- `isFeature`
- `isFeatureCollection`
- `isGeometry`
- `isGeometryCollection`
- `isPolygon`
- `isSimplePolygon`

* * *

References:
_Ietf_
[1](https://datatracker.ietf.org/doc/html/rfc7946),
_W_
[1](https://en.wikipedia.org/wiki/GeoJSON)
