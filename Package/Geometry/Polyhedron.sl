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

}

+List {

	Polyhedron { :vertices :faces |
		newPolyhedron().initializeSlots(vertices, faces)
	}

}
