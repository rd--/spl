/* Requires: Rectangle */

Svg : [Object] { | contents |

	draw { :self |
		let fileName = '/tmp/svgImage.svg';
		let svgText = self.contents;
		fileName.writeTextFile(svgText);
		system.systemCommand('chromium', [fileName])
	}

}

+String {

	Svg { :self |
		newSvg().initializeSlots(self)
	}

}

+List {

	asSvgPointList { :self :options |
		let precision = options::precision;
		self.collect { :each |
			let [x, y] = each;
			'%,%'.format([
				x.printStringToFixed(precision),
				y.printStringToFixed(precision)
			])
		}.join(' ')
	}

	asGreyscaleSvg { :self |
		let yAscending = false;
		let [height, width] = self.shape;
		let bitSize = (100 / height.max(width)).rounded.max(1);
		let maxEntry = self.abs.max.max;
		let viewBox = Rectangle([0, 0], [width * bitSize, height * bitSize]);
		let items = { :x :y |
			let level = ((maxEntry - self[y][x].abs) * (255 / maxEntry)).rounded;
			'<rect x="%" y="%" width="%" height="%" fill="%"/>'.format([
				(x - 1 * bitSize),
				(y - 1 * bitSize),
				bitSize,
				bitSize,
				(level = 255).if {
					'transparent'
				} {
					'rgb(%,%,%)'.format([level, level, level])
				}
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

}

+Rectangle {

	asSvgViewBox { :self :options |
		let precision = options::precision;
		let margin = options::margin;
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
