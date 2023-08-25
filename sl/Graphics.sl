Colour : [Object] { | red green blue alpha |

	= { :self :aColour |
		aColour.isColour & {
			self.red = aColour.red
		} & {
			self.green = aColour.green
		} & {
			self.blue = aColour.blue
		} & {
			self.alpha = aColour.alpha
		}
	}


	hexString { :self |
		'#' ++ [self.red, self.green, self.blue].collect { :each |
			(each * 255).rounded.byteHexString
		}.join
	}

	fromSrgb { :self |
		Colour(
			self.red.srgbToLinear,
			self.green.srgbToLinear,
			self.blue.srgbToLinear,
			self.alpha
		)
	}

	over { :self :aColour |
		| alpha = 1 - ((1 - aColour.alpha) * (1 - self.alpha)); |
		Colour(
			(aColour.red * aColour.alpha / alpha) + (self.red * self.alpha * (1 - aColour.alpha) / alpha),
			(aColour.green * aColour.alpha / alpha) + (self.green * self.alpha * (1 - aColour.alpha) / alpha),
			(aColour.blue * aColour.alpha / alpha) + (self.blue * self.alpha * (1 - aColour.alpha) / alpha),
			alpha
		)
	}

	storeString { :self |
		[
			'Colour(',
			[
				self.red,
				self.green,
				self.blue,
				self.alpha
			].collect(storeString:/1).joinSeparatedBy(','),
			')'
		].join
	}

	toSrgb { :self |
		Colour(
			self.red.srgbFromLinear,
			self.green.srgbFromLinear,
			self.blue.srgbFromLinear,
			self.alpha
		)
	}

}

+SmallFloat {

	Colour { :self :g :b |
		Colour(self, g, b, 1)
	}

	Colour { :self :g :b :a |
		newColour().initializeSlots(self, g, b, a)
	}

	srgbFromLinear { :self |
		(self = 1).if {
			1
		} {
			(self <= 0.0031308).if {
				12.92 * self
			} {
				| a = 0.055; |
				(1 + a) * (self ** (1 / 2.4)) - a
			}
		}
	}

	srgbToLinear { :self |
		(self = 1).if {
			1
		} {
			(self <= 0.04045).if {
				self / 12.92
			} {
				| a = 0.055; |
				((self + a) / (1 + a)) ** 2.4
			}
		}
	}

}

+Array {

	Colour { :self |
		| [r, g, b, a] = self; |
		Colour(r, g, b, a)
	}

}

+String {

	parseHexColour { :self |
		(self.size = 7).if {
			|(
				r = self.copyFromTo(2, 3),
				g = self.copyFromTo(4, 5),
				b = self.copyFromTo(6, 7)
			)|
			[r, g, b, 'ff'].collect { :each |
				each.parseInteger(16) / 255
			}.Colour
		} {
			self.error('parseHexColour')
		}
	}

}
