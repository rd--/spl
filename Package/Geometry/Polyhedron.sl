Polyhedron : [Object] { | vertices faces |

	asGraph { :self |
		let vertexLabels = self.vertices;
		let vertexList = [1 .. vertexLabels.size];
		let faceEdgeList = { :x |
			(1 .. x.size).collect { :i |
				[
					x.atWrap(i),
					x.atWrap(i + 1)
				]
			}
		};
		let edgeList = self.faces.collect(faceEdgeList:/1).concatenation;
		let graph = Graph(vertexList, edgeList);
		graph.vertexLabels(vertexLabels);
		graph
	}

	asLineDrawing { :self :aBlock:/1 |
		self.asGraph.asLineDrawing(aBlock:/1)
	}

	asLineDrawing { :self |
		self.asLineDrawing(
			AxonometricProjection(
				pi / 6, 0,
				1, 1, 1 / 2
			).asBlock
		)
	}

}

+List {

	unitCube { :center |
		let vertices = [
			0 0 0;
			1 0 0;
			1 1 0;
			0 1 0;
			0 0 1;
			1 0 1;
			1 1 1;
			0 1 1
		] - [0.5 0.5 0.5] + center;
		let faces = [
			0 1 2 3;
			4 5 6 7;
			2 3 7 6;
			0 1 5 4;
			0 4 7 3;
			1 2 6 5
		] + 1;
		Polyhedron(vertices, faces)
	}

	Polyhedron { :vertices :faces |
		newPolyhedron().initializeSlots(vertices, faces)
	}

}
