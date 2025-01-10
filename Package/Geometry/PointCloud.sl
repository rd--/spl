PointCloud : [Object] { | pointList |

	boundingBox { :self |
		self.pointList.coordinateBoundingBox
	}

	forSvg { :self :options |
		self.pointList.Point.collect { :each |
			each.forSvg(options)
		}.unlines
	}

	project { :self :projection |
		PointCloud(
			self.pointList.collect(projection.asUnaryBlock)
		)
	}

}
