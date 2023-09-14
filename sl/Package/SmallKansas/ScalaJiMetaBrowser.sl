+Record {

	ScalaJiMetaBrowser { :self |
		ColumnBrowser('Scala Ji Meta Browser', 'text/html', false, false, [1, 4], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					self.indices
				},
				1 -> {
					self[path[1]].collect(description:/1)
				},
				2 -> {
					self[path[1]].detect { :each |
						each.description = path[2]
					}.htmlView.outerHTML
				}
			])
		}
	}

}

+SmallKansas {

	jiMeta { :self |
		self.useLibraryItem(
			LibraryItem(
				'jiMeta',
				'https://rohandrape.net/sw/hmt/data/json/scala-meta-au.json',
				'application/json',
				{ :item |
					system.requireLibraryItem('jiScala').then { :jiScala |
						item.collect { :anArray |
							anArray.collect { :aName |
								jiScala[aName]
							}.select(notNil:/1)
						}
					}
				}
			)
		)
	}

}

ScalaJiMetaBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.jiMeta.then { :jiMeta |
			smallKansas.addFrame(jiMeta.ScalaJiMetaBrowser, event)
		}
	}

}
