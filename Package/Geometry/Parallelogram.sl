Parallelogram : [Object, Equal, Geometry] {

	| origin vectorList |

	area { :self |
		let o = self.origin;
		let [u, v] = self.vectorList;
		let b = u[1];
		let h = v[2] - o[2];
		b * h
	}

	boundingBox { :self |
		self.Polygon.boundingBox
	}

	dimension { :self |
		2
	}

	embeddingDimension { :self |
		self.origin.size
	}

	height { :self |
		let o = self.origin;
		let [_, v] = self.vectorList;
		v[2] - o[2]
	}

	Polygon { :self |
		Polygon(self.vertexCoordinates)
	}

	svgFragment { :self :options |
		self.Polygon.svgFragment(options)
	}

	vertexCoordinates { :self |
		let o = self.origin;
		let [u, v] = self.vectorList;
		let a = o;
		let b = a + u;
		let c = b + v;
		let d = a + v;
		[a, b, c, d]
	}

}

+List {

	Parallelogram { :self :vectorList |
		newParallelogram().initializeSlots(self, vectorList)
	}

}
