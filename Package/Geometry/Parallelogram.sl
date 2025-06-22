Parallelogram : [Object, Geometry] { | origin vectors |

	area { :self |
		let b = self.vectors[1][1];
		let h = self.vectors[2][2] - self.origin[2];
		b * h
	}

	asPolygon { :self |
		Polygon(self.vertexCoordinates)
	}

	boundingBox { :self |
		self.asPolygon.boundingBox
	}

	dimension { :self |
		2
	}

	embeddingDimension { :self |
		self.origin.size
	}

	height { :self |
		self.vectors[2][2] - self.origin[2]
	}

	svgFragment { :self :options |
		self.asPolygon.svgFragment(options)
	}

	vertexCoordinates { :self |
		let a = self.origin;
		let b = a + self.vectors[1];
		let c = b + self.vectors[2];
		let d = a + self.vectors[2];
		[a b c d]
	}

}

+List {

	Parallelogram { :self :vectors |
		newParallelogram().initializeSlots(self, vectors)
	}

}

