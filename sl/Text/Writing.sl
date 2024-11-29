Writing : [Object] { | contents coordinates |

	asSvg { :self |
		let [x, y] = self.coordinates;
		'<text x="%" y="%" fill="black" stroke="none">%</text>'.format([
			x y self.contents
		])
	}

}

+String {

	Writing { :self :coordinates |
		newWriting().initializeSlots(self, coordinates)
	}

}
