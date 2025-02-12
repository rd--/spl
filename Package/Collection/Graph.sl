@Graph {

	~ { :self :aGraph |
		self.vertexList.sorted = aGraph.vertexList.sorted & {
			self.edgeList.sorted = aGraph.edgeList.sorted
		}
	}

	+ { :self :aGraph |
		self.sumGraph(aGraph)
	}

	adjacencyList { :self |
		self.vertexList.collect { :each |
			self.adjacencyList(each)
		}
	}

	adjacencyList { :self :vertex |
		let answer = [];
		self.edgeList.do { :each |
			(each[1] = vertex).ifTrue {
				answer.add(each[2])
			};
			(each[2] = vertex).ifTrue {
				answer.add(each[1])
			}
		};
		answer
	}

	adjacencyMatrix { :self |
		let v = self.vertexList;
		{ :i :j |
			self.edgeList.count { :each |
				each.matchesEdge(i --> j)
			}
		}.table(v, v)
	}

	asDot { :self |
		let isMixed = self.isMixed;
		let graphType = self.isUndirected.if { 'graph' } { 'digraph' };
		let layoutRule = self.isUndirected.if { 'neato' } { 'dot' };
		let begin = '% {\ngraph [layout="%"];'.format([graphType, layoutRule]);
		let attributeText = [
			'graph [size="1.214,0.75",bgcolor="transparent"];',
			'node [shape="point"];',
			'edge [penwidth="0.75",arrowsize="0.5"];'
		].unlines;
		let edgeText = self.edgeList.collect { :each |
			each.forDot(isMixed)
		}.unlines;
		let end = '}';
		[
			begin,
			attributeText,
			edgeText,
			end
		].unlines
	}

	asGeometryCollection { :self |
		let vertexCoordinates = self.vertexCoordinates;
		let contents = [PointCloud(vertexCoordinates)];
		self.edgeList.do { :each |
			contents.add(
				Line(vertexCoordinates @* each)
			)
		};
		GeometryCollection(contents)
	}

	asLineDrawing { :self |
		self.asGeometryCollection.asLineDrawing
	}

	asPerspectiveDrawing { :self :projection |
		self.asGeometryCollection.project(projection).asLineDrawing
	}

	complement { :self |
		self.complementGraph
	}

	complementGraph { :self |
		let m = self.adjacencyMatrix;
		(1 - m.size.identityMatrix - m).adjacencyGraph
	}

	connectionMatrix { :self |
		let v = self.vertexList;
		{ :i :j |
			self.includesEdge(i --> j).boole
		}.table(v, v)
	}

	degreeSequence { :self |
		self.vertexDegree.sortBy(>)
	}

	edgeCount { :self |
		self.edgeList.size
	}

	graphPlot { :self |
		Plot([self], 'graph')
	}

	hasValidEdgeList { :self |
		let v = self.vertexList;
		self.edgeList.allSatisfy { :edge |
			v.includes(edge[1]) & {
				v.includes(edge[2])
			}
		}
	}

	incidenceGraph { :self :vertex |
		self.incidenceList(vertex).asGraph
	}

	incidenceList { :self :vertex |
		self.edgeList.select { :each |
			each[1] = vertex | {
				each[2] = vertex
			}
		}
	}

	incidenceMatrix { :self |
		self.vertexList.collect { :v |
			self.edgeList.collect { :e |
				e.isUndirectedEdge.if {
					(e[1] = v).if {
						(e[2] = v).if {
							2
						} {
							1
						}
					} {
						(e[2] = v).if {
							1
						} {
							0
						}
					}
				} {
					e.isDirectedEdge.if {
						(e[1] = v).if {
							(e[2] = v).if {
								-2
							} {
								-1
							}
						} {
							(e[2] = v).if {
								1
							} {
								0
							}
						}
					} {
						self.error('@Graph>>incidenceMatrix: invalid edge')
					}
				}
			}
		}
	}

	includesEdge { :self :edge |
		self.edgeList.anySatisfy { :each |
			each.matchesEdge(edge)
		}
	}

	includesVertex { :self :vertex |
		self.vertexList.includes(vertex)
	}

	inEdgeListOf { :self :vertex |
		self.edgeList.select { :edge |
			(edge[2] = vertex) | {
				edge.isUndirected & {
					edge[1] = vertex
				}
			}
		}
	}

	isDirected { :self |
		self.edgeList.allSatisfy(isDirectedEdge:/1)
	}

	isEmpty { :self |
		self.edgeCount = 0
	}

	isLoopFree { :self |
		self.edgeList.allSatisfy { :each |
			each[1] ~= each[2]
		}
	}

	isMixed { :self |
		self.edgeList.anySatisfy(isDirectedEdge:/1) & {
			self.edgeList.anySatisfy(isUndirectedEdge:/1)
		}
	}

	isRegular { :self |
		self.vertexDegree.nub.size = 1
	}

	isSingleton { :self |
		self.isEmpty & {
			self.vertexCount = 1
		}
	}

	isUndirected { :self |
		self.edgeList.allSatisfy(isUndirectedEdge:/1)
	}

	isValid { :self |
		self.hasValidEdgeList
	}

	labeledVertexList { :self |
		self.vertexList.collect { :each |
			each -> self.vertexLabel(each)
		}
	}

	lineGraph { :self |
		let k = self.edgeCount;
		let v = [1 .. k];
		let e = [];
		self.isUndirected.ifTrue {
			1.toDo(k) { :i |
				(i + 1).toDo(k) { :j |
					self.edgeList[i].hasCommonVertex(
						self.edgeList[j]
					).ifTrue {
						e.add([i, j])
					}
				}
			}
		};
		self.isDirected.ifTrue {
			1.toDo(k) { :i |
				(i + 1).toDo(k) { :j |
					(
						i ~= j & {
							self.edgeList[i][2] = self.edgeList[j][1]
						}
					).ifTrue {
						e.add(i --> j)
					}
				}
			}
		};
		self.isMixed.ifTrue {
			self.error('@Graph>>lineGraph: mixed graph')
		};
		Graph(v, e)
	}

	neighbourhoodGraph { :self :vertex |
		let vertexList = [];
		self.incidenceList(vertex).do { :each |
			vertexList.addAll(each.vertexList)
		};
		self.subgraph(vertexList)
	}

	neighbours { :self :vertex |
		let vertexList = [];
		self.incidenceList(vertex).do { :each |
			vertexList.addAll(each.vertexList)
		};
		vertexList.nub.sort.without(vertex)
	}

	outEdgeListOf { :self :vertex |
		self.edgeList.select { :edge |
			(edge[1] = vertex) | {
				edge.isUndirected & {
					edge[2] = vertex
				}
			}
		}
	}

	subgraph { :self :vertexList |
		self.edgeList.select { :each |
			vertexList.includesAllOf(each.vertexList)
		}.asGraph
	}

	sumGraph { :self :aGraph |
		(self.vertexCount = aGraph.vertexCount).if {
			let m = self.adjacencyMatrix;
			let n = aGraph.adjacencyMatrix;
			(m + n).adjacencyGraph
		} {
			self.error('@Graph>>sumGraph: non-equal vertex counts')
		}
	}

	undirectedGraph { :self |
		Graph(
			self.vertexList,
			self.edgeList.collect(asUndirectedEdge:/1).nubBy(matchesEdge:/2)
		)
	}

	vertexCount { :self |
		self.vertexList.size
	}

	vertexDegree { :self |
		self.vertexList.collect { :vertex |
			self.vertexDegree(vertex)
		}
	}

	vertexDegree { :self :vertex |
		let answer = 0;
		self.edgeList.do { :each |
			(vertex = each[1]).ifTrue {
				answer := answer + 1
			};
			(vertex = each[2]).ifTrue {
				answer := answer + 1
			}
		};
		answer
	}

	vertexInDegree { :self |
		self.vertexList.collect { :vertex |
			self.vertexInDegree(vertex)
		}
	}

	vertexInDegree { :self :vertex |
		let answer = 0;
		self.vertexInNeighboursDo(vertex) { :unused |
			answer := answer + 1
		};
		answer
	}

	vertexInNeighbours { :self :vertex |
		let answer = [];
		self.vertexInNeighboursDo(vertex) { :each |
			answer.add(each)
		};
		answer
	}

	vertexInNeighboursDo { :self :vertex :aBlock:/1 |
		self.edgeList.do { :each |
			(vertex = each[2]).ifTrue {
				aBlock(each[1])
			};
			each.isUndirectedEdge.ifTrue {
				(vertex = each[1]).ifTrue {
					aBlock(each[2])
				}
			}
		}
	}

	vertexOutDegree { :self |
		self.vertexList.collect { :vertex |
			self.vertexOutDegree(vertex)
		}
	}

	vertexOutDegree { :self :vertex |
		let answer = 0;
		self.vertexOutDo(vertex) { :unused |
			answer := answer + 1
		};
		answer
	}

	vertexOutDo { :self :vertex :aBlock:/1 |
		self.edgeList.do { :each |
			(vertex = each[1]).ifTrue {
				aBlock(each[2])
			};
			each.isUndirectedEdge.ifTrue {
				(vertex = each[2]).ifTrue {
					aBlock(each[1])
				}
			}
		}
	}

	vertexOutNeighbours { :self :vertex |
		let answer = [];
		self.vertexOutDo(vertex) { :each |
			answer.add(each)
		};
		answer
	}

}

