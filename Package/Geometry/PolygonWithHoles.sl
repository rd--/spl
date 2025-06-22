PolygonWithHoles : [Object, Geometry] { | outerVertexCoordinates innerVertexCoordinatesList |

	area { :self |
		let o = self.outerVertexCoordinates.shoelaceFormula;
		let i = self.innerVertexCoordinatesList.collect(shoelaceFormula:/1);
		o + i.sum
	}

	boundingBox { :self |
		self.outerVertexCoordinates.coordinateBoundingBox
	}

	embeddingDimension { :self |
		self.outerVertexCoordinates.anyOne.size
	}

	forSvg { :self :options |
		GeometryCollection(
			self.vertexCoordinatesList.collect(Polygon:/1)
		).forSvg(options)
	}

	innerPolygons { :self |
		self.innerVertexCoordinatesList.collect(Polygon:/1)
	}

	outerPolygon { :self |
		Polygon(self.outerVertexCoordinates)
	}

	project { :self :projection |
		let f:/1 = projection.asUnaryBlock;
		PolygonWithHoles(
			self.outerVertexCoordinates.collect(f:/1),
			self.innerVertexCoordinatesList.collect { :each |
				each.collect(f:/1)
			}
		)
	}

	vertexCoordinatesList { :self |
		[self.outerVertexCoordinates] ++ self.innerVertexCoordinatesList
	}

}

+List {

	PolygonWithHoles { :o :i |
		newPolygonWithHoles().initializeSlots(o, i)
	}

}
