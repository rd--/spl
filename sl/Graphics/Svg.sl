/* Requires: Rectangle */

Svg : [Object] { | contents |

}

+String {

	Svg { :self |
		newSvg().initializeSlots(self)
	}

}

+List {

	asSvgPointList { :self :options |
		let precision = options::precision;
		self.collect { :each |
			let [x, y] = each;
			'%,%'.format([
				x.printStringToFixed(precision),
				y.printStringToFixed(precision)
			])
		}.join(' ')
	}

}

+Rectangle {

	asSvgViewBox { :self :options |
		let precision = options::precision;
		let margin = options::margin;
		[
			self.lowerLeft[1] - margin,
			self.lowerLeft[2] - margin,
			self.width + (margin * 2),
			self.height + (margin * 2)
		].collect { :each |
			each.printStringToFixed(precision)
		}.unwords
	}

}
