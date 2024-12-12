/* Requires: ColumnBrowser SmallKansas */

+SmallKansas {

	SuperColliderProgramBrowser { :self :index :path |
		self.ColumnBrowser(
			'SuperCollider Program Browser',
			'text/plain',
			false,
			false,
			[1, 1, 3],
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
							'./lib/spl/Program/SuperCollider/',
							category,
							'/',
							author,
							' - ',
							name,
							'.play.sl'
						].join('');
						url.fetchTextWithDefault('*Fetch failed*')
					}
				])
			}
		).setPath(path)
	}

	SuperColliderProgramBrowser { :self :index |
		self.SuperColliderProgramBrowser(index, [])
	}

}

SuperColliderProgramBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		system.superColliderProgramIndex.then { :superColliderProgramIndex |
			smallKansas.addFrame(smallKansas.SuperColliderProgramBrowser(superColliderProgramIndex), event)
		}
	}

}
