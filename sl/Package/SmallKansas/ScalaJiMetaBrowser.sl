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

	ScalaJiMetaBrowser { :self :event |
		system.requireLibraryItem('jiMeta').then { :jiMeta |
			self.addFrame(jiMeta.ScalaJiMetaBrowser, event)
		}
	}

}
