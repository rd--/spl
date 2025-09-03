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

	asDot { :self :options |
		let isMixed = self.isMixed;
		let graphType = self.isUndirected.if { 'graph' } { 'digraph' };
		let begin = '% {\ngraph [layout="%"];'.format(
			[
				graphType,
				options['method']
			]
		);
		let vertexLabels = self.hasVertexLabels.if {
			self.vertexLabels
		} {
			nil
		};
		let attributeText = [
			'graph [size="1.214,0.75",bgcolor="transparent"];',
			'node [shape="%"];'.format(
				[self.hasVertexLabels.if { 'box' } { 'point' }]
			),
			'edge [penwidth="0.75",arrowsize="0.5"];'
		].unlines;
		let nodeText = self.hasVertexLabels.if {
			self.vertexList.collect { :each |
				let label = vertexLabels[each];
				label.ifNil {
					'% [shape="point"];'.format([each])
				} {
					'% [label="%",shape="box",width="0",height="0"];'.format(
						[each, label.ifNil { '' } { label }]
					)
				}
			}.unlines
		} {
			'/* implicit nodes */'
		};
		let edgeText = self.edgeList.collect { :each |
			each.forDot(isMixed)
		}.unlines;
		let end = '}';
		[
			begin,
			attributeText,
			nodeText,
			edgeText,
			end
		].unlines
	}

	asDot { :self |
		self.asDot(
			method: self.isUndirected.if { 'neato' } { 'dot' }
		)
	}

	asGeometryCollection { :self |
		let vertexCoordinates = self.vertexCoordinates;
		let contents = [PointCloud(vertexCoordinates)];
		self.edgeList.do { :each |
			let [i, j] = each;
			contents.add(
				LineSegment(
					vertexCoordinates[i],
					vertexCoordinates[j]
				)
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

	dijkstrasAlgorithm { :g :s :t |
		let k = g.vertexCount;
		let w = g.edgeWeights;
		let e = g.edgeList;
		let q = PriorityQueue();
		let d = List(k, Infinity);
		let p = List(k);
		d[s] := 0;
		p[s] := nil;
		q.pushWithPriority(s, 0);
		{ q.isEmpty }.whileFalse {
			let u = q.pop;
			(u = t).if {
				q.removeAll
			} {
				g.vertexOutNeighbours(u).do { :v |
					let uv = u --> v;
					let i = e.detectIndex { :each |
						each.matchesEdge(uv)
					};
					let a = d[u] + w[i];
					(a < d[v]).ifTrue {
						p[v] := u;
						d[v] := a;
						q.pushWithPriority(v, a)
					}
				}
			}
		};
		[d, p]
	}

	dijkstrasAlgorithm { :g :s |
		g.dijkstrasAlgorithm(s, nil)
	}

	drawing { :self |
		self.asLineDrawing.drawing
	}

	edgeCount { :self |
		self.edgeList.size
	}

	edgeIndex { :self :edge |
		self.edgeList.detectIndex { :each |
			each.matchesEdge(edge)
		}
	}

	findShortestPath { :g :s :t |
		let answer = [];
		let [d, p] = g.dijkstrasAlgorithm(s, t);
		let u = t;
		( p[u] != nil | { u = s } ).ifTrue {
			{ u != nil }.whileTrue {
				answer.addFirst(u);
				u := p[u]
			}
		};
		answer
	}

	graphDistance { :g :s :t |
		let [d, p] = g.dijkstrasAlgorithm(s, t);
		d[t]
	}

	graphDistanceMatrix { :g |
		let n = g.vertexCount;
		let m = [];
		1.toDo(n) { :i |
			let [d, p] = g.dijkstrasAlgorithm(i);
			m.add(d)
		};
		m
	}

	graphPlot { :self |
		[self].Plot('graph', (method: 'neato'))
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
			each[1] != each[2]
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

	kirchhoffMatrix { :self |
		let v = self.vertexList;
		{ :i :j |
			(i = j).if {
				self.vertexDegree(i)
			} {
				self.includesEdge(i --> j).if {
					-1
				} {
					0
				}
			}
		}.table(v, v)
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
						i != j & {
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

	simpleGraph { :self |
		let v = self.vertexList;
		let e = Set(matchesEdge:/2);
		self.edgeList.do { :each |
			(each[1] != each[2]).ifTrue {
				e.include(each)
			}
		};
		Graph(v, e.contents)
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

	treePlot { :self |
		Plot([self], 'graph', (method: 'dot'))
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

	dotDrawing { :self :options |
		let layoutEngine = options['method'];
		self.asDot(options).dotLayout('svg', layoutEngine).then { :answer |
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

	edgeWeights { :self |
		self.properties.atIfAbsent('edgeWeights') {
			1 # self.edgeCount
		}
	}

	edgeWeights { :self :aList |
		self.properties['edgeWeights'] := aList;
		self
	}

	hasEdgeLabels { :self |
		self.properties.includesKey('edgeLabels')
	}

	hasVertexLabels { :self |
		self.properties.includesKey('vertexLabels')
	}

	includeEdge { :self :edge |
		self.includesEdge(edge).ifFalse {
			self.addEdge(edge)
		}
	}

	isEdgeWeightedGraph { :self |
		self.properties.includesKey('edgeWeights')
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

	circulantGraph { :self :aList |
		let e = [];
		1.toDo(self) { :i |
			aList.do { :j |
				e.add([i, (i - j).mod(self, 1)]);
				e.add([i, (i + j).mod(self, 1)])
			}
		};
		e.asGraph.simpleGraph
	}

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
			each.integerDigits(2).padLeft([m], 0)
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

	deBruijnGraph { :m :n |
		let o = n - 1;
		let k = m ^ n;
		let s = (0 .. k - 1).collect { :i |
			i.integerDigits(m, n)
		};
		let v = [1 .. k];
		let e = [];
		let g = nil;
		let withLabels = false;
		[v, v].tuplesDo { :each |
			let [i, j] = each;
			let [p, q] = s.atAll([i, j]);
			(p.last(o) = q.first(o)).ifTrue {
				e.add([i, j])
			}
		};
		g := Graph(v, e);
		withLabels.ifTrue {
			g.vertexLabels(
				s.collect { :each |
					each.collect(asString:/1).stringCatenate
				}
			)
		};
		g
	}

	hammingGraph { :d :q |
		let k = q ^ d;
		let s = [1 .. q].tuples(d);
		let v = [1 .. k];
		let e = [];
		1.toDo(k) { :i |
			(i + 1).toDo(k) { :j |
				let p = s[i];
				let q = s[j];
				(p.hammingDistance(q) = 1).ifTrue {
					e.add([i, j])
				}
			}
		};
		Graph(v, e)
	}

	hararyGraphEdgeList { :k :n |
		k.isEven.if {
			let m = k / 2;
			let e = [];
			1.toDo(n) { :i |
				1.to(m).do { :j |
					let z = (i + j).mod(n, 1);
					e.add([i, z])
				}
			};
			e
		} {
			(k.isOdd & { n.isEven }).if {
				let e = hararyGraphEdgeList(k - 1, n);
				let m = n / 2;
				1.toDo(m) { :i |
					e.add([i, i + m])
				};
				e
			} {
				let e = hararyGraphEdgeList(k - 1, n);
				let m = k // 2;
				1.toDo((n - 1) / 2 + 1) { :i |
					let z = (i + (n + 1 / 2)).mod(n, 1);
					e.add([i, z])
				};
				e
			}
		}
	}

	hararyGraph { :k :n |
		hararyGraphEdgeList(k, n).asGraph
	}

	pathGraph { :self |
		(1 .. (self - 1)).collect { :each |
			[each, each + 1]
		}.asGraph
	}

	petersenGraph { :n :k |
		(k < (n / 2)).if {
			let u = [1 .. n];
			let v = [n + 1 .. n + n];
			let e = (1 .. n).collect { :i |
				let a = (i + 1).mod(n, 1);
				let b = (i + k).mod(n, 1);
				[
					[u[i], u[a]],
					[u[i], v[i]],
					[v[i], v[b]]
				]
			};
			Graph(u ++ v, e.catenate)
		} {
			[n, k].error('petersenGraph: k > n/2')
		}
	}

	prismGraph { :n |
		petersenGraph(n, 1)
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
		let vertexList = self.collectCatenate(vertexList:/1).nub.sort;
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
			(:)
		)
	}

	weightedAdjacencyGraph { :self |
		let m = self.deepCollect { :each |
			(each = Infinity).if { 0 } { 1 }
		};
		let g = m.adjacencyGraph;
		let w = g.edgeList.collect { :each |
			let [i, j] = each;
			self[i, j]
		};
		g.edgeWeights := w;
		g
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