Graph : [Object, Graph] { | vertexList edgeList properties |

	addEdge { :self :edge |
		self.edgeList.add(edge)
	}

	dotDrawing { :self |
		let layoutEngine = self.isDirected.if { 'dot' } { 'neato' };
		self.asDot.dotLayout('svg', layoutEngine).then { :answer |
			answer.Svg
		}
	}

	edgeLabels { :self |
		self.properties['edgeLabels']
	}

	edgeLabels { :self :aList |
		self.properties['edgeLabels'] := aList;
		self
	}

	includeEdge { :self :edge |
		self.includesEdge(edge).ifFalse {
			self.addEdge(edge)
		}
	}

	printString { :self |
		'%.asGraph'.format([self.edgeList])
	}

	vertexCoordinates { :self |
		self.properties['vertexCoordinates']
	}

	vertexCoordinates { :self :aList |
		self.properties['vertexCoordinates'] := aList;
		self
	}

	vertexLabels { :self |
		self.properties['vertexLabels']
	}

	vertexLabels { :self :aList |
		self.properties['vertexLabels'] := aList;
		self
	}

}

+@Integer {

	completeBipartiteGraph { :self :anInteger |
		let u = 1:self;
		let v = ((self + 1) .. (self + anInteger));
		let e = [];
		u.do { :i |
			e.addAll(
				v.collect { :j |
					[i, j]
				}
			)
		};
		Graph(u ++ v, e)
	}

	completeGraph { :self |
		let edgeList = [];
		1.toDo(self) { :i |
			edgeList.addAll(
				(i + 1).to(self).collect { :j |
					[i, j]
				}
			)
		};
		Graph([1 .. self], edgeList)
	}

	completeGraphDrawing { :self :radius |
		let p = self.circlePoints([0 0], radius, 0);
		[
			p.PointCloud,
			p.tuples(2).Line
		].LineDrawing
	}

	cubeGraph { :self |
		let k = 2 ^ self;
		let m = (k - 1).integerLength(2);
		let n = (0 .. (k - 1)).collect { :each |
			each.integerDigits(2).padLeft(m, 0)
		};
		let e = [];
		1.toDo(k) { :i |
			i.toDo(k) { :j |
				let d = n[i].hammingDistance(n[j]);
				(d = 1).ifTrue {
					e.add([i, j])
				}
			}
		};
		e.asGraph
	}

	cycleGraph { :self |
		1:self.collect { :each |
			[each, each % self + 1]
		}.asGraph
	}

	pathGraph { :self |
		(1 .. (self - 1)).collect { :each |
			[each, each + 1]
		}.asGraph
	}

	starGraph { :self |
		2:self.collect { :each |
			[1, each]
		}.asGraph
	}

	wheelGraph { :self |
		(self < 4).if {
			self.error('Integer>>wheelGraph: n < 4')
		} {
			let cycle = 2.to(self).collect { :each |
				[each, (each = self).if { 2 } { each + 1 }]
			};
			let star = 2.to(self).collect { :each |
				[1, each]
			};
			(cycle ++ star).asGraph
		}
	}

}

