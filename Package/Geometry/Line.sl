Line : [Object, Geometry] { | vertexCoordinates |

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

	lineEquation { :self |
		let [a, b] = self.vertexCoordinates;
		a.lineEquation(b)
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

	svgFragment { :self :options |
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

	xiaolinWuLineAlgorithm { :self |
		let [x0, y0] = self[1];
		let [x1, y1] = self[2];
		let isSteep = abs(y1 - y0) > abs(x1 - x0);
		let answer = [];
		isSteep.if {
			[y0 x0; y1 x1].xiaolinWuLineAlgorithm
		} {
			(x0 > x1).if {
				[x1 y1; x0 y0].xiaolinWuLineAlgorithm
			} {
				let dx = x1 - x0;
				let dy = y1 - y0;
				let gradient = dy / dx;
				let xEnd0 = x0.round;
				let yEnd0 = y0 + (gradient * (xEnd0 - x0));
				let xGap0 = 1 - (x0 + 0.5).fractionalPart;
				let xPixel0 = xEnd0;
				let yPixel0 = yEnd0.integerPart;
				let interY = yEnd0 + gradient;
				let xEnd1 = x1.round;
				let yEnd1 = y1 + (gradient * (xEnd1 - x1));
				let xGap1 = (x1 + 0.5).fractionalPart;
				let xPixel1 = xEnd1;
				let yPixel1 = yEnd1.integerPart;
				isSteep.if {
					answer.add([yPixel0, xPixel0, (1 - yEnd0.fractionalPart) * xGap0]);
					answer.add([yPixel0 + 1, xPixel0, fractionalPart(yEnd0) * xGap0])
				} {
					answer.add([xPixel0, yPixel0, (1 - fractionalPart(yEnd0)) * xGap0]);
					answer.add([xPixel0, yPixel0 + 1, fractionalPart(yEnd0) * xGap0])
				};
				(xPixel0 + 1).toDo(xPixel1 - 1) { :x |
					isSteep.if {
						answer.add([integerPart(interY), x, 1 - fractionalPart(interY)]);
						answer.add([integerPart(interY) + 1, x, fractionalPart(interY)])
					} {
						answer.add([x, integerPart(interY), 1 - fractionalPart(interY)]);
						answer.add([x, integerPart(interY) + 1, fractionalPart(interY)])
					};
					interY := interY + gradient
				};
				isSteep.if {
					answer.add([yPixel1, xPixel1, (1 - fractionalPart(yEnd1)) * xGap1]);
					answer.add([yPixel1 + 1, xPixel1, fractionalPart(yEnd1) * xGap1])
				} {
					answer.add([xPixel1, yPixel1, (1 - fractionalPart(yEnd1)) * xGap1]);
					answer.add([xPixel1, yPixel1 + 1, fractionalPart(yEnd1) * xGap1])
				}
			}
		};
		answer
	}

}

+SmallFloat {

	spirangle { :n :m :centre :radii :initialAngle |
		let [radiusIncrement, initialRadial] = radii;
		let thetaIncrement = 1.pi - ((n - 2).pi / n);
		let r = initialRadial * radiusIncrement;
		let theta = initialAngle;
		let v = centre + [r, theta].fromPolarCoordinates;
		let vertexCoordinates = [v];
		(m * n).timesRepeat {
			r := r + radiusIncrement;
			theta := (theta + thetaIncrement) % 2.pi;
			v := v + [r, theta].fromPolarCoordinates;
			vertexCoordinates.add(v)
		};
		Line(vertexCoordinates)
	}

}


+SmallFloat {

	cohenSutherlandAlgorithm { :x0 :y0 :x1 :y1 :xMin :yMin :xMax :yMax |
		let inside = 2r0000;
		let left = 2r0001;
		let right = 2r0010;
		let bottom = 2r0100;
		let top = 2r1000;
		let computeOutCode = { :x :y |
			let code = inside;
			(x < xMin).if {
				code := code.bitOr(left)
			} {
				(x > xMax).ifTrue {
					code := code.bitOr(right)
				}
			};
			(y < yMin).if {
				code := code.bitOr(bottom)
			} {
				(y > yMax).ifTrue {
					code := code.bitOr(top)
				}
			};
			code
		};
		let outCode0 = computeOutCode(x0, y0);
		let outCode1 = computeOutCode(x1, y1);
		let accept = false;
		let completed = false;
		{ completed }.whileFalse {
			outCode0.bitOr(outCode1).isNonZero.not.if {
				accept := true;
				completed := true
			} {
				outCode0.bitAnd(outCode1).isNonZero.if {
					completed := true
				} {
					let x = nil;
					let y = nil;
					let outCodeOut = (outCode1 > outCode0).if { outCode1 } { outCode0 };
					outCodeOut.bitAnd(top).isNonZero.if {
						x := x0 + ((x1 - x0) * (yMax - y0) / (y1 - y0));
						y := yMax
					} {
						outCodeOut.bitAnd(bottom).isNonZero.if {
							x := x0 + ((x1 - x0) * (yMin - y0) / (y1 - y0));
							y := yMin
						} {
							outCodeOut.bitAnd(right).isNonZero.if {
								y := y0 + ((y1 - y0) * (xMax - x0) / (x1 - x0));
								x := xMax
							} {
								outCodeOut.bitAnd(left).isNonZero.ifTrue {
									y := y0 + ((y1 - y0) * (xMin - x0) / (x1 - x0));
									x := xMin
								}
							}
						}
					};
					(outCodeOut = outCode0).if {
						x0 := x;
						y0 := y;
						outCode0 := computeOutCode(x0, y0)
					} {
						x1 := x;
						y1 := y;
						outCode1 := computeOutCode(x1, y1)
					}
				}
			}
		};
		[accept, x0, y0, x1, y1]
	}

}

+Line {

	cohenSutherlandAlgorithm { :self :aRectangle |
		let [a, b] = self.vertexCoordinates;
		let c = aRectangle.lowerLeft;
		let d = aRectangle.upperRight;
		let [accept, x1, y1, x2, y2] = cohenSutherlandAlgorithm(a[1], a[2], b[1], b[2], c[1], c[2], d[1], d[2]);
		accept.if {
			Line([x1 y1; x2 y2])
		} {
			nil
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
