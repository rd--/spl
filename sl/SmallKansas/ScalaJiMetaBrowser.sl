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

ScalaJiMetaBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.jiMeta.then { :jiMeta |
			smallKansas.addFrame(
				smallKansas.ScalaJiMetaBrowser(jiMeta),
				event
			)
		}
	}

}
