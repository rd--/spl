+SmallKansas {

	ScalaScaleBrowser { :self :scalaModenam |
		let sizes = scalaModenam.collect(size:/1).copyWithoutDuplicates.sort.collect(asString:/1);
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
					}.copyWithoutDuplicates.sort.collect(asString:/1)
				},
				2 -> {
					browser.setStatus(['Size = ', path[1], ', TuningSize = ', path[2]].join);
					selectedTuningSize := path[2].parseInteger(10);
					scalaModenam.select { :each |
						each.size = selectedSize & {
							each.tuningSize = selectedTuningSize
						}
					}.collect(description:/1)
				},
				3 -> {
					| modenam |
					browser.setStatus(path[3]);
					modenam := scalaModenam.detect { :each |
						each.description = path[3]
					};
					[modenam.printString, modenam.tuningIndices.printString].unlines
				}
			])
		}
	}

}

+@Cache {

	scalaModenam { :self |
		self.useLibraryItem(
			LibraryItem(
				'scalaModenam',
				'https://rohandrape.net/sw/hmt/data/json/scala-modenam.json',
				'application/json',
				{ :item |
					item.collect { :each |
						let [zeroIndexedStartIndex, intervals, description] = each;
						Scale(zeroIndexedStartIndex + 1, intervals, description)
					}
				}
			)
		)
	}

}

ScalaScaleBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.scalaModenam.then { :scalaModenam |
			smallKansas.addFrame(smallKansas.ScalaScaleBrowser(scalaModenam), event)
		}
	}

}
