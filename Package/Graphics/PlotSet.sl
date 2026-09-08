PlotSet : [Object] { | plotMatrix:<List> |

	drawing { :self |
		let plotMatrix = self.plotMatrix;
		let rowHeight = self.rowHeight;
		let columnWidth = rowHeight;
		let [m, n] = plotMatrix.shape;
		[
			'<svg xmlns="http://www.w3.org/2000/svg" width="%" height="%">'.format(
				[
					n * (columnWidth * 1.25),
					m * (rowHeight * 1.25)
				]
			),
			{ :i :j |
				let p = plotMatrix[i][j];
				p.isNotNil.if {
					let d = p.asLineDrawing;
					d.height := rowHeight;
					[
						'<g transform="translate(%, %)">'.format(
							[
								(j - 1) * (columnWidth * 1.25),
								(i - 1) * (rowHeight * 1.25)
							]
						),
						d.drawing.contents.withoutTrailingBlanks,
						'</g>'
					]
				} {
					''
				}
			}.table(1:m, 1:n),
			'</svg>'
		].joinSvg
	}

	rowHeight { :self |
		let [m, n] = self.plotMatrix.shape;
		(n = 1).if {
			100
		} {
			45
		}
	}

}

+List {

	PlotSet { :self |
		newPlotSet().initializeSlots(self)
	}

	PlotSet { :self :shape |
		PlotSet(
			self.arrayReshape(shape, nil)
		)
	}

}