+List {

	asEdgeList { :self |
		self.collect(asEdge:/1)
	}

	canonicalEdgeList { :self |
		let vertexList = self.collect(vertexList:/1).concatenation.nub.sort;
		let renameTable = vertexList.collect { :vertex |
			vertex -> vertexList.indexOf(vertex)
		}.asMap;
		self.collect { :each |
			each.rename(renameTable)
		}
	}

	gridGraph { :shape |
		let k = shape.product;
		let v = k.iota;
		let c = 1:k.collect { :i | shape.cartesianIndex(i) };
		let e = [];
		1.toDo(k) { :i |
			(i + 1).toDo(k) { :j |
				((c[j] - c[i]).abs.sum = 1).ifTrue {
					e.add([i, j])
				}
			}
		};
		Graph(v, e)
	}

}

+Block {

	edgeCountGraph { :self:/2 :isDirected :vertexList |
		let edgeList = [];
		let v = vertexList;
		let k = vertexList.size;
		let addEdge = { :i :j |
			isDirected.if {
				edgeList.add(v[i] --> v[j])
			} {
				(i <= j).ifTrue {
					edgeList.add([v[i], v[j]])
				}
			}
		};
		1:k.do { :i |
			1:k.do { :j |
				let n = self(v[i], v[j]);
				n.timesRepeat {
					addEdge(i, j)
				}
			}
		};
		Graph(vertexList, edgeList)
	}

	relationGraph { :self:/2 :isDirected :vertexList |
		let edgeList = [];
		let v = vertexList;
		let k = vertexList.size;
		let addEdge = { :i :j |
			isDirected.if {
				edgeList.add(v[i] --> v[j])
			} {
				(i <= j).ifTrue {
					edgeList.add([v[i], v[j]])
				}
			}
		};
		1:k.do { :i |
			1:k.do { :j |
				self(v[i], v[j]).ifTrue {
					addEdge(i, j)
				}
			}
		};
		Graph(vertexList, edgeList)
	}

}


