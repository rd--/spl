{- Requires: Interval -}

+@Sequence {

	cliPlot { :self :format |
		let shape = self.shape;
		let d = shape.size;
		let a = 'x';
		let c = [0];
		let plotData = (format = 'matrix').if {
			a := 'matrix';
			c := [];
			self.reversed
		} {
			(d = 1).if {
				[self].transposed
			} {
				(d = 2).if {
					let [m, n] = shape;
					(n = 1).if {
						self
					} {
						(n = 2).if {
							a := 'xy';
							c := [0 1];
							self
						} {
							(n = 3).if {
								a := 'xyz';
								c := [0 1 2];
								self
							} {
								self.error('cliPlot: matrix columns > 3')
							}
						}
					}
				} {
					self.error('cliPlot: array dimensions > 2')
				}
			}
		};
		let fileName = '/tmp/listPlot.json';
		fileName.writeTextFile(plotData.asJson).then { :unused |
			system.systemCommand(
				'hsc3-plot',
				[
					'json',
					a,
					'--format=' ++ format,
					fileName
				] ++ c.collect(asString:/1)
			)
		}
	}

	discretePlot { :self |
		self.cliPlot('discrete')
	}

	linePlot { :self |
		self.cliPlot('line')
	}

	matrixPlot { :self |
		self.cliPlot('matrix')
	}

	scatterPlot { :self |
		self.cliPlot('scatter')
	}

	plot { :self |
		self.linePlot
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
