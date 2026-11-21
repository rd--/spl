GeometryCollection : [Object, Equal, Geometry] {

	| geometryList | <List>

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

	collect { :self :aFunction/1 |
		GeometryCollection(
			self.geometryList.collect(aFunction/1)
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

	project { :self :projection |
		let projectionFunction = projection.unaryFunction;
		GeometryCollection(
			self.geometryList.collect { :each |
				each.project(projectionFunction)
			}
		)
	}

	svgFragment { :self :options |
		self.geometryList.collect { :each |
			each.svgFragment(options)
		}
	}

}

+List {

	GeometryCollection { :self |
		uncheckedGeometryCollection(
			self.flatten
		)
	}

	drawing { :self |
		GeometryCollection(self).drawing
	}

	lineCollection { :self |
		self.collect(Line/1).GeometryCollection
	}

	polygonCollection { :self |
		self.collect(Polygon/1).GeometryCollection
	}

}
