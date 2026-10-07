GeometryCollection : [Object, Equal, Geometry] {

	| geometryList |

	arcLength { :self |
		self.geometryList.collect(arcLength/1).sum
	}

	area { :self |
		self.geometryList.collect(area/1).sum
	}

	boundingBox { :self |
		self.geometryList.collect(boundingBox/1).boundingBoxMerging
	}

	circleInversion { :self :circle |
		self.geometryList.collect { :each |
			each.circleInversion(circle)
		}.GeometryCollection
	}

	collect { :self :aBlock/1 |
		GeometryCollection(
			self.geometryList.collect(aBlock/1)
		)
	}

	downsample { :self :anInteger |
		self.collect { :each |
			each.downsample(anInteger)
		}
	}

	embeddingDimension { :self |
		let [n] = self.geometryList.collect(embeddingDimension/1).nub;
		n
	}

	svgFragment { :self :options |
		self.geometryList.collect { :each |
			each.svgFragment(options)
		}
	}

	project { :self :projection |
		let projectionBlock = projection.unaryBlock;
		GeometryCollection(
			self.geometryList.collect { :each |
				each.project(projectionBlock)
			}
		)
	}

}

+List {

	GeometryCollection { :self |
		newGeometryCollection().initializeSlots(
			self.flatten
		)
	}

	lineCollection { :self |
		self.collect(Line/1).GeometryCollection
	}

	polygonCollection { :self |
		self.collect(Polygon/1).GeometryCollection
	}

}
