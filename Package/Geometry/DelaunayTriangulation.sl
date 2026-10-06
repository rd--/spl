DelaunayTriangulation : [Object] {

	| vertexCoordinates triangulation |

	convexHull { :self |
		self.vertexCoordinates.atAll(self.convexHullIndices)
	}

	convexHullIndices { :self |
		self.uncheckedConvexHullIndices + 1
	}

	edgeCount { :self |
		let halfEdges = self.uncheckedHalfEdges;
		let boundaryEdgeCount = halfEdges.occurrencesOf(-1);
		let interiorEdgeCount = (halfEdges.size - boundaryEdgeCount) / 2;
		boundaryEdgeCount + interiorEdgeCount
	}

	edgeList { :self |
		self.uncheckedEdgeList + 1
	}

	faceCount { :self |
		<primitive: return (_self.triangulation.triangles.length / 3);>
	}

	faceIndices { :self |
		let indicesVector = self.uncheckedFaceIndices;
		let answer = [];
		let index = 0;
		(indicesVector.size / 3).timesRepeat {
			answer.add!(indicesVector.atAll(index + [1 2 3]) + 1);
			index := index + 3
		};
		answer
	}

	graph { :self |
		let answer = Graph(self.vertexList, self.edgeList);
		answer.vertexCoordinates!(self.vertexCoordinates);
		answer
	}

	LineDrawing { :self |
		let v = self.vertexCoordinates;
		[
			v.PointCloud,
			self.edgeList.collect { :each |
				v.atAll(each).Line
			}
		].LineDrawing
	}

	polygonMesh { :self |
		PolygonMesh(
			self.vertexCoordinates,
			self.faceIndices
		)
	}


	uncheckedCoordinates { :self |
		<primitive: return _self.triangulation.coords;>
	}

	uncheckedConvexHullIndices { :self |
		<primitive: return Array.from(_self.triangulation.hull);>
	}

	uncheckedEdgeList { :self |
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

	uncheckedHalfEdges { :self |
		<primitive: return Array.from(_self.triangulation.halfedges);>
	}

	uncheckedFaceIndices { :self |
		<primitive: return Array.from(_self.triangulation.triangles);>
	}

	uncheckedVoronoiEdgeList { :self |
		<primitive:
		const delaunay = _self.triangulation;
		const answer = [];
		for (let e = 0; e < delaunay.triangles.length; e++) {
			if (e < delaunay.halfedges[e]) {
				const p = Math.floor(e / 3);;
				const q = Math.floor(delaunay.halfedges[e] / 3);
				answer.push([p, q]);
			}
		};
		return answer;
		>
	}

	vertexCount { :self |
		self.vertexCoordinates.size
	}

	vertexList { :self |
		[1 .. self.vertexCount]
	}

	voronoiEdgeList { :self |
		self.uncheckedVoronoiEdgeList + 1
	}


	voronoiVertexCoordinates { :self |
		let vertices = self.vertexCoordinates;
		self.faceIndices.collect { :each |
			vertices.atAll(each).Triangle.circumcenter
		}
	}

	voronoiExteriorCellRays { :self |
		let answer = [self.vertexCount, 2].zeroes;
		let hull = self.convexHullIndices;
		let coord = self.uncheckedCoordinates;
		let h = hull.last;
		let p1 = h;
		let x1 = coord[2 * h + 1];
		let y1 = coord[2 * h + 2];
		1.toDo(hull.size) { :i |
			h := hull[i];
			let p0 = p1;
			let x0 = x1;
			let y0 = y1;
			p1 := h;
			x1 := coord[2 * h + 1];
			y1 := coord[2 * h + 2];
			let x = x1 - x0;
			let y = y0 - y1;
			answer[p0 + 1] := answer[p1] := [y, x]
		};
		answer
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
				coordinateVector.uncheckedDelaunayTriangulation
			)
		} {
			self.error('DelaunayTriangulation: not two column matrix')
		}
	}

}

+Float64Array {

	uncheckedDelaunayTriangulation { :self |
		<primitive: return new sl.Delaunator(_self);>
	}

}
