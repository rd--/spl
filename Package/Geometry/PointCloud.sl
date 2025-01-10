PointCloud : [Object] { | vertexCoordinates |

	boundingBox { :self |
		self.vertexCoordinates.coordinateBoundingBox
	}

	forSvg { :self :options |
		self.vertexCoordinates.Point.collect { :each |
			each.forSvg(options)
		}.unlines
	}

	project { :self :projection |
		PointCloud(
			self.vertexCoordinates.collect(projection.asUnaryBlock)
		)
	}

}

+List {

	PointCloud { :self |
		newPointCloud().initializeSlots(self)
	}

}
