+RatioTuning {

	htmlView { :self |
		let ratios = self.asRatios;
		let primesVector = self.tuningLatticeDerivedPrimesVector([3 5 7 11 13 17 19 23]);
		let div = 'div'.createElement;
		let overviewTable = Table(
			[
				['Size', self.size.asString],
				['Limit', self.primeLimit.asString],
				['Description', self.description],
				['Octave', self.octave.asString],
				['Primes', self.tuningLatticePrimes(false).asString]
			]
		);
		let tuningTable = Table(
			[
				[1 .. self.size],
				ratios,
				ratios.collect { :each |
					primesVector.ifNil {
						'*'
					} {
						each.tuningLatticeVectorString(primesVector)
					}
				},
				self.asCents.round,
				self.asIntegers
			].transpose
		);
		div.appendChildren(
			[
				system.window.document.parseHtml(overviewTable.asHtml),
				primesVector.ifNil {
					'No drawing'.TextParagraph
				} {
					self.tuningLatticeDrawing(
						primesVector,
						1.gradyTuningLatticeCoordinates
					)
				},
				system.window.document.parseHtml(tuningTable.asHtml)
			]
		);
		div
	}

	tuningLatticeDrawing { :self :primes :unitVector |
		self.tuningLatticeGraph(
			primes,
			unitVector
		).asSvgElement(
			1,
			{ :each | each * 80 }
		)
	}

}

+SmallKansas {

	ScalaJiTuningBrowser { :self :jiTunings |
		let sizes = jiTunings.collect(size:/1).values.copyWithoutIdenticalElements.sort.collect(asString:/1);
		let selectedSize = nil;
		let selectedLimit = nil;
		self.ColumnBrowser('Scala Ji Tuning Browser', 'text/html', false, true, [1, 1, 4], nil, nil) { :browser :path |
			path.size.caseOf(
				[
					0 -> {
						browser.setStatus('Size/Limit/Name');
						sizes
					},
					1 -> {
						browser.setStatus('Size = ' ++ path[1]);
						selectedSize := path[1].parseSmallInteger(10);
						jiTunings.select { :each |
							each.size = selectedSize
						}.collect { :each |
							each.primeLimit
						}.values.copyWithoutIdenticalElements.sort.collect(asString:/1)
					},
					2 -> {
						browser.setStatus(
							[
								'Size = ', path[1], ', ',
								'Limit = ', path[2]
							].stringJoin
						);
						selectedLimit := path[2].parseSmallInteger(10);
						jiTunings.select { :each |
							each.size = selectedSize & {
								each.primeLimit = selectedLimit
							}
						}.indices
					},
					3 -> {
						let jiTuning = jiTunings[path[3]];
						browser.setStatus(jiTuning.description);
						jiTuning.htmlView.outerHtml
					}
				]
			)
		}
	}

}

ScalaJiTuningBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.awaitLibraryItem(
			'ScalaTuningArchive'
		) {
			let tuningList = system.scalaRationalTuningArchive;
			smallKansas.addFrame(
				smallKansas.ScalaJiTuningBrowser(tuningList),
				event
			)
		}
	}

}
