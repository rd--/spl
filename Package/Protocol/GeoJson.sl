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
		self.type.caseOfOtherwise([
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

	isFeature { :self |
		self.type = 'Feature'
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

	type { :self |
		self.field('type')
	}

}

+Record {

	GeoJson { :self |
		newGeoJson().initializeSlots(self)
	}

}


+List{

	gallPetersProjection { :self |
		(self.arrayDepth >= 2).if {
			self.collect(gallPetersProjection:/1)
		} {
			let [x, y] = self;
			[x, 2 * y.sin]
		}
	}

}

+System {

	continentOutlines { :self :dataSet |
		(dataSet = 'UniversityOfLatvia').if {
			self.requireLibraryItem('UniversityOfLatviaContinentOutlines')
		} {
			self.error('System>>continentOutlines: unknown data set')
		}
	}

}

LibraryItem(
	name: 'UniversityOfLatviaContinentOutlines',
	category: 'Protocol/GeoJson',
	url: 'https://rohandrape.net/sw/hsc3-data/data/cartography/lu-continents.json',
	mimeType: 'application/json',
	parser: identity:/1
)
