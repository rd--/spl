Writing : [Object] { | contents lowerLeft |

	asSvg { :self |
		let precision = 2;
		let [x, y] = self.lowerLeft;
		[
			'<g transform="translate(0, 0) scale(1, -1)">',
			'<text x="%" y="%" fill="black" stroke="none">%</text>'.format([
				x.printStringToFixed(precision),
				y.printStringToFixed(precision),
				self.contents
			]),
			'</g>'
		]
	}

	boundingBox { :self |
		[
			self.lowerLeft - [10 10],
			self.lowerLeft + [self.contents.size * 10, 20]
		]
	}

}

+String {

	Writing { :self :lowerLeft |
		newWriting().initializeSlots(self, lowerLeft)
	}

}
