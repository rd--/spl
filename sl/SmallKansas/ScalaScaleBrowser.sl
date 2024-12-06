+SmallKansas {

	ScalaScaleBrowser { :self :scalaModenam |
		let sizes = scalaModenam.collect(size:/1).copyWithoutIdenticalElements.sort.collect(asString:/1);
		let selectedSize = nil;
		let selectedTuningSize = nil;
		self.ColumnBrowser('Scala Scale Browser', 'text/plain', false, true, [1, 1, 4], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('Size/TuningSize/Name');
					sizes
				},
				1 -> {
					browser.setStatus('Size = ' ++ path[1]);
					selectedSize := path[1].parseInteger(10);
					scalaModenam.select { :each |
						each.size = selectedSize
					}.collect { :each |
						each.tuningSize
					}.copyWithoutIdenticalElements.sort.collect(asString:/1)
				},
				2 -> {
					browser.setStatus(
						[
							'Size = ', path[1], ', ',
							'TuningSize = ', path[2]
						].stringJoin
					);
					selectedTuningSize := path[2].parseInteger(10);
					scalaModenam.select { :each |
						each.size = selectedSize & {
							each.tuningSize = selectedTuningSize
						}
					}.collect(description:/1)
				},
				3 -> {
					let modenam = scalaModenam.detect { :each |
						each.description = path[3]
					};
					browser.setStatus(path[3]);
					[
						modenam.printString,
						modenam.tuningIndices.printString
					].unlines
				}
			])
		}
	}

}

+@Cache {

	scalaModenam { :self |
		system.requestLibraryItem('Music/Scales/ScalaModeNames')
	}

}

ScalaScaleBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.scalaModenam.then { :scalaModenam |
			smallKansas.addFrame(smallKansas.ScalaScaleBrowser(scalaModenam), event)
		}
	}

}

LibraryItem(
	name: 'Music/Scales/ScalaModeNames',
	url: 'https://rohandrape.net/sw/hmt/data/json/scala-modenam.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			let [zeroIndexedStartIndex, intervals, description] = each;
			Scale(zeroIndexedStartIndex + 1, intervals, description)
		}
	}
)
