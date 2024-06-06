{- Requires: Interval -}

+@Sequence {

	cliPlot { :self :format |
		let plotData = self.isVector.if {
			[[1 .. self.size], self.asList].transposed
		} {
			self.collect(asList:/1).asList
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

}

+Interval {

	functionPlot { :domain :functionBlock:/1 |
		domain.subdivide(500).functionPlot(functionBlock:/1)
	}

	complexFunctionPlot { :domain :functionBlock:/1 |
		domain.subdivide(1000).basicFunctionPlot(functionBlock:/1) { :unused :y |
			y.asList
		}
	}

}
