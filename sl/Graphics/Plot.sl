{- Requires: Interval -}

+@Sequence {

	cliPlot { :self :format |
		let shape = self.shape;
		let d = shape.size;
		let plotData = (d = 1).if {
			[[1 .. self.size], self].transposed
		} {
			(d = 2).if {
				let [m, n] = shape;
				(m = 2).if {
					self.transposed
				} {
					self
				}
			} {
				self.error('cliPlot: dimensions > 2')
			}
		};
		let fileName = '/tmp/listPlot.json';
		fileName.writeTextFile(plotData.asJson).then { :unused |
			system.systemCommand(
				'hsc3-plot',
				[
					'json',
					'xy',
					'--format=' ++ format,
					fileName,
					'0',
					'1'
				]
			)
		}
	}

	discretePlot { :self |
		self.cliPlot('line')
	}

	linePlot { :self |
		self.cliPlot('line')
	}

	scatterPlot { :self |
		self.cliPlot('scatter')
	}

	plot { :self |
		self.linePlot
	}

}

+@Collection {

	basicFunctionPlot { :domain :functionBlock:/1 :processBlock:/2 |
		domain.collect { :x |
			processBlock(x, functionBlock(x))
		}.linePlot
	}

	functionPlot { :domain :functionBlock:/1 |
		domain.basicFunctionPlot(functionBlock:/1) { :x :y | [x, y] }
	}

	complexFunctionPlot { :domain :functionBlock:/1 |
		domain.basicFunctionPlot(functionBlock:/1) { :_ :y |
			y.asList
		}
	}

}

+Interval {

	functionPlot { :domain :functionBlock:/1 |
		domain.subdivide(500).functionPlot(functionBlock:/1)
	}

	complexFunctionPlot { :domain :functionBlock:/1 |
		domain.subdivide(1000).complexFunctionPlot(functionBlock:/1)
	}

}
