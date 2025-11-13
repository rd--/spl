GeoJson : [Object, Storeable] { | contents |

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

	geometryValues { :self :projectionName |
		let projectionFunction:/1 = projectionName.namedCartographicProjection;
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

	polygonList { :self :projectionName |
		let answer = [];
		self.geometryValues(projectionName).collect { :each |
			each.isPolygon.ifTrue {
				answer.add(each)
			};
			each.isGeometryCollection.ifTrue {
				answer.addAll(each.contents.select(isPolygon:/1))
			}
		};
		answer
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

	type { :self |
		self.field('type')
	}

}

+Record {

	GeoJson { :self |
		newGeoJson().initializeSlots(self)
	}

}
