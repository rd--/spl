@PolygonMesh {

	asGraph { :self |
		let answer = Graph(self.vertexList, self.edgeList);
		answer.vertexCoordinates := self.vertexCoordinates;
		answer
	}

	boundingBox { :self |
		self.vertexCoordinates.coordinateBoundingBox
	}

	dimension { :self |
		self.embeddingDimension
	}

	edgeCount { :self |
		self.faceIndices.collect(size:/1).sum / 2
	}

	edgeLengths { :self |
		self.edgeCoordinates.collect { :each |
			each.Line.arcLength
		}
	}

	edgeList { :self |
		let answer = [];
		self.faceIndices.do { :each |
			1.toDo(each.size) { :i |
				answer.add(
					[
						each.at(i),
						each.atWrap(i + 1)
					].sort
				)
			}
		};
		answer.nub
	}

	edgeCoordinates { :self |
		let vertexCoordinates = self.vertexCoordinates;
		self.edgeList.collect { :each |
			vertexCoordinates.atAll(each)
		}
	}

	embeddingDimension { :self |
		self.vertexCoordinates.anyOne.size
	}

	faceCount { :self |
		self.faceIndices.size
	}

	faceDegreeCounts { :self |
		self.faceIndices.collect(size:/1).asBag.sortedElements
	}

	vertexCount { :self |
		self.vertexCoordinates.size
	}

	vertexList { :self |
		[1 .. self.vertexCount]
	}

}

PolygonMesh : [Object, PolygonMesh] { | vertexCoordinates faceIndices |

	canonicalForm { :self |
		let v = self.vertexCoordinates;
		let w = v.nub.sort;
		PolygonMesh(
			w,
			self.faceIndices.collect { :each |
				each.collect { :i |
					w.indexOf(v[i])
				}.lexicographicallyLeastRotation.deleteAdjacentDuplicates
			}.reject { :each |
				each.size <= 2
			}.nub.sort
		)
	}

	forSvg { :self :options |
		let vertexCoordinates = self.vertexCoordinates;
		self.faceIndices.collect { :each |
			'<polygon points="%" />'.format([
				self.vertexCoordinates.atAll(each).asSvgPointList(options)
			])
		}.unlines
	}

}

+List {

	PolygonMesh { :vertexCoordinates :faceIndices |
		newPolygonMesh().initializeSlots(vertexCoordinates, faceIndices)
	}

}
