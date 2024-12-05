/* Requires: Interval */

Plot : [Object] { | contents format |

	cliDraw { :self |
		(self.format = 'graph').if {
			self.cliGraphDraw
		} {
			self.cliListDraw
		}
	}

	cliGraphDraw { :self |
		let layoutEngine = self.contents.isDirected.if { 'dot' } { 'neato' };
		let dotSource = self.contents.asDot;
		dotSource.dotLayout('svg', layoutEngine).then { :svgText |
			let fileName = '/tmp/graphDrawing.svg';
			fileName.writeTextFile(svgText);
			system.systemCommand('chromium', [fileName])
		}
	}

	cliListDraw { :self |
		let shape = self.contents.shape;
		let d = shape.size;
		let a = 'x';
		let c = [0];
		let plotData = (self.format = 'matrix').if {
			a := 'matrix';
			c := [];
			self.contents.reversed
		} {
			(d = 1).if {
				[self.contents].transposed
			} {
				(d = 2).if {
					let [m, n] = shape;
					(n = 1).if {
						self.contents
					} {
						(n = 2).if {
							a := 'xy';
							c := [0 1];
							self.contents
						} {
							(n = 3).if {
								a := 'xyz';
								c := [0 1 2];
								self.contents
							} {
								self.contents.error('cliDraw: matrix columns > 3')
							}
						}
					}
				} {
					self.contents.error('cliPlot: array dimensions > 2')
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
		(self.format = 'matrix').if {
			self.contents.asGreyscaleSvg.draw
		} {
			self.lineDrawing.draw
		}
	}

	lineDrawing { :self |
		let c = self.contents;
		(c.shape[2] = 2).if {
			let r = c.coordinateBoundingBox.asRectangle;
			let w = r.width;
			let h = r.height;
			let dataRatio = (w / h);
			let aspectRatio = ((dataRatio - 1).abs < 0.075).if {
				dataRatio
			} {
				1.goldenRatio
			};
			let xScalar = aspectRatio / (w / h);
			let scaledC = c * [[xScalar, 1]];
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
			(r.lower <= 0 & { r.upper >= 0 }).ifTrue {
				items.add(Point([r.left * xScalar, 0]))
			};
			(r.left <= 0 & { r.right >= 0 }).ifTrue {
				items.add(Point([0, r.upper]))
			};
			items.addAll(scaledC.gen);
			items.LineDrawing
		} {
			(c.shape[2] = 3 & { self.format = 'line' }).if {
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
				[c.t.Line, r.t.Polygon].LineDrawing
			} {
				self.error('cannot draw')
			}
		}
	}

}

+List {

	discretePlot { :self |
		self.typedPlot('discrete')
	}

	graphPlot { :self |
		self.Plot('graph')
	}

	linePlot { :self |
		self.typedPlot('line')
	}

	matrixPlot { :self |
		self.Plot('matrix')
	}

	plot { :self |
		self.linePlot
	}

	scatterPlot { :self |
		self.typedPlot('scatter')
	}

	typedPlot { :self :format |
		(self.rank = 1).if {
			self.withIndexCollect { :y :x |
				[x y]
			}.Plot(format)
		} {
			(self.rank = 2 & { self.shape[2] = 1}).if {
				self.withIndexCollect { :y :x |
					[x y.first]
				}.Plot(format)
			} {
				self.Plot(format)
			}
		}
	}

}

+[List, Graph] {

	Plot { :contents :format |
		newPlot().initializeSlots(contents, format)
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

}
