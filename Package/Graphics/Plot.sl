/* Requires: Interval */

Plot : [Object] { | pages format options |

	asLineDrawing { :self |
		let columnCount = self.columnCount;
		(columnCount = 2).if {
			let r = self.pages.catenate.coordinateBoundingBox.asRectangle;
			let w = r.width;
			let h = r.height;
			let dataRatio = (w / h);
			let aspectRatio = ((dataRatio - 1).abs < 0.075).if {
				dataRatio
			} {
				1.goldenRatio
			};
			let xScalar = aspectRatio / (w / h);
			let scaledPages = self.pages.collect { :each |
				each * [[xScalar, 1]]
			};
			let items = [];
			let gen:/1 = self.format.caseOf([
				'line' -> {
					{ :p |
						[p.Line]
					}
				},
				'scatter' -> {
					{ :p |
						[p.PointCloud]
					}
				},
				'discrete' -> {
					{ :p |
						p.collect { :each |
							let [x, y] = each;
							Line([x 0; x y])
						}
					}
				}
			]);
			let includesXAxis = r.lower <= 0 & { r.upper >= 0 };
			let includesYAxis = r.left <= 0 & { r.right >= 0 };
			includesXAxis.ifTrue {
				items.add(Point([r.left * xScalar, 0]))
			};
			includesYAxis.ifTrue {
				items.add(Point([0, r.upper]))
			};
			scaledPages.do { :each |
				items.addAll(each.gen)
			};
			items.LineDrawing
		} {
			(columnCount = 3).if {
				(self.format = 'line').if {
					let p:/1 = AxonometricProjection(
						1/6.pi, 0, 0,
						0.5, 1, 1
					).asUnaryBlock;
					let r = [
						-1 -1 0;
						+1 -1 0;
						+1 +1 0;
						-1 +1 0
					];
					let t = { :list |
						list.collect { :each |
							let [x, y, z] = each;
							[x.negated, z, y.negated].p
						}
					};
					let l = self.pages.collect { :each | each.t.Line };
					[l].LineDrawing
				} {
					self.error('n×3 matrix: format must be line')
				}
			} {
				(columnCount = 1).if {
					Plot(
						self.pages.collect { :each |
							each.withIndexCollect { :item :x |
								let [y] = item;
								[x, y]
							}
						},
						self.format
					).asLineDrawing
				} {
					self.error('Multiple plots not implemented: ' ++ columnCount)
				}
			}
		}
	}

	columnCount { :self |
		let counts = self.pages.collect { :each |
			let [rowCount, columnCount] = each.shape;
			columnCount
		}.nub;
		(counts.size = 1).if {
			counts.anyOne
		} {
			self.error('columnCount: pages have differing column counts')
		}
	}

	drawing { :self |
		self.format.caseOf([
			'array' -> {
				let [contents] = self.pages;
				contents.asColourSvg
			},
			'graph' -> {
				let [graph] = self.pages;
				graph.dotDrawing(self.options)
			},
			'matrix' -> {
				let [contents] = self.pages;
				contents.asGreyscaleSvg
			}
		]) {
			self.asLineDrawing.drawing
		}
	}

	pageCount { :self |
		self.pages.size
	}

}

