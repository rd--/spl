/* Requires: ColumnBrowser SmallKansas */

+SmallKansas {

	ScalaJiMetaBrowser { :self :meta |
		self.ColumnBrowser(
			'Scala Ji Meta Browser',
			'text/html',
			false, false, [1, 4], nil, nil
		) { :browser :path |
			path.size.caseOf([
				{ 0 } -> {
					meta.keys
				},
				{ 1 } -> {
					meta[path[1]].collect(description:/1)
				},
				{ 2 } -> {
					meta[path[1]].detect { :each |
						each.description = path[2]
					}.htmlView.outerHtml
				}
			])
		}
	}

}

ScalaJiMetaBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.awaitLibraryItems([
			'ScalaTuningArchive',
			'ScalaTuningMetaArchive'
		]) {
			let meta = system.scalaTuningMetaArchive;
			let archive = system.scalaRationalTuningArchive;
			smallKansas.addFrame(
				smallKansas.ScalaJiMetaBrowser(
					meta.collect { :author |
						author.collect { :each |
							archive[each]
						}
					}
				),
				event
			)
		}
	}

}
