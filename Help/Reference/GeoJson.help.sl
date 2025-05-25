# GeoJson

- _GeoJson(aRecord)_

A `Type` holding a `Record` conforming to the GeoJson protocol.

Each `GeoJson` object has a `type`,
either 'Feature',
'FeatureCollection',
'GeometryCollection'.
or one of six primitive geometry types.

The primitive geometry types are
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
>>> let c = system.continentOutlines(
>>> 	'LowResolution'
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
>>> 	c.simplyConnectedPolygons.size,
>>> 	c.simplyConnectedPolygonCoordinates.size
>>> ]
[
	true,
	'FeatureCollection',
	true, false, false, false,
	153, 153, 153, 153, 153, 153
]
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
	each.geometryValues(
		gallPetersProjection:/1
	)
}
.LineDrawing
~~~

![](sw/spl/Help/Image/GeoJson-A.svg)

Draw the Gall stereographic projection of the country labeled 'Australia':

~~~spl svg=B
'ne_110m_admin_0_countries'
.naturalEarthUrl
.fetchJson
.then { :data |
	GeoJson(data)
	.features
	.select { :each |
		each.property('NAME') = 'Australia'
	}
	.collect { :each |
		each.geometryValues(
			gallStereographicProjection:/1
		)
	}
	.LineDrawing
}
~~~

![](sw/spl/Help/Image/GeoJson-B.svg)

Construct an empty feature:

```
>>> (type: 'Feature', properties: nil, geometry: nil)
>>> .GeoJson.isFeature
true
```

Accessors:

- `features`
- `geometries`
- `geometry`
- `geometryValues`
- `polygons`
- `properties`
- `property`
- `simplyConnectedPolygons`
- `type`

Predicates:

- `isFeature`
- `isFeatureCollection`
- `isGeometry`
- `isGeometryCollection`
- `isPolygon`
- `isSimplyConnectedPolygon`

* * *

See also: continentOutlines, Json

Guides: Geodetic Functions

References:
_Ietf_
[1](https://datatracker.ietf.org/doc/html/rfc7946),
_W_
[1](https://en.wikipedia.org/wiki/GeoJSON)