+List {

	arrayPlot { :self |
		[self.asFloat].Plot('array')
	}

	autocorrelationPlot { :y :k |
		y.correlationFunction([0 .. k]).discretePlot
	}

	autocorrelationPlot { :y |
		let k = (y.size.log(10) * 10).floor.max(1);
		y.autocorrelationPlot(k)
	}

	complexListPlot { :self |
		self.realImaginary.scatterPlot
	}

	complexPlot { :self :k :aBlock:/1 |
		let [min, max] = self;
		let colourFunction:/1 = system
		.colourGradients[
			'Kovesi',
			'Cyclic-Mygbm-30-95-C78S25'
		].asColourGradient.asBlock;
		let r = (min.real -- max.real).subdivide(k);
		let i = (min.imaginary -- max.imaginary).subdivide(k);
		{ :x :y |
			let z = Complex(y, x);
			colourFunction(aBlock(z).arg / 2.pi + 0.5)
		}.table(i, r).reversed.Image
	}

	complexPlot { :self :aBlock:/1 |
		let k = 100;
		complexPlot(self, k, aBlock:/1)
	}

	densityHistogramPlot { :d :b1 :b2 |
		d.binCounts(b1, b2).transposed.reversed.matrixPlot
	}

	densityHistogramPlot { :d |
		let [p, q] = d.minMax;
		let [x1, y1] = p;
		let [x2, y2] = q;
		let k = 11;
		let x3 = (x2 - x1) / k;
		let y3 = (y2 - y1) / k;
		let b1 = [x1, x2 + x3, x3];
		let b2 = [y1, y2 + y3, y3];
		densityHistogramPlot(d, b1, b2)
	}

	discretePlot { :self |
		self.typedPlot('discrete')
	}

	fftPlot { :x :n :m :s |
		let a = x.fft(n) / (x.size / 2);
		let b = (a / a.abs.max).abs;
		let c = m.caseOf([
			'Half' -> { b.first(n // 2) },
			'Centred' -> { b.fftShift }
		]);
		let d = c.max(1E-6).abs;
		let e = s.caseOf([
			'Linear' -> { d },
			'Logarithmic' -> { 20 * d.log(10) }
		]);
		e.linePlot
	}

	fftPlot { :x |
		x.fftPlot(x.size.nextPowerOfTwo)
	}

	graphPlot { :self |
		self.nest.Plot('graph', (method: 'neato'))
	}

	histogramListPlot { :self |
		let [b, y] = self;
		let x = b.adjacentPairsCollect { :i :j |
			i + ((j - i) / 2)
		};
		[x, y].transposed.discretePlot
	}

	histogramPlot { :self |
		self.histogramList.histogramListPlot
	}

	histogramPlot { :self :binSpecification |
		self.histogramList(binSpecification).histogramListPlot
	}

	lagPlot { :self :d |
		let k = self.size;
		let n = k - d;
		let y = self.copyFromTo(1, n);
		let x = self.copyFromTo(1 + d, k);
		[x, y].transposed.scatterPlot
	}

	linePlot { :self |
		self.typedSwitchingPlot('line')
	}

	matrixPlot { :self |
		[self.asFloat].Plot('matrix')
	}

	periodogramPlot { :self |
		self.periodogramArray.take(self.size / 2).log.linePlot
	}

	pianoRollPlot { :self |
		let [m, n] = self.shape;
		(n >= 3).if {
			let tMax = self.injectInto(0) { :z :each |
				z.max(each[1] + each[2])
			};
			let tScale = 100 / tMax.max(20);
			let r = self.collect { :each |
				let [t, d, p] = each;
				Rectangle(
					[t * tScale, p],
					[(t + d) * tScale, (p + 1)]
				)
			};
			[
				[
					[0, 32],
					[0, 60],
					[0, 84],
					[tMax * tScale, 60]
				].PointCloud,
				r
			].LineDrawing
		} {
			self.error('pianoRollPlot: not at least three-column matrix')
		}
	}

	polarPlot { :self |
		let k = self.rank;
		(k = 2).if {
			self.collect(fromPolarCoordinates:/1).linePlot
		} {
			(k = 3).if {
				self.collect { :each |
					each.collect(fromPolarCoordinates:/1)
				}.linePlot
			} {
				self.error('polarPlot')
			}
		}
	}

	poincarePlot { :x :n |
		let m = x.size - n;
		(1 .. m).collect { :i |
			[x[i], x[i + n]]
		}.scatterPlot
	}

	poincarePlot { :x |
		x.poincarePlot(1)
	}

	reliefPlot { :self :options |
		let [m, n] = self.shape;
		let [z0, z1] = self.deepMinMax;
		let colourFunction = { :z |
			[z, 0.75, 0.75].hslToRgb
		};
		let data = { :i :j |
			self[i][j]
			.rescale(z0, z1, 0, 1)
			.colourFunction
		}.table(1:m, 1:n);
		options['dataReversed'].ifFalse {
			data.reverse
		};
		data.Image
	}

	reliefPlot { :self |
		self.reliefPlot(dataReversed: false)
	}

	runSequencePlot { :self |
		self.isVector.if {
			self.scatterPlot
		} {
			self.error('runSequencePlot: invalid data')
		}
	}

	scatterPlot { :self |
		self.typedSwitchingPlot('scatter')
	}

	signalPlot { :y :i |
		let [a, b] = i.minMax;
		let c = b - a;
		y.isVector.if {
			y.linePlot
		} {
			let n = y.size;
			let z = 1.15;
			y.withIndexCollect { :each :i |
				each + ((n - i) * c * z)
			}.linePlot
		}
	}

	signalPlot { :y |
		y.signalPlot(-1 -- 1)
	}

	spectralPlot { :self |
		let k = self.size;
		let r = (0.025 * k).rounded;
		let n = k.nextPowerOfTwo;
		let d = self.padRight([n], 0);
		let p = (d.fft / n).take(n / 2).absSquared;
		p[1] := 0;
		(p * 10).gaussianFilter(r).linePlot
	}

	stackedListPlot { :self |
		let level = self[1];
		let data = [level.copy];
		2.toDo(self.size) { :i |
			level := level + self[i];
			data.add(level.copy)
		};
		data.linePlot
	}

	stepPlotLineData { :self |
		self.isVector.if {
			let answer = [];
			self.withIndexDo { :each :index |
				answer.add([index, each]);
				answer.add([index + 1, each])
			};
			answer
		} {
			self.isMatrix.if {
				let [m, n] = self.shape;
				(n = 2).if {
					let x1 = self[1][1];
					let answer = [];
					self.do { :each |
						let [x2, y] = each;
						answer.add([x1, y]);
						answer.add([x2, y]);
						x1 := x2
					};
					answer
				} {
					self.collect(stepPlotLineData:/1)
				}
			} {
				self.collect(stepPlotLineData:/1)
			}
		}
	}

	stepPlot { :self |
		self.stepPlotLineData.linePlot
	}

	surfacePlot { :self :k :aBlock:/2 |
		let [u, v] = self;
		let [m, n] = k;
		let i = (u.min -- u.max).subdivide(m);
		let j = (v.min -- v.max).subdivide(n);
		table(aBlock:/2, i, j).surfacePlot
	}

	surfacePlot { :self :aBlock:/2 |
		self.surfacePlot([15 15], aBlock:/2)
	}

	surfacePlot { :self |
		self.isMatrix.if {
			let [m, n] = self.shape;
			{ :i :j |
				[i, j, self[i,j]]
			}.table(1:m, 1:n).surfacePlot
		} {
			let [m, n, _] = self.shape;
			let p = 1:m.collect { :i |
				1:n.collect { :j |
					self[i][j]
				}
			};
			let q = 1:n.collect { :j |
				1:m.collect { :i |
					self[i][j]
				}
			};
			(p ++ q).linePlot
		}
	}

	timelinePlot { :self |
		self.isVector.if {
			[self].timelinePlot
		} {
			let x0 = self.deepMin;
			let x1 = self.deepMax;
			let k = self.size;
			let y0 = ((x1 - x0) / 4).max(k);
			let p = [[x0, k + 2]];
			1.toDo(k) { :i |
				self[i].do { :x |
					p.add([x, i])
				}
			};
			p.scatterPlot
		}
	}

	typedSwitchingPlot { :self :format |
		self.isArray.if {
			self.typedPlot(format)
		} {
			self.allSatisfy(isVector:/1).if {
				self.typedVectorPlot(format)
			} {
				self.typedPlot(format)
			}
		}
	}

	typedVectorPlot { :self :format |
		self.allSatisfy(isVector:/1).if {
			self.collect { :each |
				each.withIndexCollect { :y :x |
					[x, y]
				}
			}.Plot(format)
		} {
			self.error('typedVectorPlot: invalid data')
		}
	}

	typedPlot { :self :format |
		self := self.asFloat;
		self.isVector.if {
			[self].typedVectorPlot(format)
		} {
			self.isColumnVector.if {
				[self.catenate].typedVectorPlot(format)
			} {
				self.isSmallFloatMatrix.if {
					let [m, n] = self.shape;
					(n <= 3).if {
						[self].Plot(format)
					} {
						self.typedVectorPlot(format)
					}
				} {
					self.Plot(format)
				}
			}
		}
	}

}

+[List, Graph] {

	Plot { :self :format :options |
		newPlot().initializeSlots(self, format, options)
	}

	Plot { :self :format |
		self.Plot(format, ())
	}

}

+@Collection {

	discreteFunctionPlot { :domain :blockList |
		domain.functionPlot(blockList, discretePlot:/1)
	}

	functionPlot { :domain :blockList :plotter:/1 |
		blockList.nest.collect { :aBlock:/1 |
			domain.collect { :x |
				let y = aBlock(x);
				y.isList.if {
					y
				} {
					y.isComplex.if {
						y.asList
					} {
						[x, y]
					}
				}
			}
		}.plotter
	}

	functionPlot { :domain :blockList |
		domain.functionPlot(blockList, linePlot:/1)
	}

	parametricPlot { :domain :xBlock:/1 :yBlock:/1 |
		domain.collect { :u |
			let x = xBlock(u);
			let y = yBlock(u);
			[x, y]
		}.linePlot
	}

	polarPlot { :domain :anObject |
		let blockList = anObject.nest.collect { :aBlock:/1 |
			{ :t |
				let r = aBlock(t);
				[r, t].fromPolarCoordinates
			}
		};
		domain.functionPlot(blockList)
	}

}

+Interval {

	functionPlot { :domain :divisions :anObject |
		domain.subdivide(divisions).functionPlot(anObject)
	}

	functionPlot { :self :anObject |
		self.functionPlot(100, anObject)
	}

	logLinearPlot { :self :aBlock:/1 |
		let k = 100;
		let [a, b] = self.minMax.log;
		let h = (b - a) / (k - 1);
		let x = (0 .. k - 1).collect { :i |
			(a + (i * h)).exp
		};
		let y = x.collect { :each |
			aBlock(each)
		};
		y.linePlot
	}

	parametricPlot { :self :divisions :xBlock:/1 :yBlock:/1 |
		self.subdivide(divisions).parametricPlot(xBlock:/1, yBlock:/1)
	}

	parametricPlot { :self :xBlock:/1 :yBlock:/1 |
		self.parametricPlot(100, xBlock:/1, yBlock:/1)
	}

	polarPlot { :domain :divisions :anObject |
		domain.subdivide(divisions).polarPlot(anObject)
	}

	polarPlot { :self :anObject |
		self.polarPlot(100, anObject)
	}

	surfacePlot { :self :k :aBlock:/2 |
		let i = self.min;
		let j = self.max;
		[i j; i j].surfacePlot([k k], aBlock:/2)
	}

	surfacePlot { :self :aBlock:/2 |
		self.surfacePlot(15, aBlock:/2)
	}

}

+SmallFloat {

	matlabPeaksFunction { :x :y |
		(3 * (1 - x).squared * (0 - x.squared - (y + 1).squared).exp)
		-
		(10 * ((x / 5) - x.cubed- (y ^ 5)) * (0 - x.squared - y.squared).exp)
		-
		((1 / 3) * (0 - (x + 1).squared - y.squared).exp)
	}

}

+Block {

	contourPlot { :self:/2 :xList :yList :zList |
		let d = self:/2.table(xList, yList);
		let l = List(zList.size, []);
		/* let f = { :p :q | p.euclideanDistance(q).abs < 0.01 }; */
		bourkeContourAlgorithm(
			d,
			xList, yList,
			zList
		) { :x1 :y1 :x2 :y2 :z :k |
			l[k].add([[x1, y1], [x2, y2]])
		};
		l.collect { :each |
			each.connectLineSegments(~).collect(Line:/1)
		}.LineDrawing
	}

	densityPlot { :self:/2 :xInterval :yInterval |
		let k = 100;
		self:/2.table(
			xInterval.discretize(k),
			yInterval.discretize(k)
		).reliefPlot(dataReversed: true)
	}

	vectorPlot { :self :xInterval :yInterval |
		let [x1, x2] = xInterval.minMax;
		let [y1, y2] = yInterval.minMax;
		let n = 16;
		let xStep = (x2 - x1) / n;
		let yStep = (y2 - y1) / n;
		let minStep = xStep.min(yStep);
		let coordinateList = { :i :j |
			let x = (x1 + (i * xStep)) + ((j % 2) * (xStep / 2));
			let y = y1 + (j * yStep);
			[x, y]
		}.table([0 .. n - 1], [0 .. n - 1]).flatten(1);
		coordinateList.vectorPlot(self, minStep * 0.35)
	}

	vectorPlot { :self :coordinateList |
		coordinateList.vectorPlot(
			self,
			coordinateList.minMax.range.max * (1/16 * 0.35)
		)
	}

}

+List {

	vectorPlot { :self :aBlock:/2 :scalar |
		self.collect { :xy |
			let [x, y] = xy;
			let uv = aBlock(x, y).normalize * scalar;
			[
				Point(xy + uv),
				Line([xy - uv, xy + uv])
			]
		}.LineDrawing
	}


}

+Association {

	discretePlot { :self |
		[self.key, self.value].transposed.discretePlot
	}

	linePlot { :self |
		[self.key, self.value].transposed.linePlot
	}

}
