/* Requires: Rectangle */

Svg : [Object] {

	| svgString |

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
			self.svgString
		)
	}

}

+String {

	Svg { :self |
		newSvg().initializeSlots(self)
	}

}

+List {

	asSvgPointList { :self :options |
		let precision = options['precision'];
		self.collect { :each |
			let [x, y] = each;
			'%,%'.format(
				[
					x.decimalStringToScale(precision),
					y.decimalStringToScale(precision)
				]
			)
		}.unwords
	}

	joinSvg { :self |
		let stringList = self.flatten;
		stringList.anySatisfy { :x |
			x.isString.not
		}.if {
			self.error('invalid input')
		} {
			let nonEmptyStringList = stringList.reject(isEmpty/1);
			nonEmptyStringList.unlines.Svg
		}
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
			each.decimalStringToScale(precision)
		}.unwords
	}

}

+Block {

	scaledSvgFragments { :self/1 :height :boundingCoordinates |
		let actualBoundingBox = boundingCoordinates.Rectangle;
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
		let scaledBoundingBox = Rectangle(
			boundingBox.lowerLeft * scaleFactor,
			boundingBox.upperRight * scaleFactor
		); /* ? */
		let options = (precision: precision, scaleFactor: scaleFactor);
		let strokeWith = (0.5 / scaleFactor);
		let yTranslation = scaledBoundingBox.height + (2 * scaledBoundingBox.lowerLeft[2]);
		[
			'<svg xmlns="%" width="%" height="%" viewBox="%">'.format(
				[
					'http://www.w3.org/2000/svg',
					scaledBoundingBox.width.decimalStringToScale(1),
					scaledBoundingBox.height.decimalStringToScale(1),
					scaledBoundingBox.asSvgViewBox(
						(
							margin: 5,
							precision: precision
						)
					)
				]
			),
			'<g fill="none" stroke="black" stroke-width="%%" transform="translate(0, %) scale(%, %)">'.format(
				[
					strokeWith.decimalStringToScale(4), '%',
					yTranslation.decimalStringToScale(4),
					scaleFactor.decimalStringToScale(4),
					scaleFactor.negate.decimalStringToScale(4)
				]
			),
			self(options),
			'</g>',
			'</svg>'
		].joinSvg
	}

}

+Float {

	svgArcTo { :rx :ry :xAxisRotation :largeArcFlag :sweepFlag :x :y :precision |
		'A % % % % % %,%'.format(
			[
				rx.decimalStringToScale(precision),
				ry.decimalStringToScale(precision),
				xAxisRotation.decimalStringToScale(precision),
				largeArcFlag.boole.integerString,
				sweepFlag.boole.integerString,
				x.decimalStringToScale(precision),
				y.decimalStringToScale(precision)
			]
		)
	}

}
