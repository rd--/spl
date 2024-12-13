+Graph {

	drawing { :self :scale :derivePoint:/1 |
		let lineWidth = 1;
		let points = self.vertexLabels.collect(derivePoint:/1) * 80;
		let bbox = points.computeBoundingBox.scaleBy(scale);
		let dots = points.collect { :each |
			let [x, y] = each;
			'circle'.createSvgElement(
				cx: x,
				cy: y,
				r: lineWidth * 2,
				fill: 'black'
			)
		};
		let lines = self.edgeList.collect { :each |
			let [i, j] = each;
			let [x1, y1] = points[i];
			let [x2, y2] = points[j];
			'line'.createSvgElement(
				x1: x1,
				y1: y1,
				x2: x2,
				y2: y2,
				stroke: 'black',
				'stroke-width': lineWidth
			)
		};
		let svg = 'svg'.createSvgElement(
			width: bbox.width,
			height: bbox.height,
			viewBox: bbox.asSvgViewBox(margin: 5, precision: 1),
			preserveAspectRatio: 'xMidYMid meet' /* Default value */
		);
		let group = 'g'.createSvgElement(
			transform: [
				'translate(0, %)'.format([
					bbox.height + (2 * bbox.lowerLeft[2])
				]),
				'scale(%, %)'.format([
					scale, 0 - scale
				])
			].join(' ')
		);
		group.appendChildren(dots);
		group.appendChildren(lines);
		svg.appendChild(group);
		svg
	}

}

+RatioTuning {

	htmlView { :self |
		let ratios = self.asRatios;
		let primesVector = self.latticeDerivedPrimesVector([3 5 7 11 13 17 19 23]);
		let div = 'div'.createElement;
		div.appendChildren([
			[
				['Size', self.size.asString],
				['Limit', self.limit.asString],
				['Description', self.description],
				['Octave', self.octave.asString],
				['Primes', self.latticePrimes(false).asString]
			].asHtmlTable,
			primesVector.ifNil {
				'No drawing'.TextParagraph
			} {
				self.latticeDrawing(
					primesVector,
					1.gradyLatticeCoordinates
				)
			},
			[
				[1 .. self.size],
				ratios,
				ratios.collect { :each |
					primesVector.ifNil {
						'*'
					} {
						each.latticeVectorString(primesVector)
					}
				},
				self.asCents.rounded,
				self.asIntegers
			].transposed.asHtmlTable
		]);
		div
	}

	latticeDrawing { :self :primes :unitVector |
		self.latticeGraph(primes, unitVector).drawing(1, identity:/1)
	}

}

+SmallKansas {

	ScalaJiTuningBrowser { :self :jiTunings |
		let sizes = jiTunings.collect(size:/1).values.copyWithoutIdenticalElements.sort.collect(asString:/1);
		let selectedSize = nil;
		let selectedLimit = nil;
		self.ColumnBrowser('Scala Ji Tuning Browser', 'text/html', false, true, [1, 1, 4], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('Size/Limit/Name');
					sizes
				},
				1 -> {
					browser.setStatus('Size = ' ++ path[1]);
					selectedSize := path[1].parseInteger(10);
					jiTunings.select { :each |
						each.size = selectedSize
					}.collect { :each |
						each.limit
					}.values.copyWithoutIdenticalElements.sort.collect(asString:/1)
				},
				2 -> {
					browser.setStatus(
						[
							'Size = ', path[1], ', ',
							'Limit = ', path[2]
						].stringJoin
					);
					selectedLimit := path[2].parseInteger(10);
					jiTunings.select { :each |
						each.size = selectedSize & {
							each.limit = selectedLimit
						}
					}.indices
				},
				3 -> {
					let jiTuning = jiTunings[path[3]];
					browser.setStatus(jiTuning.description);
					jiTuning.htmlView.outerHtml
				}
			])
		}
	}

}

ScalaJiTuningBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.awaitLibraryItems([
			'Music/Tuning/CategorizedTuningArchive',
			'Music/Tuning/ScalaTuningArchive'
		]) {
			let tuningList = system.scalaRationalTuningArchive;
			smallKansas.addFrame(
				smallKansas.ScalaJiTuningBrowser(tuningList),
				event
			)
		}
	}

}
