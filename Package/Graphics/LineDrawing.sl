/* Requires: CrystalStructure Svg */

LineDrawing : [Object] { | contents metadata |

	asImg { :self |
		let svgText = self.asSvg;
		let svgEncoded = svgText.asciiByteArray.base64Encoded;
		let svgEncodedPretty = svgEncoded.chunksOf(76).unlines;
		'<img src="data:image/svg+xml;base64,\n%\n">'.format([svgEncodedPretty])
	}

	asObjectUrl { :self |
		self
		.asSvg
		.utf8ByteArray
		.asBlob(
			(type: 'image/svg+xml')
		).createObjectUrl
	}

	asSvg { :self |
		let height = self.metadata['height'];
		let actualBoundingBox = self.boundingBox.asRectangle;
		let boundingBox = actualBoundingBox.height.isZero.if {
			Rectangle(
				actualBoundingBox.lowerLeft,
				[actualBoundingBox.right, actualBoundingBox.lower + 1]
			)
		} {
			actualBoundingBox
		};
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
		let fileName = '/tmp/LineDrawing.svg';
		let svgText = self.asSvg;
		fileName.writeTextFile(svgText);
		system.systemCommand('chromium', [fileName])
	}

}

+List {

	asLineDrawing { :self |
		self.isMatrix.if {
			let [m, n] = self.shape;
			(n = 2).if {
				self.Line.asLineDrawing
			} {
				self.error('asLineDrawing')
			}
		} {
			LineDrawing(self)
		}
	}

	LineDrawing { :self :options |
		newLineDrawing().initializeSlots(
			self.flatten,
			options
		)
	}

	LineDrawing { :self |
		self.LineDrawing(height: 100)
	}

}

+[Circle, Line, Point, PointCloud, Polygon, Rectangle, Triangle, Writing] {

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

+List {

	circularPartitionsDrawing { :self |
		let radius = 1;
		let circleCount = self.size + 1;
		let period = self.anyOne.sum;
		let innerCircle = [period];
		let places = [
			[innerCircle],
			self
		].concatenation.collect(prefixSum:/1);
		let angles = places.collect { :p |
			p.collect { :q |
				((q / period).negated * 2.pi + 0.5.pi) % 2.pi
			}
		};
		let circles = (1 .. circleCount).collect { :each |
			Circle([0 0], each * radius)
		};
		let lines = (1 .. circleCount).collect { :each |
			let innerRadius = each - 1 * radius;
			let outerRadius = each * radius;
			angles[each].collect { :theta |
				[innerRadius theta; outerRadius theta]
				.fromPolarCoordinates
				.Line
			}
		};
		[circles, lines].LineDrawing
	}

	rectangularPartitionsDrawing { :self |
		let rowHeight = 10;
		let rowCount = self.size;
		let columnWidth = rowHeight * rowCount * 2.goldenRatio;
		let height = rowCount * rowHeight;
		let period = self.anyOne.sum;
		let places = self.collect(prefixSum:/1);
		let marks = places.collect { :p |
			p.collect { :q |
				q * (columnWidth / period)
			}
		};
		let horizontalLines = (0 .. rowCount).collect { :each |
			let y = each * rowHeight;
			Line([0 y; columnWidth y])
		};
		let leftmostVerticalLine = Line([0 0; 0 height]);
		let verticalLines = (1 .. rowCount).collect { :each |
			let y1 = height - (each * rowHeight);
			let y2 = height - (each - 1 * rowHeight);
			marks[each].collect { :x |
				Line([x y1; x y2])
			}
		};
		[
			horizontalLines,
			leftmostVerticalLine,
			verticalLines
		].LineDrawing
	}

}

+[CrystalStructure, Polyhedron] {

	asPerspectiveDrawing { :self |
		self.asPerspectiveDrawing(
			AxonometricProjection(
				pi / 6, 0,
				1, 1, 1 / 2
			).asBlock
		)
	}

}
