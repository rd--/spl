LineDrawing : [Object] { | contents metadata |

	asImg { :self |
		let svgText = self.asSvg;
		let svgEncoded = svgText.asciiByteArray.base64Encode;
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
		let fragmentList = self.contents.collect { :each |
			{ :options |
				each.svgFragment(options)
			}
		};
		let height = self.metadata['height'];
		let boundingCoordinates = self.boundingBox;
		scaledFragments(fragmentList, height, boundingCoordinates)
	}

	boundingBox { :self |
		self.contents.collect(boundingBox:/1).boundingBoxMerging
	}

	drawing { :self |
		self.asSvg
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

+List {

	circularPartitionsDrawing { :self |
		let radius = 1;
		let circleCount = self.size + 1;
		let period = self.anyOne.sum;
		let innerCircle = [period];
		let places = [
			[innerCircle],
			self
		].catenate.collect(prefixSum:/1);
		let angles = places.collect { :p |
			p.collect { :q |
				((q / period).negate * 2.pi + 0.5.pi) % 2.pi
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
