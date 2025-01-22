Colour : [Object] { | red green blue alpha |

	~ { :self :aColour |
		self.hasEqualSlotsBy(aColour, ~)
	}

	asColour { :self |
		self
	}

	asList { :self |
		[self.red, self.green, self.blue, self.alpha]
	}

	asNontranslucentColor { :self |
		self.alpha := 1
	}

	asSvg { :self |
		[
			'<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">',
			'<rect x="0" y="0" width="100" height="100" fill="%"/>'.format([
				self.hexString
			]),
			'</svg>'
		].unlines.Svg
	}

	draw { :self |
		self.asSvg.draw
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
		self.rgb.rgbToHsv
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

	rgb { :self |
		[self.red, self.green, self.blue]
	}

	rgba { :self |
		[self.red, self.green, self.blue, self.alpha]
	}

	rgbString { :self |
		'rgb(%,%,%,%)'.format(
			[
				(self.red * 255).rounded,
				(self.green * 255).rounded,
				(self.blue * 255).rounded,
				self.alpha
			]
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

	writeSvg { :self :fileName |
		self.asSvg.writeSvg(fileName)
	}

}

+SmallFloat {

	asColour { :self |
		Colour(self, self, self, 1)
	}

	Colour { :r :g :b |
		Colour(r, g, b, 1)
	}

	Colour { :r :g :b :a |
		newColour().initializeSlots(r, g, b, a)
	}

	greyLevel { :level :alpha |
		Colour(level, level, level, alpha)
	}

	greyLevel { :level |
		level.greyLevel(1)
	}

	Hsv { :h :s :v |
		let [r, g, b] = [h, s, v].hsvToRgb;
		Colour(r, g, b, 1)
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
		let [hue, saturation, brightness] = self.asFloat;
		let s = saturation.min(1).max(0);
		let v = brightness.min(1).max(0);
		let h = (hue * 360) % 360;
		let i = h // 60;
		let f = (h % 60) / 60;
		let p = (1 - s) * v;
		let q = (1 - (s * f)) * v;
		let t = (1 - (s * (1 - f))) * v;
		i.caseOfOtherwise([
			{ 0 } ->  { [v, t, p] },
			{ 1 } ->  { [q, v, p] },
			{ 2 } ->  { [p, v, t] },
			{ 3 } ->  { [p, q, v] },
			{ 4 } ->  { [t, p, v] },
			{ 5 } ->  { [v, p, q] }
		]) {
			'hsvToRgb'.error('implementation error')
		}
	}

	labToXyz { :self :reference |
		let [l, a, b] = self;
		let [xn, yn, zn] = reference;
		let delta = 6 / 29;
		let epsilon = delta.cubed;
		let kappa = 8 / epsilon;
		let fy = (l + 16) / 116;
		let fx = (a / 500) + fy;
		let fz = fy - (b / 200);
		let fx3 = fx.cubed;
		let fz3 = fz.cubed;
		let x = (fx3 > epsilon).if { fx3 } { (116 * fx - 16) / kappa };
		let y = (l > (kappa * epsilon)).if { ((l + 16) / 116).cubed } { l / kappa };
		let z = (fz3 > epsilon).if { fz3 } { (116 * fz - 16) / kappa };
		[
			x * xn,
			y * yn,
			z * zn
		]
	}

	labToXyz { :self |
		let d65 = [95.0489, 100, 108.8840];
		self.labToXyz(d65)
	}

	luvToXyz { :self :reference |
		let [l, u, v] = self;
		let epsilon = 216 / 24389;
		let kappa = 24389 / 27;
		let [xn, yn, zn] = reference;
		let v0 = 9 * yn / (xn + (15 * yn) + (3 * zn));
		let u0 = 4 * xn / (xn + (15 * yn) + (3 * zn));
		let y = (l > (kappa * epsilon)).if { ((l + 16) / 116) ^ 3 } { l / kappa };
		let d = (l = 0).if { 0 } { y * (39 * l / (v + (13 * l * v0)) - 5) };
		let c = -1 / 3;
		let b = -5 * y;
		let a = (l = 0).if { 0 } { (52 * l / (u + (13 * l * u0)) - 1) / 3 };
		let x = (d - b) / (a - c);
		let z = x * a + b;
		[x y z]
	}

	luvToXyz { :self |
		let d65 = [95.0489, 100, 108.8840];
		self.luvToXyz(d65)
	}

	rgbToHsv { :self |
		let [r, g, b] = self.asFloat;
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

	rgbToXyz { :self |
		let m = [
			[0.412390799265959, 0.357584339383878, 0.180480788401834],
			[0.212639005871510, 0.715168678767756, 0.072192315360734],
			[0.019330818715592, 0.119194779794626, 0.950532152249661]
		];
		m.dot(self)
	}

	srgbFromLinear { :self |
		self.collect(srgbFromLinear:/1)
	}

	srgbToLinear { :self |
		self.collect(srgbToLinear:/1)
	}

	xyzToLab { :self :reference |
		let [x, y, z] = self;
		let [xn, yn, zn] = reference;
		let delta = 6 / 29;
		let epsilon = delta.cubed;
		let kappa = 8 / epsilon;
		let f = { :t |
			(t > epsilon).if {
				t.cubeRoot
			} {
				((kappa * t) + 16) / 116
			}
		};
		let fX = f(x / xn);
		let fY = f(y / yn);
		let fZ = f(z / zn);
		[
			(116 * fY) - 16,
			500 * (fX - fY),
			200 * (fY - fZ)
		]
	}

	xyzToLab { :self |
		let d65 = [95.0489, 100, 108.8840];
		self.xyzToLab(d65)
	}

	xyzToLuv { :self :reference |
		(self = [0 0 0]).if {
			[0 0 0]
		} {
			let [x, y, z] = self;
			let epsilon = 216 / 24389;
			let kappa = 24389 / 27;
			let [xn, yn, zn] = reference;
			let vr = 9 * yn / (xn + (15 * yn) + (3 * zn));
			let ur = 4 * xn / (xn + (15 * yn) + (3 * zn));
			let v1 = 9 * y / (x + (15 * y) + (3 * z));
			let u1 = 4 * x / (x + (15 * y) + (3 * z));
			let yr = y / yn;
			let l = (yr > epsilon).if { (116 * yr.cubeRoot) - 16 } { kappa * yr };
			let u = 13 * l * (u1 - ur);
			let v = 13 * l * (v1 - vr);
			[l, u, v] * 100
		}
	}

	xyzToLuv { :self |
		let d65 = [95.0489, 100, 108.8840];
		self.xyzToLuv(d65)
	}

	xyzToRgb { :self |
		let m = [
			[3.240969941904523, -1.537383177570094, -0.498610760293003],
			[-0.969243636280880, 1.875967501507721, 0.041555057407176],
			[0.055630079696994, -0.203976958888977, 1.056971514242879]
		];
		m.dot(self)
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
