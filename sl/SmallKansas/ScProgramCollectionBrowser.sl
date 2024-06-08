ScProgramCollectionIndex : [Object] { | contents |
}

+SmallKansas {

	ScProgramCollectionBrowser { :self :index :path |
		self.ColumnBrowser(
			'Sc Program Collection Browser',
			'text/plain',
			false,
			false,
			[1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						index.categories
					},
					1 -> {
						index.authors(path[1])
					},
					2 -> {
						index.names(path[1], path[2])
					},
					3 -> {
						let [category, author, name] = path @* [1, 2, 3];
						let url = [
							'./lib/spl/help/',
							category,
							'/',
							author,
							' - ',
							name,
							'.sl'
						].join;
						url.fetchTextWithDefault('*Fetch failed*')
					}
				])
			}
		).setPath(path)
	}

	ScProgramBrowser { :self :index |
		self.ScProgramBrowser(index, [])
	}

}

ScProgramCollectionBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.scProgramCollectionIndex.then { :scProgramIndex |
			smallKansas.addFrame(smallKansas.ScProgramBrowser(scProgramIndex), event)
		}
	}

}
