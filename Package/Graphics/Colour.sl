@Colour {

	Colour { :self |
		self
	}

	alpha { :self |
		self.typeResponsibility('alpha')
	}

	blue { :self |
		self.rgb.third
	}

	chroma { :self :method |
		method.caseOf(
			[
				'P' -> {
					let [r, g, b] = self.rgb;
					let alpha = 0.5 * ((2.0 * r) - g - b);
					let beta = (3.sqrt / 2.0) * (g - b);
					(alpha.square + beta.square).sqrt
				},
				'R' -> {
					let rgb = self.rgb;
					rgb.max - rgb.min
				}
			]
		)
	}

	drawing { :self |
		[
			'<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">',
			'<rect x="0" y="0" width="100" height="100" fill="%"/>'.format([
				self.hexTriplet
			]),
			'</svg>'
		].joinSvg
	}

	green { :self |
		self.rgb.second
	}

	hexTriplet { :self |
		let c = self.alpha.isOne.if {
			self.rgb
		} {
			self.rgba
		};
		'#' ++ c.collect { :each |
			(each * 255.0).round.byteHexString
		}.stringCatenate
	}

	hsl { :self |
		self.rgb.rgbToHsl
	}

	hsv { :self |
		self.rgb.rgbToHsv
	}

	hue { :self |
		self.hsv.first
	}

	isBlack { :self |
		self.isGreyOf(0.0)
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
				value != 1 & {
					value != 0
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
		self.alpha.isZero
	}

	isValid { :self |
		self.rgba.isValidRgba
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

	linearRgb { :self |
		self.rgb
	}

	red { :self |
		self.rgb.first
	}

	relativeLuminance { :self |
		(self.rgb * [0.2126 0.7152 0.0722]).sum
	}

	rgb { :self |
		self.typeResponsibility('rgb')
	}

	rgbString { :self |
		self.isValid.if {
			let [r, g, b] = (Float(self.rgb) * 255).round;
			let alpha = self.alpha;
			(alpha = 1).if {
				'rgb(%,%,%)'.format([r, g, b])
			} {
				'rgba(%,%,%,%)'.format([r, g, b, alpha])
			}
		} {
			'rgba(255,255,255,0)'
		}
	}

	rgba { :self |
		self.rgb ++ [self.alpha]
	}

}

RgbColour : [Object, Copy, Store, Equal, Colour] {

	| rgb alpha |

	initialize! { :self |
		self.rgb := [0.0 0.0 0.0];
		self.alpha := 1.0;
		self
	}

	lighten { :self :aNumber |
		RgbColour(
			self.rgb.linearInterpolation(
				[1.0 1.0 1.0],
				aNumber
			),
			self.alpha
		)
	}

	[negate, -] { :self |
		RgbColour(
			1.0 - self.rgb,
			self.alpha
		)
	}

	over { :self :aColour |
		let alpha = 1.0 - ((1.0 - aColour.alpha) * (1.0 - self.alpha));
		let m = self.alpha * (1.0 - aColour.alpha) / alpha;
		let n = aColour.alpha / alpha;
		RgbColour(
			(self.rgb * m) + (aColour.rgb * n),
			alpha
		)
	}

	srgbDecode { :self |
		RgbColour(self.rgb.srgbDecode, self.alpha)
	}

	srgbEncode { :self |
		RgbColour(self.rgb.srgbEncode, self.alpha)
	}

}

+List {

	Colour { :self |
		self.atVectorOrElementwise { :a FloatList |
			a.size.caseOf(
				[
					3 -> { RgbColour(a, 1.0) },
					4 -> { RgbColour(a.first(3), a[4]) }
				]
			) {
				self.error('Colour')
			}
		}
	}

	HsvColour { :self :alpha |
		RgbColour(
			Float(self).hsvToRgb,
			alpha
		)
	}

	HsvColour { :self |
		HsvColour(self, 1.0)
	}

	RgbColour { :self :alpha |
		self.atVectorOrElementwise { :v |
			let [r, g, b] = v;
			newRgbColour().initializeSlots([r, g, b], alpha)
		}
	}

	RgbColour { :self |
		self.atVectorOrElementwise { :v |
			RgbColour(v, 1.0)
		}
	}

	RybColour { :ryb :alpha |
		ryb.atVectorOrElementwise { :v |
			RgbColour(v.rybToRgb, alpha)
		}
	}

	RybColour { :ryb |
		RybColour(ryb, 1.0)
	}

	isBlue { :self |
		self.Colour.isBlue
	}

	isCyan { :self |
		self.Colour.isCyan
	}

	isGreen { :self |
		self.Colour.isGreen
	}

	isGrey { :self |
		self.Colour.isGrey
	}

	isMagenta { :self |
		self.Colour.isMagenta
	}

	isRed { :self |
		self.Colour.isRed
	}

	isYellow { :self |
		self.Colour.isYellow
	}

}

+[Float, Fraction, Integer] {

	adobeRgbDecode { :self |
		self ^ (563 / 256)
	}

	adobeRgbEncode { :self |
		self ^ (256 / 563)
	}

	black { :alpha |
		RgbColour([0 0 0], alpha)
	}

	blue { :alpha |
		RgbColour([0.0 0.0 1.0], alpha)
	}

	cubeHelix { :start :rotations :hue :gamma |
		{ :lambda |
			lambda.isBetween(0.0, 1.0).if {
				let phi = 2.0.pi * ((start / 3.0) + (rotations * lambda));
				let e = lambda ^ gamma;
				let alpha = hue * e * (1.0 - e) / 2.0;
				let m = [-0.14861 1.78277; -0.29227 -0.90649; 1.97294 0.0];
				e + (alpha * m.dot([phi.cos phi.sin]))
			} {
				lambda.error('cubeHelix: invalid input')
			}
		}
	}

	green { :alpha |
		RgbColour([0.0 1.0 0.0], alpha)
	}

	greyLevel { :level :alpha |
		RgbColour([level, level, level], alpha)
	}

	greyLevel { :level |
		level.greyLevel(1.0)
	}

	greyLevelOrTransparent { :level |
		level.isVeryClose(1.0).if {
			greyLevel(1.0, 0.0)
		} {
			level.greyLevel
		}
	}

	lightnessCie { :y :yn |
		let f = { :y :yn |
			let yyn = y / yn;
			(yyn > ((24.0 / 116.0) ^ 3.0)).if {
				yyn.cubeRoot
			} {
				((841 / 108) * yyn) + (16 / 116)
			}
		};
		116.0 * f(y * 100.0, yn * 100.0) - 16.0
	}

	red { :alpha |
		RgbColour([1.0 0.0 0.0], alpha)
	}

	saturate { :self |
		self.clip(0.0, 1.0)
	}

	srgbDecode { :self |
		self.isOne.if {
			self
		} {
			(self <= 0.04045).if {
				self / 12.92
			} {
				let a = 0.055;
				((self + a) / (1.0 + a)) ^ 2.4
			}
		}
	}

	srgbEncode { :self |
		self.isOne.if {
			self
		} {
			(self <= 0.0031308).if {
				12.92 * self
			} {
				let a = 0.055;
				(1.0 + a) * (self ^ (1.0 / 2.4)) - a
			}
		}
	}

	turboGradient { :self |
		/* https://gist.github.com/mikhailov-work/0d177465a8151eb6ede1768d51d476c7 */
		let kRedVec4 = [0.13572138, 4.61539260, -42.66032258, 132.13108234];
		let kGreenVec4 = [0.09140261, 2.19418839, 4.84296658, -14.18503333];
		let kBlueVec4 = [0.10667330, 12.64194608, -60.58204836, 110.36276771];
		let kRedVec2 = [-152.94239396, 59.28637943];
		let kGreenVec2 = [4.27729857, 2.82956604];
		let kBlueVec2 = [-89.90310912, 27.34824973];
		let z = { :v | v[3] };
		let zw = { :v | [v[3], v[4]] };
		let x = self.saturate;
		let v4 = [1.0, x, x * x, x * x * x];
		let v2 = [v4.zw * v4.z];
		[
			dot(v4, kRedVec4) + dot(v2, kRedVec2),
			dot(v4, kGreenVec4) + dot(v2, kGreenVec2),
			dot(v4, kBlueVec4) + dot(v2, kBlueVec2)
		].catenate.saturate
	}

	white { :alpha |
		RgbColour([1.0 1.0 1.0], alpha)
	}

}

+List {

	adobeRgbToXyz { :self |
		let m = [
			0.5767309  0.1855540  0.1881852;
			0.2973769  0.6273491  0.0752741;
			0.0270343  0.0706872  0.9911085
		];
		m.dot(self)
	}

	cmyToRgb { :self |
		1 - self
	}

	greyscaleMatrix { :self |
		let maxEntry = self.abs.max.max;
		self.deepCollect { :each |
			let level = (maxEntry - each.abs) / maxEntry;
			level.greyLevelOrTransparent
		}
	}

	hslToHsv { :self |
		let [h, s, l] = self;
		let v = l + (s * l.min(1.0 - l));
		[
			h,
			(v = 0.0).if {
				0.0
			} {
				2.0 * (1.0 - (l / v))
			},
			v
		]
	}

	hslToRgb { :self |
		let [hUnit, s, l] = self;
		let h = hUnit * 360.0;
		let a = s * l.min(1 - l);
		[0.0 8.0 4.0].collect { :n |
			let k = (n + (h / 30.0)) % 12.0;
			l - (a * -1.0.max([k - 3.0, 9.0 - k, 1.0].min))
		}
	}

	hsvToHsl { :self |
		let [h, s, v] = self;
		let l = v * (1.0 - (s / 2.0));
		[
			h,
			[0.0 1.0].includes(l).if {
				0.0
			} {
				(v - l) / l.min(1.0 - l)
			},
			l
		]
	}

	hsvToRgb { :self |
		self.isVector.if {
			self.uncheckedHsvToRgb
		} {
			self.collect(hsvToRgb/1)
		}
	}

	isValidHsl { :self |
		self.isBetween(0.0, 1.0).allTrue
	}

	isValidHsv { :self |
		self.isBetween(0.0, 1.0).allTrue
	}

	isValidRgb { :self |
		self.isBetween(0.0, 1.0).allTrue
	}

	isValidRgba { :self |
		self.isBetween(0.0, 1.0).allTrue
	}

	jabToJch { :self |
		let [l, a, b] = self;
		let [c, h] = [a, b].toPolarCoordinates;
		[l, c, h.radiansToDegrees % 360.0]
	}

	jchToJab { :self |
		let [j, c, h] = self;
		let hRadians = h.degree;
		let a = c * hRadians.cos;
		let b = c * hRadians.sin;
		[j, a, b]
	}

	labToLch { :self |
		self.jabToJch
	}

	labToXyz { :self :reference |
		let [l, a, b] = self;
		let [rx, ry, rz] = reference;
		let delta = 6.0 / 29.0;
		let epsilon = delta.cube;
		let kappa = 8 / epsilon;
		let fy = (l + 16.0) / 116.0;
		let fx = (a / 500.0) + fy;
		let fz = fy - (b / 200.0);
		let fx3 = fx.cube;
		let fz3 = fz.cube;
		let x = (fx3 > epsilon).if { fx3 } { (116.0 * fx - 16.0) / kappa };
		let y = (l > (kappa * epsilon)).if { ((l + 16.0) / 116.0).cube } { l / kappa };
		let z = (fz3 > epsilon).if { fz3 } { (116.0 * fz - 16.0) / kappa };
		[
			x * rx,
			y * ry,
			z * rz
		] / 100.0
	}

	labToXyz { :self |
		let d65 = [95.0489, 100.0, 108.8840];
		self.labToXyz(d65)
	}

	lchToLab { :self |
		self.jchToJab
	}

	lchToLuv { :self |
		self.jchToJab
	}

	luvToLch { :self |
		self.jabToJch
	}

	luvToXyz { :self :reference |
		let [l, u, v] = self;
		let [rx, ry, rz] = reference;
		let epsilon = 216.0 / 24389.0;
		let kappa = 24389.0 / 27.0;
		let u0 = (4.0 * rx) / (rx + (15.0 * ry) + (3.0 * rz));
		let v0 = (9.0 * ry) / (rx + (15.0 * ry) + (3.0 * rz));
		let y = (l > (kappa * epsilon)).if { ((l + 16.0) / 116.0) ^ 3.0 } { l / kappa };
		let a = (l = 0.0).if { 0.0 } { (((52.0 * l) / (u + (13.0 * l * u0))) - 1.0) / 3.0 };
		let b = -5.0 * y;
		let c = -1.0 / 3.0;
		let d = (l = 0.0).if { 0.0 } { y * (((39.0 * l) / (v + (13.0 * l * v0))) - 5.0) };
		let x = (d - b) / (a - c);
		let z = (x * a) + b;
		[x y z]
	}

	luvToXyz { :self |
		let d65 = [95.0489, 100.0, 108.8840];
		self.luvToXyz(d65)
	}

	oklabToXyz { :self |
		let labToLms = [
			[ 1.0,           0.3963377922,  0.2158037581],
			[ 1.0,          -0.1055613423, -0.0638541748],
			[ 1.0,          -0.0894841821, -1.2914855379]
		];
		let lmsToXyz = [
			[ 1.2270138511, -0.5577999807,  0.2812561490],
			[-0.0405801784,  1.1122568696, -0.0716766787],
			[-0.0763812845, -0.4214819784,  1.5861632204]
		];
		let lms = labToLms.dot(self);
		lmsToXyz.dot(lms.cube)
	}

	quilezGradient { :self |
		let [a, b, c, d] = self;
		{ :t |
			a + (b * (2.0.pi * ((c * t) + d)).cos)
		}
	}

	rgbToHsl { :self |
		self.rgbToHsv.hsvToHsl
	}

	rgbToHsv { :self |
		self.isVector.if {
			self.uncheckedRgbToHsv
		} {
			self.collect(rgbToHsv/1)
		}
	}

	rgbToXyz { :self |
		let m = [
			[0.4124, 0.3576, 0.1805],
			[0.2126, 0.7152, 0.0722],
			[0.0193, 0.1192, 0.9505]
		];
		m.dot(self)
	}

	rybToRgb { :ryb :colourTable |
		let [r, y, b] = ryb;
		[1 2 3].collect { :i |
			[
				colourTable['white'][i] * (1.0 - r) * (1.0 - b) * (1.0 - y),
				colourTable['red'][i] * r * (1.0 - b) * (1.0 - y),
				colourTable['blue'][i] * (1.0 - r) * b * (1.0 - y),
				colourTable['violet'][i] * r * b * (1.0 - y),
				colourTable['yellow'][i] * (1.0 - r) * (1.0 - b) * y,
				colourTable['orange'][i] * r * (1.0 - b) * y,
				colourTable['green'][i] * (1.0 - r) * b * y,
				colourTable['black'][i] * r * b * y
			].sum
		}
	}

	rybToRgb { :ryb |
		rybToRgb(ryb, system.rybColourTable)
	}

	saturate { :self |
		self.clip
	}

	srgbDecode { :self |
		self.isVector.if {
			self.uncheckedSrgbDecode
		} {
			self.collect(srgbDecode/1)
		}
	}

	srgbEncode { :self |
		self.isVector.if {
			self.uncheckedSrgbEncode
		} {
			self.collect(srgbEncode/1)
		}
	}

	uncheckedHsvToRgb { :self |
		let [hue, saturation, brightness] = Float(self);
		let s = saturation.min(1.0).max(0.0);
		let v = brightness.min(1.0).max(0.0);
		let h = (hue * 360.0) % 360.0;
		let i = h // 60.0;
		let f = (h % 60.0) / 60.0;
		let p = (1.0 - s) * v;
		let q = (1.0 - (s * f)) * v;
		let t = (1.0 - (s * (1.0 - f))) * v;
		i.caseOf(
			[
				0L -> { [v, t, p] },
				1L -> { [q, v, p] },
				2L -> { [p, v, t] },
				3L -> { [p, q, v] },
				4L -> { [t, p, v] },
				5L -> { [v, p, q] }
			]
		) {
			self.unimplementedCase('hsvToRgb')
		}
	}

	uncheckedRgbToHsv { :self |
		let [r, g, b] = Float(self);
		let v = [r g b].max;
		let c = v - [r g b].min;
		let s = (v = 0.0).if { 0.0 } { c / v };
		let h = (c = 0.0).if {
			0.0
		} {
			(v = r).if {
				60.0 * ((g - b) / c % 6.0)
			} {
				(v = g).if {
					60.0 * ((b - r) / c + 2.0)
				} {
					60.0 * ((r - g) / c + 4.0)
				}
			}
		};
		[h / 360.0, s, v]
	}

	uncheckedSrgbDecode { :self |
		self.collect(srgbDecode/1)
	}

	uncheckedSrgbEncode { :self |
		self.collect(srgbEncode/1)
	}

	xyyToXyz { :self |
		let [x, y1, y2] = self;
		(y1 = 0.0).if {
			[0.0 0.0 0.0]
		} {
			[
				(x * y2) / y1,
				y2,
				((1.0 - x - y1) * y2) / y1
			]
		}
	}

	xyzToAdobeRgb { :self |
		let m = [
			+2.0413690 -0.5649464 -0.3446944;
			-0.9692660 +1.8760108 +0.0415560;
			+0.0134474 -0.1183897 +1.0154096
		];
		m.dot(self)
	}

	xyzToLab { :self :reference |
		let [x, y, z] = self;
		let [rx, ry, rz] = reference;
		let delta = 6.0 / 29.0;
		let epsilon = delta.cube;
		let kappa = 8.0 / epsilon;
		let f = { :tu |
			let t = tu * 100.0;
			(t > epsilon).if {
				t.cubeRoot
			} {
				((kappa * t) + 16.0) / 116.0
			}
		};
		let fX = f(x / rx);
		let fY = f(y / ry);
		let fZ = f(z / rz);
		[
			(116.0 * fY) - 16.0,
			500.0 * (fX - fY),
			200.0 * (fY - fZ)
		]
	}

	xyzToLab { :self |
		let d65 = [95.0489, 100.0, 108.8840];
		self.xyzToLab(d65)
	}

	xyzToLuv { :self :reference |
		(self = [0.0 0.0 0.0]).if {
			self
		} {
			let [x, y, z] = self;
			let [rx, ry, rz] = reference;
			let epsilon = 216.0 / 24389.0;
			let kappa = 24389.0 / 27.0;
			let yr = (y / ry) * 100.0;
			let xyz = x + (15.0 * y) + (3.0 * z);
			let rxryrz = rx + (15.0 * ry) + (3.0 * rz);
			let u1 = (4.0 * x) / xyz;
			let v1 = (9.0 * y) / xyz;
			let ur = (4.0 * rx) / rxryrz;
			let vr = (9.0 * ry) / rxryrz;
			let l = (yr > epsilon).if {
				(116.0 * yr.cubeRoot) - 16.0
			} {
				kappa * yr
			};
			let u = 13.0 * l * (u1 - ur);
			let v = 13.0 * l * (v1 - vr);
			[l, u, v]
		}
	}

	xyzToLuv { :self |
		let d65 = [95.0489, 100.0, 108.8840];
		self.xyzToLuv(d65)
	}

	xyzToOklab { :self |
		let xyzToLms = [
			[0.8189330101,  0.3618667424, -0.1288597137],
			[0.0329845436,  0.9293118715,  0.0361456387],
			[0.0482003018,  0.2643662691,  0.6338517070]
		];
		let lmsToLab = [
			[0.2104542553,  0.7936177850, -0.0040720468],
			[1.9779984951, -2.4285922050,  0.4505937099],
			[0.0259040371,  0.7827717662, -0.8086757660]
		];
		let lms = xyzToLms.dot(self);
		lmsToLab.dot(lms.cubeRoot)
	}

	xyzToRgb { :self |
		let m = [
			[ 3.2406255, -1.5372080, -0.4986286],
			[-0.9689307,  1.8757561,  0.0415175],
			[ 0.0557101, -0.2040211,  1.0569959]
		];
		m.dot(self)
	}

	xyzToXyy { :self |
		let [x, y, z] = self;
		let n = x + y + z;
		(n = 0.0).if {
			[1.0 1.0 1.0]
		} {
			let m = 1.0 / n;
			[x * m, y * m, y]
		}
	}

}

+String {

	isHexTriplet { :self |
		self.beginsWith('#') & {
			self.size = 7L | {
				self.size = 9L
			}
		}
	}

	isRgbTriplet { :self |
		self.beginsWith('rgb(') & {
			self.endsWith(')')
		}
	}

	namedColour { :catalogueName :colourName |
		colourName.isList.if {
			colourName.collect { :i |
				namedColour(catalogueName, i)
			}
		} {
			catalogueName.caseOf(
				[
					'Crayola' -> {
						system
						.crayolaColourCatalogue
						.at(colourName)
						.Colour
					},
					'Ncs' -> {
						system
						.ncsColourCatalogue
						.at(colourName)
						.Colour
					},
					'Svg' -> {
						system
						.svgColourCatalogue
						.at(colourName.toLowerCase)
						.Colour
					}
				]
			)
		}
	}

	namedColour { :self |
		self.includes('/').if {
			let [catalogueName, colourName] = self.splitOn('/');
			namedColour(catalogueName, colourName)
		} {
			self.error('namedColour')
		}
	}

	parseHexColour { :self |
		self.parseHexTriplet.Colour
	}

	parseHexTriplet { :self |
		let k = self.size;
		self.isHexTriplet.ifFalse {
			self.error('String>>parseHexTriplet: not hex triplet')
		};
		(
			k = 7L | {
				k = 9L
			}
		).if {
			let r = self.copyFromTo(2L, 3L);
			let g = self.copyFromTo(4L, 5L);
			let b = self.copyFromTo(6L, 7L);
			let f = { :x |
				x.collect { :each |
					each.parseSmallInteger(16L) / 255.0
				}
			};
			(k = 9L).if {
				let a = self.copyFromTo(8L, 9L);
				f([r, g, b, a])
			} {
				f([r, g, b])
			}
		} {
			self.error('parseHexTriplet')
		}
	}

	parseRgbColour { :self |
		self.parseRgbTriplet.Colour
	}

	parseRgbTriplet { :self |
		self.isRgbTriplet.if {
			let c = self.copyFromTo(5L, self.size - 1L).splitOn(',');
			c.size.isBetween(3L, 4L).if {
				c.collect { :each |
					each.parseSmallInteger(10L) / 255.0
				}
			} {
				self.error('String>>parseRgbTriplet: invalid triplet')
			}
		} {
			self.error('String>>parseRgbTriplet: not Rgb triplet')
		}
	}

}

+Nil {

	Colour { :unused |
		RgbColour([0.0 0.0 0.0], 0.0)
	}

}

+List {

	namedColour { :k :c |
		k.collect { :i |
			i.namedColour(c)
		}
	}

}

+List {

	adobeRgbDecode { :self |
		self.collect(adobeRgbDecode/1)
	}

	adobeRgbEncode { :self |
		self.collect(adobeRgbEncode/1)
	}

	chroma { :self :method |
		self.collect { :each |
			each.chroma(method)
		}
	}

	hsl { :self |
		self.collect(hsl/1)
	}

	hsv { :self |
		self.collect(hsv/1)
	}

	hue { :self |
		self.collect(hue/1)
	}

	namedColour { :self |
		self.collect(namedColour/1)
	}

	rgb { :self |
		self.collect(rgb/1)
	}

	rgba { :self |
		self.collect(rgba/1)
	}

}

+System {

	colourCheckerChart { :self |
		self.requireLibraryItem(
			'ColourCheckerChart'
		)
	}

	crayolaColourCatalogue { :self |
		self.requireLibraryItem(
			'CrayolaColourCatalogue'
		)
	}

	rybColourTable { :self |
		self.cached('RybColourTable') {
			(
				white: [1.0 1.0 1.0],
				red: [1.0 0.0 0.0],
				yellow: [1.0 1.0 0.0],
				blue: [0.163 0.373 0.6],
				violet: [0.5 0.0 0.5],
				green: [0 0.66 0.2],
				orange: [1.0 0.5 0.0],
				black: [0.2 0.094 0.0]
			)
		}
	}

	svgColourCatalogue { :self |
		self.requireLibraryItem(
			'SvgColourCatalogue'
		)
	}

	svgColourDictionary { :self |
		self.svgColourCatalogue.collect(Colour/1)
	}

}

LibraryItem(
	name: 'SvgColourCatalogue',
	category: 'Graphics/Colour',
	url: 'https://rohandrape.net/sw/hsc3-data/data/colour/svg.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			each / 255.0
		}
	}
)

LibraryItem(
	name: 'ColourCheckerChart',
	category: 'Graphics/Colour',
	url: 'https://rohandrape.net/sw/hsc3-data/data/colour/colour-checker-chart.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			each.parseHexTriplet
		}
	}
)

LibraryItem(
	name: 'CrayolaColourCatalogue',
	category: 'Graphics/Colour',
	url: 'https://rohandrape.net/sw/hsc3-data/data/colour/crayola.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			each / 255.0
		}
	}
)
