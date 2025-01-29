DelaunayTriangulation : [Object] { | vertexCoordinates triangulation |

	asLineDrawing { :self |
		let v = self.vertexCoordinates;
		[
			v.PointCloud,
			self.edgeList.collect { :each |
				v.atAll(each).Line
			}
		].LineDrawing
	}

	basicConvexHullIndices { :self |
		<primitive: return Array.from(_self.triangulation.hull);>
	}

	basicEdgeList { :self |
		<primitive:
		const delauny = _self.triangulation;
		const answer = [];
		for (let e = 0; e < delauny.triangles.length; e++) {
			if (e > delauny.halfedges[e]) {
				const p = delauny.triangles[e];
				const q = delauny.triangles[(e % 3 === 2) ? e - 2 : e + 1];
				answer.push([p, q]);
			};
		};
		return answer;
		>
        }

	basicHalfEdges { :self |
		<primitive: return Array.from(_self.triangulation.halfedges);>
	}

	basicFaceIndices { :self |
		<primitive: return Array.from(_self.triangulation.triangles);>
	}

	convexHullIndices { :self |
		self.basicConvexHullIndices + 1
	}

	edgeCount { :self |
		let halfEdges = self.basicHalfEdges;
		let boundaryEdgeCount = halfEdges.occurrencesOf(-1);
		let interiorEdgeCount = (halfEdges.size - boundaryEdgeCount) / 2;
		boundaryEdgeCount + interiorEdgeCount
	}

	edgeList { :self |
		self.basicEdgeList + 1
        }

	faceCount { :self |
		<primitive: return (_self.triangulation.triangles.length / 3);>
	}

	faceIndices { :self |
		let indicesVector = self.basicFaceIndices;
		let answer = [];
		let index = 0;
		(indicesVector.size / 3).timesRepeat {
			answer.add(indicesVector.atAll(index + [1 2 3]) + 1);
			index := index + 3
		};
		answer
	}

	graph { :self |
		let answer = Graph(self.vertexList, self.edgeList);
		answer.vertexCoordinates := self.vertexCoordinates;
		answer
	}

	polygonMesh { :self |
		PolygonMesh(
			self.vertexCoordinates,
			self.faceIndices
		)
	}

	vertexCount { :self |
		self.vertexCoordinates.size
	}

	vertexList { :self |
		[1 .. self.vertexCount]
	}

	voronoiVertexCoordinates { :self |
		let v = self.vertexCoordinates;
		self.faceIndices.collect { :each |
			v.atAll(each).circumcenter
		}
	}

}

+List {

	convexHull { :self |
		self.atAll(
			self.convexHullIndices
		)
	}

	convexHullIndices { :self |
		self.DelaunayTriangulation.convexHullIndices
	}

	delaunayMesh { :self |
		self
		.DelaunayTriangulation
		.polygonMesh
	}

	DelaunayTriangulation { :self |
		let [m, n] = self.shape;
		(n = 2).if {
			let coordinateVector = Float64Array(self.size * 2);
			let index = 1;
			self.do { :each |
				let [x, y] = each;
				coordinateVector[index] := x;
				coordinateVector[index + 1] := y;
				index := index + 2
			};
			newDelaunayTriangulation()
			.initializeSlots(
				self,
				coordinateVector.basicDelaunayTriangulation
			)
		} {
			self.error('DelaunayTriangulation: not two column matrix')
		}
	}

}

+Float64Array {

	basicDelaunayTriangulation { :self |
		<primitive: return new sl.Delaunator(_self);>
	}

}
