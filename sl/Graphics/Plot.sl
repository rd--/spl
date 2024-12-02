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
		self.cliDraw
	}


}

+List {

	discretePlot { :self |
		self.Plot('discrete')
	}

	graphPlot { :self |
		self.Plot('graph')
	}

	linePlot { :self |
		self.Plot('line')
	}

	matrixPlot { :self |
		self.Plot('matrix')
	}

	plot { :self |
		self.linePlot
	}

	scatterPlot { :self |
		self.Plot('scatter')
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

}

+Interval {

	functionPlot { :domain :functionBlock:/1 |
		domain.subdivide(500).functionPlot(functionBlock:/1)
	}

}
