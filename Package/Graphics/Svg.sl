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
		system.writeTextFile(
			fileName,
			self.contents
		)
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
		let bitSize = (100 / height.max(width / 1.goldenRatio)).round.max(1);
		let viewBox = Rectangle([0, 0], [width * bitSize, height * bitSize]);
		let items = { :x :y |
			let colour = self[y][x].asColour;
			colour.isTransparent.if {
				nil
			} {
				'<rect x="%" y="%" width="%" height="%" fill="%"/>'.format(
					[
						(x - 1 * bitSize),
						(y - 1 * bitSize),
						bitSize,
						bitSize,
						self[y][x].asColour.rgbString
					]
				)
			}
		}.table(1:width, 1:height).collect(deleteMissing:/1);
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
		self.greyscaleMatrix.asColourSvg
	}

	asSvgPointList { :self :options |
		let precision = options['precision'];
		self.collect { :each |
			let [x, y] = each;
			'%,%'.format(
				[
					x.printStringToFixed(precision),
					y.printStringToFixed(precision)
				]
			)
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

+Block {

	scaledFragments { :self:/1 :height :boundingCoordinates |
		let actualBoundingBox = boundingCoordinates.asRectangle;
		let boundingBox = actualBoundingBox.height.isZero.if {
			Rectangle(
				actualBoundingBox.lowerLeft,
				[actualBoundingBox.right, actualBoundingBox.lower + 1]
			)
		} {
			actualBoundingBox
		};
		let yRange = boundingBox.height;
		let precision = (3 - yRange.log10.round).max(0);
		let scaleFactor = (height / boundingBox.height);
		let scaledBoundingBox = Rectangle(boundingBox.lowerLeft * scaleFactor, boundingBox.upperRight * scaleFactor); /* ? */
		let options = (precision: precision, scaleFactor: scaleFactor);
		let strokeWith = (0.5 / scaleFactor);
		let yTranslation = scaledBoundingBox.height + (2 * scaledBoundingBox.lowerLeft[2]);
		[
			'<svg xmlns="%" width="%" height="%" viewBox="%">'.format([
				'http://www.w3.org/2000/svg',
				scaledBoundingBox.width.printStringToFixed(1),
				scaledBoundingBox.height.printStringToFixed(1),
				scaledBoundingBox.asSvgViewBox(margin: 5, precision: precision)
			]),
			'<g fill="none" stroke="black" stroke-width="%%" transform="translate(0, %) scale(%, %)">'.format([
				strokeWith.printStringToFixed(4), '%',
				yTranslation.printStringToFixed(4),
				scaleFactor.printStringToFixed(4),
				scaleFactor.negate.printStringToFixed(4)
			]),
			self(options),
			'</g>',
			'</svg>'
		].flatten.unlines.Svg
	}

}

+SmallFloat {

	svgArcTo { :rx :ry :xAxisRotation :largeArcFlag :sweepFlag :x :y :precision |
		'A % % % % % %,%'.format(
			[
				rx.printStringToFixed(precision),
				ry.printStringToFixed(precision),
				xAxisRotation.printStringToFixed(precision),
				largeArcFlag.boole.printString,
				sweepFlag.boole.printString,
				x.printStringToFixed(precision),
				y.printStringToFixed(precision)
			]
		)
	}

}
