/* Requires: Interval */

Plot : [Object] { | pages format |

	cliDraw { :self |
		(self.format = 'graph').if {
			self.cliGraphDraw
		} {
			self.cliListDraw
		}
	}

	cliGraphDraw { :self |
		let [graph] = self.pages;
		graph.dotDrawing.draw
	}

	cliListDraw { :self |
		let [contents] = self.pages;
		let shape = contents.shape;
		let d = shape.size;
		let a = 'x';
		let c = [0];
		let plotData = (self.format = 'matrix').if {
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

	draw { :self |
		self.format.caseOfOtherwise([
			'graph' -> {
				self.cliGraphDraw
			},
			'matrix' -> {
				let [contents] = self.pages;
				contents.asGreyscaleSvg.draw
			}
		]) {
			self.lineDrawing.draw
		}
	}

	lineDrawing { :self |
		let [pageCount, rowCount, columnCount] = self.pages.shape;
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
					let p:/1 = AxonometricProjection('Chinese').asBlock;
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
					[l, r.t.Polygon].LineDrawing
				} {
					self.error('n×3 matrix: format must be line')
				}
			} {
				self.error('Multiple plots not implemented')
			}
		}
	}

}

+List {

	discretePlot { :self |
		self.typedPlot('discrete')
	}

	graphPlot { :self |
		self.nest.Plot('graph')
	}

	linePlot { :self |
		self.typedPlot('line')
	}

	matrixPlot { :self |
		[self.asFloat].Plot('matrix')
	}

	plot { :self |
		self.linePlot
	}

	scatterPlot { :self |
		self.typedPlot('scatter')
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

	Plot { :self :format |
		newPlot().initializeSlots(self, format)
	}

}

+@Collection {

	functionPlot { :domain :functionBlock:/1 |
		domain.collect { :x |
			let y = functionBlock(x);
			y.isSequence.if {
				y
			} {
				y.isComplex.if {
					y.asList
				} {
					[x, y]
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

}

+Interval {

	functionPlot { :domain :divisions :aBlock:/1 |
		domain.subdivide(divisions).functionPlot(aBlock:/1)
	}

	functionPlot { :self :aBlock:/1 |
		self.functionPlot(100, aBlock:/1)
	}

	parametricPlot { :self :divisions :xBlock:/1 :yBlock:/1 |
		self.subdivide(divisions).parametricPlot(xBlock:/1, yBlock:/1)
	}

	parametricPlot { :self :xBlock:/1 :yBlock:/1 |
		self.parametricPlot(100, xBlock:/1, yBlock:/1)
	}

	surfacePlot { :self :divisions :aBlock:/2 |
		let i = self.subdivide(divisions);
		table(aBlock:/2, i, i).surfacePlot
	}

	surfacePlot { :self :aBlock:/2 |
		self.surfacePlot(15, aBlock:/2)
	}

}
