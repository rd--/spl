Writing : [Object, Geometry] {

	| string lowerLeft |

	boundingBox { :self |
		[
			self.lowerLeft - [10 10],
			self.lowerLeft + [self.string.size * 10, 20]
		]
	}

	embeddingDimension { :self |
		self.lowerLeft.size
	}

	svgFragment { :self :options |
		let precision = options['precision'];
		let [x, y] = self.lowerLeft;
		[
			'<g x="%" y="%" transform="translate(%, %) scale(1, -1)">'.format([
				x.decimalStringToScale(precision),
				y.decimalStringToScale(precision),
				x.decimalStringToScale(precision),
				y.decimalStringToScale(precision)
			]),
			'<text fill="black" stroke="none">%</text>'.format([
				self.string
			]),
			'</g>'
		]
	}

}

+String {

	Writing { :self :lowerLeft |
		newWriting().initializeSlots(self, lowerLeft)
	}

}
