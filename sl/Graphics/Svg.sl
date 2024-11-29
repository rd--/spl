/* Requires: Rectangle */

+Rectangle {

	asSvgViewBox { :self :margin |
		[
			self.lowerLeft.x - margin,
			self.lowerLeft.y - margin,
			self.width + (margin * 2),
			self.height + (margin * 2)
		].collect(asString:/1).unwords
	}

}
