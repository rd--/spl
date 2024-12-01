/* Requires: Svg */

LineDrawing : [Object] { | contents |

	asImg { :self |
		let svgText = self.asSvg;
		let svgEncoded = svgText.asciiByteArray.base64Encoded;
		let svgEncodedPretty = svgEncoded.chunksOf(76).unlines;
		'<img src="data:image/svg+xml;base64,\n%\n">'.format([svgEncodedPretty])
	}

	asSvg { :self |
		let height = 100;
		let boundingBox = self.boundingBox.asRectangle;
		let scaleFactor = (height / boundingBox.height).roundTo(0.01);
		let scaledBoundingBox = boundingBox.scaleBy(scaleFactor);
		let items = self.contents.collect(asSvg:/1);
		[
			'<svg xmlns="%" width="%" height="%" viewBox="%">'.format([
				'http://www.w3.org/2000/svg',
				scaledBoundingBox.width,
				scaledBoundingBox.height,
				scaledBoundingBox.asSvgViewBox(5)
			]),
			'<g fill="none" stroke="black" stroke-width="%%" transform="translate(0, %) scale(%, %)">'.format([
				(1 / scaleFactor), '%',
				scaledBoundingBox.height + (2 * scaledBoundingBox.lowerLeft[2]),
				scaleFactor,
				scaleFactor.negated
			]),
			items,
			'</g>',
			'</svg>'
		].flatten.unlines
	}

	boundingBox { :self |
		self.contents.collect(boundingBox:/1).boundingBoxMerging
	}

	draw { :self |
		let fileName = '/tmp/lineDrawing.svg';
		let svgText = self.asSvg;
		fileName.writeTextFile(svgText);
		system.systemCommand('chromium', [fileName])
	}

}

+List {

	LineDrawing { :self |
		newLineDrawing().initializeSlots(self.flatten)
	}

}
