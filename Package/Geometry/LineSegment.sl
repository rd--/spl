LineSegment : [Object] { | u v |

	arcLength { :self |
		self.u.euclideanDistance(self.v)
	}

	at { :self :index |
		index.caseOf([
			{ 1 } -> { self.u },
			{ 2 } -> { self.v }
		])
	}

	boundingBox { :self |
		self.vertexCoordinates.minMax
	}

	centroid { :self |
		self.midpoint
	}

	dimension { :self |
		1
	}

	distance { :self :aPoint |
		[self.u, self.v].pointLineDistance(aPoint)
	}

	embeddingDimension { :self |
		self.u.size
	}

	forSvg { :self :options |
		Line([self.u, self.v]).forSvg(options)
	}

	includes { :self :aPoint |
		self.distance(aPoint).isVeryCloseTo(0)
	}

	midpoint { :self |
		self.u.midpoint(self.v)
	}

	vertexCoordinates { :self |
		[self.u, self.v]
	}

	vertexCount { :self |
		2
	}

}

+List {

	LineSegment { :u :v |
		newLineSegment().initializeSlots(u, v)
	}

}
