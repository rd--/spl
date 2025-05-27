GeometryCollection : [Object] { | contents |

	arcLength { :self |
		self.contents.collect(arcLength:/1).sum
	}

	area { :self |
		self.contents.collect(area:/1).sum
	}

	boundingBox { :self |
		self.contents.collect(boundingBox:/1).boundingBoxMerging
	}

	collect { :self :aBlock:/1 |
		GeometryCollection(
			self.contents.collect(aBlock:/1)
		)
	}

	downsample { :self :anInteger |
		self.collect { :each |
			each.downsample(anInteger)
		}
	}

	forSvg { :self :options |
		self.contents.collect { :each |
			each.forSvg(options)
		}.unlines
	}

	project { :self :projection |
		let projectionBlock = projection.asUnaryBlock;
		GeometryCollection(
			self.contents.collect { :each |
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
		self.collect(Line:/1).GeometryCollection
	}

	polygonCollection { :self |
		self.collect(Polygon:/1).GeometryCollection
	}

}
