GeoJson : [Object] { | contents |

	features { :self |
		self.type.caseOfOtherwise([
			'Feature' -> [self],
			'FeatureCollection' -> self.contents.at('features').collect(GeoJson:/1)
		]) {
			[]
		}
	}

	geometries { :self |
		self.isGeometry.if {
			[self]
		} {
			self.features.collect { :each |
				GeoJson(each.contents.at('geometry'))
			}
		}
	}

	geometries { :self :geometryType |
		self.geometries.select { :each |
			each.type = geometryType
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
			'Point' 'MultiPoint'
			'LineString' 'MultiLineString'
			'Polygon' 'MultiPolygon'
			'GeometryCollection'
		].includes(self.type)
	}

	isPolygon { :self |
		self.type = 'Polygon'
	}

	polygons { :self |
		self.geometries.select(isPolygon:/1)
	}

	type { :self |
		self.contents.at('type')
	}
}

+Record {

	GeoJson { :self |
		newGeoJson().initializeSlots(self)
	}

}