+List {

	adjacencyGraph { :self |
		self.isSquareMatrix.if {
			let isDirected = self.isSymmetricMatrix.not;
			{ :i :j |
				self[i, j]
			}.edgeCountGraph(isDirected, self.size.iota)
		} {
			self.adjacencyGraph('List>>adjacencyGraph: not a square matrix')
		}
	}

	asGraph { :self |
		let edgeList = self.collect(asEdge:/1).asList;
		let vertexList = [];
		edgeList.do { :each |
			vertexList.add(each[1]);
			vertexList.add(each[2])
		};
		Graph(vertexList.nub.sort, edgeList)
	}

	Graph { :vertexList :edgeList |
		newGraph().initializeSlots(
			vertexList,
			edgeList.collect(asEdge:/1),
			()
		)
	}

}

+String {

	dotLayout { :dotSource :outputFormat :layoutEngine |
		<primitive:
		return import(
			'../lib/scsynth-wasm-builds/lib/ext/graphviz.js'
		).then(
			function ({ Graphviz }) {
				return Graphviz.load().then(
					function (graphviz) {
						return graphviz.layout(
							_dotSource,
							_outputFormat,
							_layoutEngine,
							{}
						);
					}
				)
			}
		);
		>
	}

}

+System {

	sageSmallGraphCatalogue { :self |
		self.requireLibraryItem(
			'SageSmallGraphCatalogue'
		)
	}

}

LibraryItem(
	name: 'SageSmallGraphCatalogue',
	category: 'Math/Graph',
	url: 'https://rohandrape.net/sw/hsc3-data/data/graph/sage/small-graphs.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			Graph(
				each['vertexList'] + 1,
				each['edgeList'] + 1
			)
		}
	}
)
