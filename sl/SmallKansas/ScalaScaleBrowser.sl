+SmallKansas {

	ScalaScaleBrowser { :self :scalaModenam |
		|(
			degrees = scalaModenam.collect(degree:/1).withoutDuplicates.sort.collect(asString:/1),
			selectedDegree = nil,
			selectedTuningDegree = nil
		)|
		self.ColumnBrowser('Scala Scale Browser', 'text/plain', false, true, [1, 1, 4], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('Degree/TuningDegree/Name');
					degrees
				},
				1 -> {
					browser.setStatus('Degree = ' ++ path[1]);
					selectedDegree := path[1].parseInteger(10);
					scalaModenam.select { :each |
						each.degree = selectedDegree
					}.collect { :each |
						each.tuningDegree
					}.withoutDuplicates.sort.collect(asString:/1)
				},
				2 -> {
					browser.setStatus(['Degree = ', path[1], ', TuningDegree = ', path[2]].join);
					selectedTuningDegree := path[2].parseInteger(10);
					scalaModenam.select { :each |
						each.degree = selectedDegree & {
							each.tuningDegree = selectedTuningDegree
						}
					}.collect(description:/1)
				},
				3 -> {
					browser.setStatus(path[3]);
					scalaModenam.detect { :each |
						each.description = path[3]
					}.printString
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
					item.collect(Scale:/1)
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
