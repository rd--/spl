PlotSet : [Object] { | plotList:<List> |

	drawing { :self |
		let svgList = self.plotList.collect(drawing:/1);
		let n = svgList.size;
		Svg(
			[
				'<svg xmlns="http://www.w3.org/2000/svg" height="%">'.format([n * 125]),
				1:n.collect { :i |
					[
						'<g transform="translate(0, %)">'.format([(i - 1) * 125]),
						svgList[i].contents,
						'</g>'
					]
				}.catenate.unlines,
				'</svg>'
			].unlines
		)
	}

}

+List {

	PlotSet { :self |
		newPlotSet().initializeSlots(self)
	}

}
