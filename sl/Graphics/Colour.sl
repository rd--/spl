Colour : [Object] { | red green blue alpha |

	~ { :self :aColour |
		self.hasEqualSlotsBy(aColour, ~)
	}

	asList { :self |
		[self.red, self.green, self.blue, self.alpha]
	}

	asNontranslucentColor { :self |
		self.alpha := 1
	}

	equalBy { :self :aColour :aBlock:/2 |
		aColour.isColour & {
			aBlock(self.red, aColour.red) & {
				aBlock(self.green, aColour.green) & {
					aBlock(self.blue, aColour.blue) & {
						aBlock(self.alpha, aColour.alpha)
					}
				}
			}
		}
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
		}.join('')
	}

	hsv { :self |
		let [r, g, b] = [self.red, self.green, self.blue];
		let v = [r g b].max;
		let c = v - [r g b].min;
		let s = (v = 0).if { 0 } { c / v };
		let h = (c = 0).if {
			0
		} {
			(v = r).if {
				60 * ((g - b) / c % 6)
			} {
				(v = g).if {
					60 * ((b - r) / c + 2)
				} {
					60 * ((r - g) / c + 4)
				}
			}
		};
		[h / 360, s, v]
	}

	hue { :self |
		self.hsv.first
	}

	isBlack { :self |
		self.isGreyOf(0)
	}

	isBlue { :self |
		self.blue > (self.green + 0.3) & {
			self.blue > (self.red + 0.3) & {
				(self.green - self.red).abs < 0.4
			}
		}
	}

	isCyan { :self |
		self.red < 0.05 & {
			self.green.min(self.blue) > 0.5 & {
				(self.green - self.blue).abs < 0.2
			}
		}
	}

	isGreen { :self |
		self.green > (self.blue + 0.3) & {
			self.green > (self.red + 0.3)
		}
	}

	isGrey { :self |
		let value = self.red;
		self.green = value & {
			self.blue = value & {
				value ~= 1 & {
					value ~= 0
				}
			}
		}
	}

	isGreyOf { :self :value |
		self.red = value & {
			self.green = value & {
				self.blue = value
			}
		}
	}

	isMagenta { :self |
		self.green < 0.05 & {
			self.red.min(self.blue) > 0.4 & {
				(self.red - self.blue).abs < 0.3
			}
		}
	}

	isOpaque { :self |
		self.alpha = 1
	}

	isRed { :self |
		self.red > (self.green + 0.4) & {
			self.red > (self.blue + 0.6) & {
				(self.green - self.blue).abs < 0.4
			}
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
			self.red.min(self.green) > 0.5 & {
				(self.red - self.green).abs < 0.2
			}
		}
	}

	negated { :self |
		Colour(1 - self.red, 1 - self.green, 1 - self.blue, self.alpha)
	}

	over { :self :aColour |
		let alpha = 1 - ((1 - aColour.alpha) * (1 - self.alpha));
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
			].collect(storeString:/1).join(', '),
			')'
		].join('')
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

	greyLevel { :level :alpha |
		Colour(level, level, level, alpha)
	}

	greyLevel { :level |
		level.greyLevel(1)
	}

	Hsv { :hue :saturation :brightness |
		let s = saturation.min(1).max(0);
		let v = brightness.min(1).max(0);
		let h = (hue * 360) % 360;
		let i = h // 60;
		let f = (h % 60) / 60;
		let p = (1 - s) * v;
		let q = (1 - (s * f)) * v;
		let t = (1 - (s * (1 - f))) * v;
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
				let a = 0.055;
				(1 + a) * (self ^ (1 / 2.4)) - a
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
				let a = 0.055;
				((self + a) / (1 + a)) ^ 2.4
			}
		}
	}

}

+List {

	asColour { :self |
		self.size.caseOf([
			{ 3 } -> {
				let [r, g, b] = self;
				Colour(r, g, b, 1)
			},
			{ 4 } -> {
				let [r, g, b, a] = self;
				Colour(r, g, b, a)
			}
		])
	}

	hsvToRgb { :self |
		let [h, s, v] = self.asFloat;
		let [r, g, b, a] = Hsv(h, s, v).asList;
		[r g b]
	}

	rgbToHsv { :self |
		let [r, g, b] = self.asFloat;
		Colour(r, g, b, 1).hsv
	}


}

+String {

	parseHexColour { :self |
		(self.size = 7).if {
			let r = self.copyFromTo(2, 3);
			let g = self.copyFromTo(4, 5);
			let b = self.copyFromTo(6, 7);
			[r, g, b, 'ff'].collect { :each |
				each.parseInteger(16) / 255
			}.asColour
		} {
			self.error('parseHexColour')
		}
	}

}

+@Cache {

	colourNameTable { :self |
		self.cached('colourNameTable') {
			(
				black: Colour(0, 0, 0),
				veryVeryDarkGray: Colour(0.125, 0.125, 0.125),
				veryDarkGray: Colour(0.25, 0.25, 0.25),
				darkGray: Colour(0.375, 0.375, 0.375),
				gray: Colour(0.5, 0.5, 0.5),
				lightGray: Colour(0.625, 0.625, 0.625),
				veryLightGray: Colour(0.75, 0.75, 0.75),
				veryVeryLightGray: Colour(0.875, 0.875, 0.875),
				white: Colour(1, 1, 1.0),
				red: Colour(1, 0, 0),
				yellow: Colour(1, 1, 0),
				green: Colour(0, 1, 0),
				cyan: Colour(0, 1, 1.0),
				blue: Colour(0, 0, 1.0),
				magenta: Colour(1, 0, 1.0),
				brown: Colour(0.6, 0.2, 0),
				orange: Colour(1, 0.6, 0),
				lightRed: Colour(1, 0.8, 0.8),
				lightYellow: Colour(1, 1, 0.8),
				lightGreen: Colour(0.8, 1, 0.6),
				lightCyan: Colour(0.4, 1, 1.0),
				lightBlue: Colour(0.8, 1, 1.0),
				lightMagenta: Colour(1, 0.8, 1.0),
				lightBrown: Colour(1, 0.6, 0.2),
				lightOrange: Colour(1, 0.8, 0.4),
				transparent: Colour(0, 0, 0, 0),
				paleBuff: Colour(254 / 255, 250 / 255, 235 / 255),
				paleBlue: Colour(222 / 255, 249 / 255, 254 / 255),
				paleYellow: Colour(255 / 255, 255 / 255, 217 / 255),
				paleGreen: Colour(223 / 255, 255 / 255, 213 / 255),
				paleRed: Colour(255 / 255, 230 / 255, 230 / 255),
				veryPaleRed: Colour(255 / 255, 242 / 255, 242 / 255),
				paleTan: Colour(235 / 255, 224 / 255, 199 / 255),
				paleMagenta: Colour(255 / 255, 230 / 255, 255 / 255),
				paleOrange: Colour(253 / 255, 237 / 255, 215 / 255),
				palePeach: Colour(255 / 255, 237 / 255, 213 / 255),
				pantonePurple: Colour(193 / 255, 81 / 255, 184 / 255)
			)
		}

	}

}
