@Colour {

	~ { :self :aColour |
		self.hasEqualSlotsBy(aColour, ~)
	}

	alpha { :self |
		self.typeResponsibility('alpha')
	}

	asColour { :self |
		self
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

	blue { :self |
		self.rgb.third
	}

	draw { :self |
		self.asSvg.draw
	}

	green { :self |
		self.rgb.second
	}

	hexString { :self |
		'#' ++ self.rgb.collect { :each |
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

	isValid { :self |
		self.rgba.isValidRgba
	}

	linearRgb { :self |
		self.rgb
	}

	red { :self |
		self.rgb.first
	}

	rgba { :self |
		self.rgb ++ [self.alpha]
	}

	rgb { :self |
		self.typeResponsibility('rgb')
	}

	rgbString { :self |
		self.isValid.if {
			let [r, g, b] = (self.rgb * 255).rounded;
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

	srgb { :self |
		self.rgb.srgbEncode
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

	writeSvg { :self :fileName |
		self.asSvg.writeSvg(fileName)
	}

}

@RgbColour {

	negated { :self |
		self.species.value(
			1 - self.rgb,
			self.alpha
		)
	}

	over { :self :aColour |
		let alpha = 1 - ((1 - aColour.alpha) * (1 - self.alpha));
		let m = self.alpha * (1 - aColour.alpha) / alpha;
		let n = aColour.alpha / alpha;
		self.species.value(
			(self.rgb * m) + (aColour.rgb * n),
			alpha
		)
	}

}

RgbColour : [Object, Colour, RgbColour] { | rgb alpha |

	species { :self |
		RgbColour:/2
	}

}

SrgbColour : [Object, Colour, RgbColour] { | rgb alpha |

	linearRgb { :self |
		self.rgb.srgbDecode
	}

	species { :self |
		SrgbColour:/2
	}

	srgb { :self |
		self.rgb
	}

}

+List {

	asColour { :self |
		self.size.caseOfOtherwise([
			3 -> { RgbColour(self, 1) },
			4 -> { RgbColour(self.take(3), self[4]) }
		]) {
			self.error('asColour')
		}
	}

	HsvColour { :self :alpha |
		RgbColour(
			self.hsvToRgb,
			alpha
		)
	}

	RgbColour { :self :alpha |
		newRgbColour().initializeSlots(self, alpha)
	}

	SrgbColour { :self :alpha |
		newSrgbColour().initializeSlots(self, alpha)
	}

}

+SmallFloat {

	adobeRgbDecode { :self |
		self ^ (563 / 256)
	}

	adobeRgbEncode { :self |
		self ^ (256 / 563)
	}

	asColour { :self |
		self.greyLevel
	}

	greyLevel { :level :alpha |
		RgbColour([level, level, level], alpha)
	}

	greyLevel { :level |
		level.greyLevel(1)
	}

	lightnessCie { :y :yn |
		let f = { :y :yn |
			let yyn = y / yn;
			(yyn > ((24 / 116) ^ 3)).if {
				yyn.cubeRoot
			} {
				((841 / 108) * yyn) + (16 / 116)
			}
		};
		116 * f(y * 100, yn * 100) - 16
	}

	srgbDecode { :self |
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

	srgbEncode { :self |
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

	hslToHsv { :self |
		let [h, s, l] = self;
		let v = l + (s * l.min(1 - l));
		[
			h,
			(v = 0).if {
				0
			} {
				2 * (1 - (l / v))
			},
			v
		]
	}

	hslToRgb { :self |
		let [hUnit, s, l] = self.asFloat;
		let h = hUnit * 360;
		let a = s * l.min(1 - l);
		[0 8 4].collect { :n |
			let k = (n + (h / 30)) % 12;
			l - (a * -1.max([k - 3, 9 - k, 1].min))
		}
	}

	hsvToHsl { :self |
		let [h, s, v] = self;
		let l = v * (1 - (s / 2));
		[
			h,
			[0 1].includes(l).if {
				0
			} {
				(v - l) / l.min(1 - l)
			},
			l
		]
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

	isValidHsl { :self |
		self.betweenAnd(0, 1).allTrue
	}

	isValidHsv { :self |
		self.betweenAnd(0, 1).allTrue
	}

	isValidRgb { :self |
		self.betweenAnd(0, 1).allTrue
	}

	isValidRgba { :self |
		self.betweenAnd(0, 1).allTrue
	}

	jabToJch { :self |
		let [l, a, b] = self;
		let [c, h] = [a, b].toPolarCoordinates;
		[l, c, h.radiansToDegrees % 360]
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
			x * rx,
			y * ry,
			z * rz
		] / 100
	}

	labToXyz { :self |
		let d65 = [95.0489, 100, 108.8840];
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
		let epsilon = 216 / 24389;
		let kappa = 24389 / 27;
		let u0 = (4 * rx) / (rx + (15 * ry) + (3 * rz));
		let v0 = (9 * ry) / (rx + (15 * ry) + (3 * rz));
		let y = (l > (kappa * epsilon)).if { ((l + 16) / 116) ^ 3 } { l / kappa };
		let a = (l = 0).if { 0 } { (((52 * l) / (u + (13 * l * u0))) - 1) / 3 };
		let b = -5 * y;
		let c = -1 / 3;
		let d = (l = 0).if { 0 } { y * (((39 * l) / (v + (13 * l * v0))) - 5) };
		let x = (d - b) / (a - c);
		let z = (x * a) + b;
		[x y z]
	}

	luvToXyz { :self |
		let d65 = [95.0489, 100, 108.8840];
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
		lmsToXyz.dot(lms.cubed)
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

	rgbToHsl { :self |
		self.rgbToHsv.hsvToHsl
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
			[0.4124, 0.3576, 0.1805],
			[0.2126, 0.7152, 0.0722],
			[0.0193, 0.1192, 0.9505]
		];
		m.dot(self)
	}

	adobeRgbDecode { :self |
		self.collect(adobeRgbDecode:/1)
	}

	adobeRgbEncode { :self |
		self.collect(adobeRgbEncode:/1)
	}

	srgbDecode { :self |
		self.collect(srgbDecode:/1)
	}

	srgbEncode { :self |
		self.collect(srgbEncode:/1)
	}

	xyzToLab { :self :reference |
		let [x, y, z] = self;
		let [rx, ry, rz] = reference;
		let delta = 6 / 29;
		let epsilon = delta.cubed;
		let kappa = 8 / epsilon;
		let f = { :tu |
			let t = tu * 100;
			(t > epsilon).if {
				t.cubeRoot
			} {
				((kappa * t) + 16) / 116
			}
		};
		let fX = f(x / rx);
		let fY = f(y / ry);
		let fZ = f(z / rz);
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
			let [rx, ry, rz] = reference;
			let epsilon = 216 / 24389;
			let kappa = 24389 / 27;
			let yr = (y / ry) * 100;
			let xyz = x + (15 * y) + (3 * z);
			let rxryrz = rx + (15 * ry) + (3 * rz);
			let u1 = (4 * x) / xyz;
			let v1 = (9 * y) / xyz;
			let ur = (4 * rx) / rxryrz;
			let vr = (9 * ry) / rxryrz;
			let l = (yr > epsilon).if {
				(116 * yr.cubeRoot) - 16
			} {
				kappa * yr
			};
			let u = 13 * l * (u1 - ur);
			let v = 13 * l * (v1 - vr);
			[l, u, v]
		}
	}

	xyzToLuv { :self |
		let d65 = [95.0489, 100, 108.8840];
		self.xyzToLuv(d65)
	}

	xyzToAdobeRgb { :self |
		let m = [
			+2.0413690 -0.5649464 -0.3446944;
			-0.9692660 +1.8760108 +0.0415560;
			+0.0134474 -0.1183897 +1.0154096
		];
		m.dot(self)
	}

	xyzToRgb { :self |
		let m = [
			[ 3.2406255, -1.5372080, -0.4986286],
			[-0.9689307,  1.8757561,  0.0415175],
			[ 0.0557101, -0.2040211,  1.0569959]
		];
		m.dot(self)
	}

	xyyToXyz { :self |
		let [x, y1, y2] = self;
		(y1 = 0).if {
			[0 0 0]
		} {
			[
				(x * y2) / y1,
				y2,
				((1 - x - y1) * y2) / y1
			]
		}
	}

	xyzToXyy { :self |
		let [x, y, z] = self;
		let n = x + y + z;
		(n = 0).if {
			[1 1 1]
		} {
			let m = 1 / n;
			[x * m, y * m, y]
		}
	}

}

+String {

	parseHexColour { :self |
		SrgbColour(
			self.parseHexTriplet,
			1
		)
	}

	parseHexTriplet { :self |
		(self.size = 7).if {
			let r = self.copyFromTo(2, 3);
			let g = self.copyFromTo(4, 5);
			let b = self.copyFromTo(6, 7);
			[r, g, b].collect { :each |
				each.parseInteger(16) / 255
			}
		} {
			self.error('parseHexTriplet')
		}
	}

	parseRgbColour { :self |
		self.beginsWith('rgb(').if {
			let [r, g, b] = self.copyFromTo(5, self.size - 1).splitBy(',');
			SrgbColour(
				[r, g, b].collect { :each |
					each.parseInteger(10) / 255
				},
				1
			)
		} {
			self.error('parseRgbColour')
		}
	}

}

+System {

	colourCheckerChart { :self |
		self.requireLibraryItem(
			'ColourCheckerChart'
		)
	}

	svgColourCatalogue { :self |
		self.requireLibraryItem(
			'SvgColourCatalogue'
		)
	}

}

LibraryItem(
	name: 'SvgColourCatalogue',
	category: 'Graphics/Colour',
	url: 'https://rohandrape.net/sw/hsc3-data/data/colour/svg.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			SrgbColour(each / 255, 1)
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
			each.parseHexColour
		}
	}
)
