Writing : [Object] { | contents lowerLeft |

	boundingBox { :self |
		[
			self.lowerLeft - [10 10],
			self.lowerLeft + [self.contents.size * 10, 20]
		]
	}

	forSvg { :self :options |
		let precision = options::precision;
		let [x, y] = self.lowerLeft;
		[
			'<g x="%" y="%" transform="translate(0, %) scale(1, -1)">'.format([
				x.printStringToFixed(precision),
				y.printStringToFixed(precision),
				y.printStringToFixed(precision)
			]),
			'<text fill="black" stroke="none">%</text>'.format([
				self.contents
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
