/* Requires: ColumnBrowser SmallKansas */

+SmallKansas {

	ScalaJiMetaBrowser { :self :jiMeta |
		self.ColumnBrowser(
			'Scala Ji Meta Browser',
			'text/html',
			false, false, [1, 4], nil, nil
		) { :browser :path |
			path.size.caseOf([
				0 -> {
					jiMeta.indices
				},
				1 -> {
					jiMeta[path[1]].collect(description:/1)
				},
				2 -> {
					jiMeta[path[1]].detect { :each |
						each.description = path[2]
					}.htmlView.outerHtml
				}
			])
		}
	}

}

+@Cache {

	jiMeta { :self |
		self.jiScala.then { :jiScala |
			self.requireLibraryItem('jiMeta')
		}
	}

}

ScalaJiMetaBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.jiMeta.then { :jiMeta |
			smallKansas.addFrame(smallKansas.ScalaJiMetaBrowser(jiMeta), event)
		}
	}

}

LibraryItem(
	name: 'jiMeta',
	url: 'https://rohandrape.net/sw/hmt/data/json/scala-meta-au.json',
	mimeType: 'application/json',
	parser: { :libraryItem |
		libraryItem.collect { :each |
			each.collect { :aName |
				jiScala[aName]
			}.select(notNil:/1)
		}
	}
)
