@Graph {

	~ { :self :aGraph |
		self.vertexList.sorted = aGraph.vertexList.sorted & {
			self.edgeList.sorted = aGraph.edgeList.sorted
		}
	}

	+ { :self :aGraph |
		self.graphSum(aGraph)
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
		self.asGeometryCollection.asPerspectiveDrawing(projection)
	}

	asPerspectiveDrawing { :self |
		self.asGeometryCollection.asPerspectiveDrawing
	}

	circularGraphPlot { :self :options |
		let k = self.vertexCount;
		let ordering = options.atIfAbsent('ordering') { [1 .. k] };
		let radius = options.atIfAbsent('radius') { 1 };
		let drawCircle = options.atIfAbsent('drawCircle') { false };
		let p = k.circlePoints([0 0], radius, 0);
		let e = self.edgeList.collect { :each |
			Line(p.atAll(ordering.atAll(each.vertexList)))
		};
		[
			p.PointCloud,
			e,
			drawCircle.if { Circle([0 0], radius) } { [] }
		].LineDrawing
	}

	circularGraphPlot { :self |
		self.circularGraphPlot(
			(:)
		)
	}

	complement { :self |
		self.graphComplement
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

	findShortestTour { :g |
		g.graphDistanceMatrix.heldKarpAlgorithm
	}

	graphComplement { :self |
		let m = self.adjacencyMatrix;
		(1 - m.size.identityMatrix - m).adjacencyGraph
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

	graphProduct { :g1 :g2 :kind |
		let cartesianPredicate = { :u1 :u2 :v1 :v2 |
			(
				(u1 = v1) & {
					g2.includesEdge(u2 --- v2)
				}
			) | {
				(
					(u2 = v2) & {
						g1.includesEdge(u1 --- v1)
					}
				)
			}
		};
		let normalPredicate = { :u1 :u2 :v1 :v2 |
			cartesianPredicate(u1, u2, v1, v2) | {
				g2.includesEdge(u2 --- v2) & {
					g1.includesEdge(u1 --- v1)
				}
			}
		};
		let v = cartesianProduct(g1.vertexList, g2.vertexList);
		let predicate:/4 = kind.caseOf(
			[
				'Cartesian' -> { cartesianPredicate:/4 },
				'Normal' -> { normalPredicate:/4 }
			]
		) {
			kind.error('Graph>>graphProduct')
		};
		let e = [];
		let k = v.size;
		1.toDo(k - 1) { :i |
			let [u1, u2] = v[i];
			(i + 1).toDo(k) { :j |
				let [v1, v2] = v[j];
				predicate(u1, u2, v1, v2).ifTrue {
					e.add(i --- j)
				}
			}
		};
		Graph([1 .. k], e)
	}

	graphProduct { :g1 :g2 |
		graphProduct(g1, g2, 'Cartesian')
	}

	graphSum { :self :aGraph |
		(self.vertexCount = aGraph.vertexCount).if {
			let m = self.adjacencyMatrix;
			let n = aGraph.adjacencyMatrix;
			(m + n).adjacencyGraph
		} {
			self.error('@Graph>>graphSum: non-equal vertex counts')
		}
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

	linearGraphPlot { :self |
		let k = self.vertexCount;
		let p = 1.to(k).collect { :i | [i 0] };
		let e = self.edgeList.collect { :each |
			let [i, j] = each;
			let y = (j - i) / 2;
			let x = i + y;
			Line([i 0; x y; j 0])
		};
		[
			Line([1 0; k 0]),
			PointCloud(p),
			Point([1, k / 2]),
			e
		].LineDrawing
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

	seidelAdjacencyMatrix { :self |
		let a = self.graphComplement.adjacencyMatrix;
		let b = self.adjacencyMatrix;
		a - b
	}

	simpleGraph { :self |
		let v = self.vertexList;
		let e = UnsortedSet();
		e.comparator := matchesEdge:/2;
		self.edgeList.do { :each |
			(each[1] != each[2]).ifTrue {
				e.include(each)
			}
		};
		Graph(v, e.contents)
	}

	subgraph { :self :vertexList |
		self.edgeList.select { :each |
			vertexList.includesAll(each.vertexList)
		}.asGraph
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
			List(self.edgeCount, 1)
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

	balancedCayleyTree { :n :k |
		let gapList = [1] ++ 0.to(k - 1).collect { :i |
			n * ((n - 1) ^ i)
		};
		let startList = ([0] ++ gapList).prefixSum + 1;
		let v = [1 .. gapList.sum];
		let e = [];
		1.toDo(k) { :i |
			let count = (i = 1).if { n } { n - 1 };
			let start = startList[i];
			let gap = gapList[i];
			let begin = start;
			let end = start + gap;
			gap.timesRepeat {
				count.timesRepeat {
					e.add(begin --- end);
					end := end + 1
				};
				begin := begin + 1
			}
		};
		Graph(v, e)
	}

	bookGraph { :self |
		(self + 1).starGraph
		.graphProduct(
			2.pathGraph
		)
	}

	cayleyTree { :n :k |
		let v = [1 .. n + 1];
		let e = 2.to(n + 1).collect { :i |
			1 --- i
		};
		{ k > 1 }.whileTrue {
			let i = v.last;
			1.toDo(n - 1) { :j |
				v.add(i + j);
				e.add(i --- (i + j))
			};
			k := k - 1
		};
		Graph(v, e)
	}

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
		let u = 1.to(self);
		let v = (self + 1).to(self + anInteger);
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
		self.completeGraph.circularGraphPlot (
			radius: radius
		)
	}

	crownGraph { :n |
		let a = [1 .. n];
		let b = a + n;
		let v = a ++ b;
		let e = [];
		1.toDo(n) { :i |
			1.toDo(n) { :j |
				(i != j).ifTrue {
					e.add(a[i] --- b[j])
				}
			}
		};
		Graph(v, e)
	}

	cubeGraph { :self |
		let k = 2 ^ self;
		let m = (k - 1).integerLength(2);
		let n = 0.to(k - 1).collect { :each |
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
		1.to(self).collect { :each |
			[each, each % self + 1]
		}.asGraph
	}

	cyclotomicGraph { :p |
		p.isPrime.if {
			let v = [1 .. p];
			let e = [];
			1.to(p - 1).collect { :i |
				(i + 1).to(p).collect { :j |
					isCubicResidue(j - i, p).ifTrue {
						e.add(i --- j)
					}
				}
			};
			Graph(v, e)
		} {
			p.error('cyclotomicGraph')
		}
	}

	deBruijnGraph { :m :n |
		let o = n - 1;
		let k = m ^ n;
		let s = 0.to(k - 1).collect { :i |
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
				1.toDo(m) { :j |
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

	kingGraph { :m :n |
		m.pathGraph
		.graphProduct(
			n.pathGraph,
			'Normal'
		)
	}

	kingGraph { :m |
		kingGraph(m, m)
	}

	knightGraph { :m :n |
		let d = 5.sqrt;
		let c = { :i :j |
			[i, j]
		}.table(1.to(m), 1.to(n)).catenate;
		let e = [];
		1.toDo(m * n) { :i |
			(i + 1).toDo(m * n) { :j |
				euclideanDistance(c[i], c[j])
				.isVeryCloseTo(d).ifTrue {
					e.add(i --- j)
				}
			}
		};
		Graph([1 .. m * n], e).also { :g |
			g.vertexCoordinates(c)
		}
	}

	knightGraph { :m |
		knightGraph(m, m)
	}

	paleyGraph { :p |
		let v = [1 .. p];
		let e = [];
		1.to(p - 1).collect { :i |
			(i + 1).to(p).collect { :j |
				isQuadraticResidue(j - i, p).ifTrue {
					e.add(i --- j)
				}
			}
		};
		Graph(v, e)
	}

	pathGraph { :self |
		1.to(self - 1).collect { :each |
			[each, each + 1]
		}.asGraph
	}

	petersenGraph { :n :k |
		(k < (n / 2)).if {
			let u = [1 .. n];
			let v = [n + 1 .. n + n];
			let e = 1.to(n).collect { :i |
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

	rookGraph { :m :n |
		m.completeGraph
		.graphProduct(
			n.completeGraph
		)
	}

	rookGraph { :m |
		rookGraph(m, m)
	}

	stackedBookGraph { :m :n |
		(m + 1).starGraph
		.graphProduct(
			n.pathGraph
		)
	}

	starGraph { :self |
		2.to(self).collect { :each |
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
		let c = 1.to(k).collect { :i |
			shape.cartesianIndex(i)
		};
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

	torusGraph { :self |
		self.collect(cycleGraph:/1).reduce(graphProduct:/2)
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
		1.toDo(k) { :i |
			1.toDo(k) { :j |
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
		1.toDo(k) { :i |
			1.toDo(k) { :j |
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
			self.error('List>>adjacencyGraph: not a square matrix')
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

	incidenceGraph { :self |
		self.transpose.collect { :each |
			let i = each.detectIndices(isNonZero:/1);
			each.atAll(i).caseOf(
				[
					[2] -> { i[1] --- i[1] },
					[-2] -> { i[1] --> i[1] },
					[1, 1] -> { i[1] --- i[2] },
					[-1, 1] -> { i[1] --> i[2] },
					[1, -1] -> { i[2] --> i[1] }
				]
			)
		}.asGraph
	}

	Graph { :vertexList :edgeList |
		newGraph().initializeSlots(
			vertexList,
			edgeList.collect(asEdge:/1),
			(:)
		)
	}

	kirchhoffGraph { :self |
		self.isSquareMatrix.if {
			let isDirected = self.isSymmetricMatrix.not;
			{ :i :j |
				(self[i, j] = -1).boole
			}.edgeCountGraph(isDirected, self.size.iota)
		} {
			self.error('List>>kirchhoffGraph: not a square matrix')
		}
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

	namedGraph { :self |
		system.namedGraphTable.atIfAbsent(self) {
			self.error('namedGraph: unknown graph')
		}
	}

}

+System {

	namedGraphTable { :self |
		self.cached('NamedGraphTable') {
			(
				'ClebschGraph': Graph(
					[1 .. 16],
					[
						1 3; 1 5; 1 7; 1 10; 1 13; 2 5; 2 6; 2 8; 2 10; 2 14; 3 4; 3 6; 3 14; 3 15;
						4 5; 4 8; 4 9; 4 16; 5 11; 5 12; 6 7; 6 9; 6 12; 7 8; 7 11; 7 16; 8 13; 8 15;
						9 10; 9 11; 9 13; 10 15; 10 16; 11 14; 11 15; 12 13; 12 15; 12 16; 13 14; 14 16
					]
				),
				'CoxeterGraph': Graph(
					[1 .. 84],
					[
						1 2; 1 3; 1 4;
						2 3; 2 40;
						3 70;
						4 5; 4 6;
						5 6; 5 7;
						6 22;
						7 8; 7 9;
						8 9; 8 10;
						9 82;
						10 11; 10 12;
						11 12; 11 13;
						12 79;
						13 14; 13 15;
						14 15; 14 16;
						15 76;
						16 17; 16 18;
						17 18; 17 19;
						18 49;
						19 20; 19 21;
						20 21; 20 23;
						21 73;
						22 23; 22 24;
						23 24;
						24 25;
						25 26; 25 27;
						26 27; 26 28;
						27 64;
						28 29; 28 30;
						29 30; 29 31;
						30 46;
						31 32; 31 33;
						32 33; 32 34;
						33 83;
						34 35; 34 36;
						35 36; 35 37;
						36 77;
						37 38; 37 39;
						38 39; 38 41;
						39 74;
						40 41; 40 42;
						41 42;
						42 43;
						43 44; 43 45;
						44 45; 44 47;
						45 80;
						46 47; 46 48;
						47 48; 48 50;
						49 50; 49 51;
						50 51;
						51 52;
						52 53; 52 54;
						53 54; 53 55;
						54 71;
						55 56; 55 57;
						56 57; 56 58;
						57 84;
						58 59; 58 60;
						59 60; 59 61;
						60 75;
						61 62; 61 63;
						62 63; 62 65;
						63 81;
						64 65; 64 66;
						65 66;
						66 67;
						67 68; 67 69;
						68 69; 68 72;
						69 78;
						70 71; 70 72;
						71 72;
						73 74; 73 75;
						74 75;
						76 77; 76 78;
						77 78;
						79 80; 79 81;
						80 81;
						82 83; 82 84;
						83 84
					]
				),
				'GoldnerHararyGraph': Graph(
					[1 .. 11],
					[
						1 2; 1 3; 1 4; 1 5; 1 7; 1 8; 1 10; 1 11;
						2 3; 2 4; 2 6; 2 7; 2 9; 2 10; 2 11; 3 4; 4 5; 4 6; 4 7;
						5 7; 6 7; 7 8; 7 9; 7 10; 8 10; 9 10; 10 11
					]
				),
				'DesarguesGraph': 10.petersenGraph(3),
				'DurerGraph': 6.petersenGraph(2),
				'HeawoodGraph': Graph(
					[1 .. 14],
					[
						1 2; 1 6; 1 14;
						2 3; 2 11;
						3 4; 3 8;
						4 5; 4 13;
						5 6; 5 10;
						6 7; 7 8; 7 12;
						8 9; 9 10; 9 14;
						10 11;
						11 12;
						12 13;
						13 14
					]
				),
				'HerschelGraph': Graph(
					[1 .. 11],
					[
						1 3; 1 4; 1 5; 1 6; 2 3; 2 4; 2 7; 2 8; 3 11; 4 10;
						5 9; 5 10; 6 9; 6 11; 7 9; 7 10; 8 9; 8 11
					]
				),
				'OwensGraph': Graph(
					[1 .. 76],
					[
						1 13; 1 16; 1 37; 1 40; 1 52; 2 11; 2 23; 2 47; 2 71; 2 76;
						3 16; 3 25; 3 35; 3 61; 3 64; 4 40; 4 49; 4 52; 4 64; 4 76;
						5 6; 5 7; 5 8; 5 9; 5 10; 6 7; 6 8; 6 14; 6 15;
						7 9; 7 12; 7 14; 8 10; 8 13; 8 15;
						9 10; 9 11; 9 12; 10 11; 10 13;
						11 12; 11 13; 12 14; 12 16;
						13 15; 14 15; 14 16;
						15 16;
						17 18; 17 19; 17 20; 17 21; 17 22; 18 19; 18 20; 18 26; 18 27;
						19 21; 19 24; 19 26; 20 22; 20 25; 20 27;
						21 22; 21 23; 21 24; 22 23; 22 25;
						23 24; 23 25; 24 26; 24 28; 25 27; 26 27; 26 28;
						27 28; 28 59; 28 73;
						29 30; 29 31; 29 32; 29 33; 29 34; 30 31; 30 32; 30 38; 30 39;
						31 33; 31 36; 31 38; 32 34; 32 37; 32 39;
						33 34; 33 35; 33 36; 34 35; 34 37;
						35 36; 35 37; 36 38; 36 40;
						37 39; 38 39; 38 40;
						39 40; 41 42; 41 43; 41 44; 41 45; 41 46; 42 43; 42 44; 42 50; 42 51;
						43 45; 43 48; 43 50; 44 46; 44 49; 44 51;
						45 46; 45 47; 45 48; 46 47; 46 49;
						47 48; 47 49; 48 50; 48 52; 49 51; 50 51; 50 52;
						51 52; 53 54; 53 55; 53 56; 53 57; 53 58; 54 55; 54 56; 54 62; 54 63;
						55 57; 55 60; 55 62; 56 58; 56 61; 56 63;
						57 58; 57 59; 57 60; 58 59; 58 61; 59 60; 59 61; 60 62; 60 64;
						61 63; 62 63; 62 64; 63 64;
						65 66; 65 67; 65 68; 65 69; 65 70; 66 67; 66 68; 66 74; 66 75;
						67 69; 67 72; 67 74; 68 70; 68 73; 68 75;
						69 70; 69 71; 69 72; 70 71; 70 73; 71 72; 71 73; 72 74; 72 76;
						73 75; 74 75; 74 76; 75 76
					]
				),
				'PetersenGraph': petersenGraph(5, 2),
				'ShrikhandeGraph': Graph(
					[1 .. 16],
					[
						1 2; 1 3; 1 4; 1 5; 1 6; 1 7;
						2 3; 2 7; 2 8; 2 9; 2 10;
						3 4; 3 8; 3 11; 3 12;
						4 6; 4 11; 4 13; 4 14;
						5 6; 5 7; 5 12; 5 15; 5 16;
						6 9; 6 13; 6 15;
						7 10; 7 14; 7 16;
						8 9; 8 12; 8 13; 8 16;
						9 10; 9 13; 9 15;
						10 11; 10 14; 10 15;
						11 12; 11 14; 11 15;
						12 15; 12 16;
						13 14; 13 16;
						14 16
					]
				),
				'TietzeGraph': Graph(
					[1 .. 12],
					[
						1 2; 1 9; 1 10; 2 3; 2 6; 3 4; 3 8; 4 5; 4 11; 5 6; 5 9;
						6 7; 7 8; 7 12; 8 9; 10 11; 10 12; 11 12
					]
				),
				'TutteGraph': Graph(
					[1 .. 46],
					[
						1 11; 1 12; 1 13; 2 3; 2 8; 2 20; 3 4; 3 42; 4 5; 4 28;
						5 6; 5 34; 6 7; 6 46; 7 10; 7 30; 8 9; 8 22;
						9 10; 9 23; 10 25; 11 14; 11 15; 12 27; 12 29;
						13 31; 13 32; 14 16; 14 22; 15 16; 15 19; 16 17;
						17 18; 17 21; 18 19; 18 24; 19 25; 20 26; 20 41;
						21 22; 21 23; 23 24; 24 25;
						26 27; 26 39; 27 35; 28 29; 28 40;
						29 35; 30 31; 30 45; 31 36; 32 33; 32 36;
						33 34; 33 43; 34 44; 35 37; 36 38;
						37 39; 37 40; 38 43; 38 45; 39 41; 40 42;
						41 42; 43 44; 44 46;
						45 46
					]
				),
				'TutteThreeEightCageGraph': Graph(
					[1 .. 30],
					[
						1 2; 1 14; 1 30;
						2 3; 2 19;
						3 4; 3 24;
						4 5; 4 11;
						5 6; 5 28;
						6 7; 6 15;
						7 8; 7 20;
						8 9; 8 25;
						9 10; 9 30;
						10 11; 10 17;
						11 12;
						12 13; 12 21;
						13 14; 13 26;
						14 15;
						15 16;
						16 17; 16 23;
						17 18;
						18 19; 18 27;
						19 20;
						20 21;
						21 22;
						22 23; 22 29;
						23 24;
						24 25;
						25 26;
						26 27;
						27 28;
						28 29;
						29 30
					]
				)
			)
		}
	}

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
