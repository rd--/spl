/* Requires: Rectangle */

Svg : [Object] { | contents |

}

+String {

	Svg { :self |
		newSvg().initializeSlots(self)
	}

}

+List {

	asSvgPointList { :self |
		self.collect { :each |
			let [x, y] = each;
			'%,%'.format([x, y])
		}.join(' ')
	}

}

+Rectangle {

	asSvgViewBox { :self :margin |
		[
			self.lowerLeft[1] - margin,
			self.lowerLeft[2] - margin,
			self.width + (margin * 2),
			self.height + (margin * 2)
		].collect(asString:/1).unwords
	}

}
