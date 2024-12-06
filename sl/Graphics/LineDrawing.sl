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
		let yRange = boundingBox.height;
		let precision = (3 - yRange.log10.rounded).max(0).also { :x | ['RANGE/PREC', yRange, x].postLine };
		let scaleFactor = (height / boundingBox.height);
		let scaledBoundingBox = boundingBox.scaleBy(scaleFactor);
		let options = (precision: precision, scaleFactor: scaleFactor);
		let items = self.contents.collect { :each | each.forSvg(options) };
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
				scaleFactor.negated.printStringToFixed(4)
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

	asLineDrawing { :self |
		self.Line.asLineDrawing
	}

	LineDrawing { :self |
		newLineDrawing().initializeSlots(self.flatten)
	}

}

+[Circle, Line, Point, PointCloud, Polygon, Rectangle, Writing] {

	asLineDrawing { :self |
		[self].LineDrawing
	}

}

+Promise {

	draw { :self |
		self.thenElse { :result |
			result.draw
		} { :err |
			self.error('draw: ' ++ err)
		}
	}

}
