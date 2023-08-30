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

	asNontranslucentColor { :self |
		self.alpha := 1
	}

	fromSrgb { :self |
		Colour(
			self.red.srgbToLinear,
			self.green.srgbToLinear,
			self.blue.srgbToLinear,
			self.alpha
		)
	}

	hexString { :self |
		'#' ++ [self.red, self.green, self.blue].collect { :each |
			(each * 255).rounded.byteHexString
		}.join
	}

	isBlack { :self |
		self.isGreyOf(0)
	}

	isBlue { :self |
		self.blue > (self.green + 0.3) & {
			self.blue > (self.red + 0.3)
		} & {
			(self.green - self.red).abs < 0.4
		}
	}

	isCyan { :self |
		self.red < 0.05 & {
			self.green.min(self.blue) > 0.5
		} & {
			(self.green - self.blue).abs < 0.2
		}
	}

	isGreen { :self |
		self.green > (self.blue + 0.3) & {
			self.green > (self.red + 0.3)
		}
	}

	isGrey { :self |
		| value = self.red; |
		self.green = value & {
			self.blue = value
		} & {
			value ~= 1
		} & {
			value ~= 0
		}
	}

	isGreyOf { :self :value |
		self.red = value & {
			self.green = value
		} & {
			self.blue = value
		}
	}

	isMagenta { :self |
		self.green < 0.05 & {
			self.red.min(self.blue) > 0.4
		} & {
			(self.red - self.blue).abs < 0.3
		}
	}

	isOpaque { :self |
		self.alpha = 1
	}

	isRed { :self |
		self.red > (self.green + 0.4) & {
			self.red > (self.blue + 0.6)
		} & {
			(self.green - self.blue).abs < 0.4
		}
	}

	isTransparent { :self |
		self.alpha = 0
	}

	isWhite { :self |
		self.isGreyOf(1)
	}

	isYellow { :self |
		self.blue < 0.1 & {
			self.red.min(self.green) > 0.5
		} & {
			(self.red - self.green).abs < 0.2
		}
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

	Hsv { :self :saturation :brightness |
		|(
			s = saturation.min(1).max(0),
			v = brightness.min(1).max(0),
			hf = self % 360,
			i = hf // 60,
			f = (hf % 60) / 60,
			p = (1 - s) * v,
			q = (1 - (s * f)) * v,
			t = (1 - (s * (1 - f))) * v
		)|
		[s, v, hf, i, f, p, q, t].postLine;
		i.caseOfOtherwise([
			{ 0 } ->  { Colour(v, t, p) },
			{ 1 } ->  { Colour(q, v, p) },
			{ 2 } ->  { Colour(p, v, t) },
			{ 3 } ->  { Colour(p, q, v) },
			{ 4 } ->  { Colour(t, p, v) },
			{ 5 } ->  { Colour(v, p, q) }
		]) {
			self.error('Hsv: implementation error')
		}
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
