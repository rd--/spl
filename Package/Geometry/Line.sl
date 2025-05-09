Line : [Object] { | vertexCoordinates |

	arcLength { :self |
		let answer = 0;
		self.vertexCoordinates.adjacentPairsDo { :u :v |
			answer := answer + u.euclideanDistance(v)
		};
		answer
	}

	at { :self :index |
		self.vertexCoordinates[index]
	}

	boundingBox { :self |
		self.vertexCoordinates.coordinateBoundingBox
	}

	collect { :self :aBlock:/1 |
		Line(
			self.vertexCoordinates.collect(aBlock:/1)
		)
	}

	dimension { :self |
		1
	}

	edgeCount { :self |
		self.vertexCount - 1
	}

	edgeList { :self |
		(1 .. self.vertexCount - 1).collect { :i |
			[i, i + 1]
		}
	}

	embeddingDimension { :self |
		self.vertexCoordinates.anyOne.size
	}

	forSvg { :self :options |
		(self.vertexCount = 2).if {
			let precision = options['precision'];
			let [p1, p2] = self.vertexCoordinates;
			let [x1, y1] = p1;
			let [x2, y2] = p2;
			'<line x1="%" y1="%" x2="%" y2="%" />'.format([
				x1.printStringToFixed(precision),
				y1.printStringToFixed(precision),
				x2.printStringToFixed(precision),
				y2.printStringToFixed(precision)
			])
		} {
			'<polyline points="%" />'.format([
				self.vertexCoordinates.asSvgPointList(options)
			])
		}
	}

	lineIndices { :self |
		[self.vertexList]
	}

	midpoint { :self |
		let p = self.vertexCoordinates;
		let l = self.arcLength;
		let h = l / 2;
		let i = 1;
		let c1 = 0;
		let c2 = c1;
		let _ = {
			c2 < h
		}.whileTrue {
			c1 := c2;
			c2 := c1 + p[i].euclideanDistance(p[i + 1]);
			i := i + 1
		};
		let d = h - c1;
		let v = p[i] - p[i - 1];
		p[i - 1] + (v.normalize * d)
	}

	project { :self :projection |
		Line(
			self.vertexCoordinates.collect(projection.asUnaryBlock)
		)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	vertexCount { :self |
		self.vertexCoordinates.size
	}

	vertexList { :self |
		[1 .. self.vertexCoordinates.size]
	}

}

+List {

	closedLine { :self |
		Line(self ++ [self.first])
	}

	Line { :self |
		(self.rank > 2).if {
			self.collect(Line:/1)
		} {
			newLine().initializeSlots(self)
		}
	}

}

+[List, Slice] {

	bresenhamLineAlgorithm { :self |
		let [x1, y1] = self[1];
		let [x2, y2] = self[2];
		let dx = (x2 - x1).abs;
		let sx = (x1 < x2).if { 1 } { -1 };
		let dy = (y2 - y1).abs.-;
		let sy = (y1 < y2).if { 1 } { -1 };
		let e = dx + dy;
		let answer = [];
		{
			answer.add([x1, y1]);
			((x1 == x2) & { y1 == y2 }).if {
				false
			} {
				let e2 = 2 * e;
				(e2 >= dy).ifTrue {
					e := e + dy;
					x1 := x1 + sx
				};
				(e2 <= dx).ifTrue {
					e := e + dx;
					y1 := y1 + sy
				};
				true
			}
		}.whileTrue;
		answer
	}

	ramerDouglasPeuckerAlgorithm { :self :epsilon |
		let dMax = 0;
		let index = 0;
		let end = self.size;
		let answer = [];
		2.toDo(end - 1) { :i |
			let d = [self[1], self[end]].pointLineDistance(self[i]);
			(d > dMax).ifTrue {
				index := i;
				dMax := d
			}
		};
		(dMax > epsilon).if {
			let p = ramerDouglasPeuckerAlgorithm(self.sliceFromTo(1, index), epsilon);
			let q = ramerDouglasPeuckerAlgorithm(self.sliceFromTo(index, end), epsilon);
			answer.addAll(p.sliceFromTo(1, p.size - 1));
			answer.addAll(q)
		} {
			answer.add(self[1]);
			answer.add(self[end])
		};
		answer
	}

}

+@Integer {

	gosperCurve { :self |
		let angle = 0;
		let answer = [[0 0]];
		[
			'A' -> 'A-B--B+A++AA+B-',
			'B' -> '+A-BB--B-A++A+B',
			'+' -> '+',
			'-' -> '-'
		]
		.asMap
		.substitutionSystem('A', self)
		.last
		.contents
		.do { :each |
			(each = 'A' | { each = 'B' }).if {
				answer.add(answer.last + angle.angleVector)
			} {
				angle := angle + (each = '+').if { 1/3.pi } { -1/3.pi }
			}
		};
		answer
	}

	hilbertCurve { :self |
		let angle = 0;
		let answer = [[0 0]];
		[
			'A' -> '+BF-AFA-FB+',
			'B' -> '-AF+BFB+FA-',
			'F' -> 'F',
			'+' -> '+',
			'-' -> '-'
		]
		.asMap
		.substitutionSystem('A', self)
		.last
		.select { :each | '+-F'.includes(each) }
		.contents
		.do { :each |
			(each = 'F').if {
				answer.add(answer.last + angle.angleVector)
			} {
				angle := angle + (each = '+').if { 0.5.pi } { -0.5.pi }
			}
		};
		answer
	}

	kochCurve { :self |
		let angle = 0;
		let answer = [[0 0]];
		[
			'F' -> 'F+F--F+F',
			'+' -> '+',
			'-' -> '-'
		]
		.asMap
		.substitutionSystem('F', self)
		.last
		.select { :each | '+-F'.includes(each) }
		.contents
		.do { :each |
			(each = 'F').if {
				answer.add(answer.last + angle.angleVector)
			} {
				angle := angle + (each = '+').if { 1/3.pi } { -1/3.pi }
			}
		};
		answer
	}

	peanoCurve { :self |
		let angle = 0;
		let answer = [[0 0]];
		[
			'X' -> 'XFYFX+F+YFXFY-F-XFYFX',
			'Y' -> 'YFXFY-F-XFYFX+F+YFXFY',
			'F' -> 'F',
			'+' -> '+',
			'-' -> '-'
		]
		.asMap
		.substitutionSystem('X', self)
		.last
		.select { :each | '+-F'.includes(each) }
		.contents
		.do { :each |
			(each = 'F').if {
				answer.add(answer.last + angle.angleVector)
			} {
				angle := angle + (each = '+').if { 0.5.pi } { -0.5.pi }
			}
		};
		answer
	}

	sierpinskiCurve { :self |
		let angle = 0;
		let answer = [[0 0]];
		[
			'X' -> 'XF+G+XF--F--XF+G+X',
			'F' -> 'F',
			'G' -> 'G',
			'+' -> '+',
			'-' -> '-'
		]
		.asMap
		.substitutionSystem('F--XF--F--XF', self)
		.last
		.select { :each | '+-FG'.includes(each) }
		.contents
		.do { :each |
			('FG'.includes(each)).if {
				answer.add(answer.last + angle.angleVector)
			} {
				angle := angle + (each = '+').if { 0.25.pi } { -0.25.pi }
			}
		};
		answer
	}

	zOrderCurve { :self |
		(0 .. self - 1).collect { :n |
			let b = n.integerDigits(2);
			let k = b.size;
			let [y, x] = b.padLeft([k + (k % 2)], 0).deinterleave(2);
			[x, y].collect { :each |
				each.fromDigits(2)
			}
		}
	}

}

+System {

	schareinKnotCatalogue { :self |
		self.requireLibraryItem(
			'SchareinKnotCatalogue'
		)
	}

	schareinLinkCatalogue { :self |
		self.requireLibraryItem(
			'SchareinLinkCatalogue'
		)
	}

	schareinMinimalKnotCatalogue { :self |
		self.requireLibraryItem(
			'SchareinMinimalKnotCatalogue'
		)
	}

	schareinMinimalLinkCatalogue { :self |
		self.requireLibraryItem(
			'SchareinMinimalLinkCatalogue'
		)
	}

}

LibraryItem(
	name: 'SchareinKnotCatalogue',
	category: 'Geometry/Knot',
	url: 'https://rohandrape.net/sw/hsc3-data/data/geometry/scharein/SchareinKnotCatalogue.json',
	mimeType: 'application/json',
	parser: identity:/1
)

LibraryItem(
	name: 'SchareinLinkCatalogue',
	category: 'Geometry/Knot',
	url: 'https://rohandrape.net/sw/hsc3-data/data/geometry/scharein/SchareinLinkCatalogue.json',
	mimeType: 'application/json',
	parser:  identity:/1
)

LibraryItem(
	name: 'SchareinMinimalKnotCatalogue',
	category: 'Geometry/Knot',
	url: 'https://rohandrape.net/sw/hsc3-data/data/geometry/scharein/SchareinMinimalKnotCatalogue.json',
	mimeType: 'application/json',
	parser: identity:/1
)

LibraryItem(
	name: 'SchareinMinimalLinkCatalogue',
	category: 'Geometry/Knot',
	url: 'https://rohandrape.net/sw/hsc3-data/data/geometry/scharein/SchareinMinimalLinkCatalogue.json',
	mimeType: 'application/json',
	parser:  identity:/1
)
