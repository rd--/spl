/* Requires: Rectangle */

Svg : [Object] { | contents |

	drawing { :self |
		self
	}

	show { :self |
		let fileName = '/tmp/svgImage.svg';
		self.writeSvg(fileName);
		system.systemCommand('chromium', [fileName])
	}

	writeSvg { :self :fileName |
		fileName.writeTextFile(self.contents)
	}

}

+String {

	Svg { :self |
		newSvg().initializeSlots(self)
	}

}

+List {

	asColourSvg { :self |
		let yAscending = false;
		let height = self.numberOfRows;
		let width = self.numberOfColumns;
		let bitSize = (100 / height.max(width / 1.goldenRatio)).rounded.max(1);
		let viewBox = Rectangle([0, 0], [width * bitSize, height * bitSize]);
		let items = { :x :y |
			'<rect x="%" y="%" width="%" height="%" fill="%"/>'.format([
				(x - 1 * bitSize),
				(y - 1 * bitSize),
				bitSize,
				bitSize,
				self[y][x].asColour.rgbString
			])
		}.table(1:width, 1:height);
		[
			'<svg xmlns="%" width="%" height="%" viewBox="%">'.format([
				'http://www.w3.org/2000/svg',
				width * bitSize,
				height * bitSize,
				viewBox.asSvgViewBox(margin: 0, precision: 0)
			]),
			'<g stroke="none" transform="translate(0, %) scale(1, %)">'.format([
				yAscending.if { height * bitSize } { 0 },
				yAscending.if { -1 } { 1 }
			]),
			items,
			'</g>',
			'</svg>'
		].flatten.unlines.Svg
	}

	asGreyscaleSvg { :self |
		let maxEntry = self.abs.max.max;
		self.deepCollect { :each |
			let level = (maxEntry - each.abs) / maxEntry;
			level.isVeryCloseTo(1).if {
				RgbColour([1 1 1], 0)
			} {
				level.greyLevel
			}
		}.asColourSvg
	}

	asSvgPointList { :self :options |
		let precision = options['precision'];
		self.collect { :each |
			let [x, y] = each;
			'%,%'.format([
				x.printStringToFixed(precision),
				y.printStringToFixed(precision)
			])
		}.unwords
	}

}

+Rectangle {

	asSvgViewBox { :self :options |
		let precision = options['precision'];
		let margin = options['margin'];
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
