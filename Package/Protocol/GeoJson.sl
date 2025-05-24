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

	isSimplePolygon { :self |
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

	simplePolygons { :self |
		self.geometries.select(isSimplePolygon:/1)
	}

	simplePolygonCoordinates { :self |
		self.simplePolygons.collect { :each |
			let [c] = each.coordinates;
			c
		}
	}

	simplePolygonCoordinates { :self :projectionFunction:/1 |
		self.simplePolygons.collect { :each |
			let [c] = each.coordinates;
			c.collect { :each |
				let [phi, lambda] = each.degreesToRadians;
				projectionFunction(
					[lambda, phi]
				)
			}
		}
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
