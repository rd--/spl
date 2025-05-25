GeoJson : [Object] { | contents |

	asRecord { :self |
		self.contents
	}

	coordinates { :self |
		self.isGeometry.if {
			self.field('coordinates')
		} {
			self.error('GeoJson>>coordinates: not geometry')
		}
	}

	features { :self |
		self.type.caseOf([
			'Feature' -> {
				[self]
			},
			'FeatureCollection' -> {
				self.field('features').collect(GeoJson:/1)
			}
		]) {
			[]
		}
	}

	field { :self :key |
		self.contents.at(key)
	}

	geometries { :self |
		self.isGeometry.if {
			[self]
		} {
			self.isGeometryCollection.if {
				self.field('geometries').collect(GeoJson:/1)
			} {
				self.features.collect(geometry:/1)
			}
		}
	}

	geometries { :self :geometryType |
		self.geometries.select { :each |
			each.type = geometryType
		}
	}

	geometry { :self |
		self.isFeature.if {
			GeoJson(self.field('geometry'))
		} {
			self.error('GeoJson>>geometry: not Feature')
		}
	}

	geometryValues { :self |
		let polygonValue = { :c |
			(c.size = 1).if {
				Polygon(c[1])
			} {
				PolygonWithHoles(c[1], c.allButFirst)
			}
		};
		self.geometries.collect { :each |
			let c = each.coordinates;
			each.type.caseOf([
				'Point' -> {
					Point(c)
				},
				'LineString' -> {
					Line(c)
				},
				'Polygon' -> {
					polygonValue(c)
				},
				'MultiPoint' -> {
					PointCloud(c)
				},
				'MultiLineString' -> {
					GeometryCollection(
						c.collect(Line:/1)
					)
				},
				'MultiPolygon' -> {
					GeometryCollection(
						c.collect(polygonValue:/1)
					)
				}
			])
		}
	}

	geometryValues { :self :projectionFunction:/1 |
		let f = { :each |
			let [phi, lambda] = each.degreesToRadians;
			projectionFunction(
				[lambda, phi]
			)
		};
		self.geometryValues.collect { :each |
			each.project(f:/1)
		}
	}

	hasField { :self :key |
		self.contents.includesKey(key)
	}

	isFeature { :self |
		self.type = 'Feature' & {
			self.contents.includesKeys(['geometry', 'properties'])
		}
	}

	isFeatureCollection { :self |
		self.type = 'FeatureCollection'
	}

	isGeometry { :self |
		[
			'Point', 'MultiPoint',
			'LineString', 'MultiLineString',
			'Polygon', 'MultiPolygon'
		].includes(self.type)
	}

	isGeometryCollection { :self |
		self.type = 'GeometryCollection'
	}

	isPolygon { :self |
		self.type = 'Polygon'
	}

	isSimplyConnectedPolygon { :self |
		self.isPolygon & {
			self.coordinates.size = 1
		}
	}

	polygons { :self |
		self.geometries.select(isPolygon:/1)
	}

	properties { :self |
		self.isFeature.if {
			self.field('properties')
		} {
			self.error('GeoJson>>properties: not Feature')
		}
	}

	property { :self :key |
		self.properties.ifNil {
			self.error('GeoJson>>property: nil properties')
		} { :aRecord |
			aRecord.at(key)
		}
	}

	simplyConnectedPolygons { :self |
		self.geometries.select(isSimplyConnectedPolygon:/1)
	}

	simplyConnectedPolygonCoordinates { :self |
		self.simplyConnectedPolygons.collect { :each |
			let [c] = each.coordinates;
			c
		}
	}

	simplyConnectedPolygonCoordinates { :self :projectionFunction:/1 |
		self.simplyConnectedPolygons.collect { :each |
			let [c] = each.coordinates;
			c.collect { :each |
				let [phi, lambda] = each.degreesToRadians;
				projectionFunction(
					[lambda, phi]
				)
			}
		}
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	type { :self |
		self.field('type')
	}

}

+Record {

	GeoJson { :self |
		newGeoJson().initializeSlots(self)
	}

}

+List {

	gallPetersProjection { :self |
		let [lambda, phi] = self;
		[phi, 2 * lambda.sin]
 	}

	gallStereographicProjection { :self |
		let [lambda, phi] = self;
		[
			phi / 2.sqrt,
			(1 + (2.sqrt / 2)) * (lambda / 2).tan
		]
	}

}

+String {

	naturalEarthUrl { :self |
		[
			'https://raw.githubusercontent.com/'
			'nvkelso/natural-earth-vector/'
			'refs/heads/master/geojson/'
			self
			'.geojson'
		].stringCatenate.asUrl
	}

}

+System {

	continentOutlines { :self :dataSet |
		(dataSet = 'LowResolution').if {
			self.requireLibraryItem('ContinentOutlines/LowResolution')
		} {
			self.error('System>>continentOutlines: unknown data set')
		}
	}

}

LibraryItem(
	name: 'ContinentOutlines/LowResolution',
	category: 'Protocol/GeoJson',
	url: 'https://rohandrape.net/sw/hsc3-data/data/cartography/ContinentOutlines-LowResolution.json',
	mimeType: 'application/json',
	parser: GeoJson:/1
)
