/* Requires: Interval */

Plot : [Object] { | pages format options |

	asLineDrawing { :self |
		let columnCount = self.columnCount;
		(columnCount = 2).if {
			let r = self.pages.concatenation.coordinateBoundingBox.asRectangle;
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
				{ 'line' } -> {
					{ :p |
						[p.Line]
					}
				},
				{ 'scatter' } -> {
					{ :p |
						[p.PointCloud]
					}
				},
				{ 'discrete' } -> {
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

	cliDraw { :self |
		(self.format = 'graph').if {
			self.cliGraphDraw
		} {
			self.cliListDraw
		}
	}

	cliGraphDraw { :self |
		let [graph] = self.pages;
		graph.dotDrawing(self.options).draw
	}

	cliListDraw { :self |
		let [contents] = self.pages;
		let shape = contents.shape;
		let d = shape.size;
		let a = 'x';
		let c = [0];
		let plotData = ['array' 'matrix'].includes(self.format).if {
			a := 'matrix';
			c := [];
			contents.reversed
		} {
			(d = 1).if {
				[contents].transposed
			} {
				(d = 2).if {
					let [m, n] = shape;
					(n = 1).if {
						contents
					} {
						(n = 2).if {
							a := 'xy';
							c := [0 1];
							contents
						} {
							(n = 3).if {
								a := 'xyz';
								c := [0 1 2];
								contents
							} {
								contents.error('cliDraw: matrix columns > 3')
							}
						}
					}
				} {
					contents.error('cliPlot: array dimensions > 2')
				}
			}
		};
		let fileName = '/tmp/listPlot.json';
		fileName.writeTextFile(plotData.asJson);
		system.systemCommand(
			'hsc3-plot',
			[
				'json',
				a,
				'--format=' ++ self.format,
				fileName
			] ++ c.collect(asString:/1)
		)
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

	draw { :self |
		self.format.caseOfOtherwise([
			'array' -> {
				let [contents] = self.pages;
				contents.asColourSvg.draw
			},
			'graph' -> {
				let [graph] = self.pages;
				graph.dotDrawing(self.options).draw
			},
			'matrix' -> {
				let [contents] = self.pages;
				contents.asGreyscaleSvg.draw
			}
		]) {
			self.asLineDrawing.draw
		}
	}

	pageCount { :self |
		self.pages.size
	}

	writeSvg { :self :fileName |
		self.format.caseOfOtherwise([
			'array' -> {
				let [contents] = self.pages;
				contents.asColourSvg.writeSvg(fileName)
			},
			'graph' -> {
				let [graph] = self.pages;
				graph.dotDrawing(self.options).writeSvg(fileName)
			},
			'matrix' -> {
				let [contents] = self.pages;
				contents.asGreyscaleSvg.writeSvg(fileName)
			}
		]) {
			self.asLineDrawing.writeSvg(fileName)
		}
	}

}

+List {

	arrayPlot { :self |
		[self.asFloat].Plot('array')
	}

	discretePlot { :self |
		self.typedPlot('discrete')
	}

	graphPlot { :self |
		self.nest.Plot('graph', (method: 'neato'))
	}

	linePlot { :self |
		self.typedPlot('line')
	}

	matrixPlot { :self |
		[self.asFloat].Plot('matrix')
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

	scatterPlot { :self |
		self.typedPlot('scatter')
	}

	stepPlot { :self |
		self.isVector.if {
			let l = [];
			self.withIndexDo { :each :index |
				l.add([index, each]);
				l.add([index + 1, each])
			};
			l.linePlot
		} {
			self.isMatrix.if {
				let x1 = self[1][1];
				let l = [];
				self.do { :each |
					let [x2, y] = each;
					l.add([x1, y]);
					l.add([x2, y]);
					x1 := x2
				};
				l.linePlot
			} {
				self.error('stepPlot')
			}
		}
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

	typedPlot { :self :format |
		self := self.asFloat;
		self.isVector.if {
			[
				self.withIndexCollect { :y :x |
					[x, y]
				}
			].Plot(format)
		} {
			self.isColumnVector.if {
				[
					self.withIndexCollect { :y :x |
						[x, y.first]
					}
				].Plot(format)
			} {
				self.isMatrix.if {
					[self].Plot(format)
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

	functionPlot { :domain :anObject |
		let blockList = anObject.nest;
		blockList.collect { :aBlock:/1 |
			domain.collect { :x |
				let y = aBlock(x);
				y.isSequence.if {
					y
				} {
					y.isComplex.if {
						y.asList
					} {
						[x, y]
					}
				}
			}
		}.linePlot
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

	surfacePlot { :self :divisions :aBlock:/2 |
		let i = self.subdivide(divisions);
		table(aBlock:/2, i, i).surfacePlot
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

	densityPlot { :self:/2 :xInterval :yInterval |
		let k = 100;
		let colourFunction = { :z |
			[z, 0.75, 0.75].hslToRgb
		};
		{ :x :y |
			self(x, y).colourFunction
		}.table(
			xInterval.discretize(k),
			yInterval.discretize(k)
		).Image
	}

}
