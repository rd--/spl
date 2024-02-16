{- Requires: ColumnBrowser SmallKansas -}

ScProgramIndex : [Object] { | contents |

	atRandom { :self |
		self.contents.atRandom
	}

	authors { :self :category |
		self.contents.select { :each |
			each[1] = category
		}.collect(second:/1).copyWithoutIdenticalElements.sort
	}

	categories { :self |
		self.contents.collect(first:/1).copyWithoutIdenticalElements.sort.reject { :each |
			each = 'collect'
		}
	}

	names { :self :category :author |
		self.contents.select { :each |
			each[1] = category & {
				each[2] = author
			}
		}.collect(third:/1).sort
	}

}

+String {

	ScProgramIndex { :self |
		newScProgramIndex().initializeSlots(
			self.lines.select(notEmpty:/1).collect { :each |
				each.replaceString('.sl', '').splitByRegExp(RegExp(' - |/'))
			}
		)
	}

}

+@Cache {

	scProgramIndex { :self |
		self.useLibraryItem(
			LibraryItem(
				'scProgramIndex',
				'https://rohandrape.net/sw/jssc3/text/SmallHoursPrograms.text',
				'text/plain',
				ScProgramIndex:/1
			)
		)
	}

}

+SmallKansas {

	ScProgramBrowser { :self :index :path |
		self.ColumnBrowser(
			'Sc Program Browser',
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
							'./lib/spl/help/SuperCollider/',
							category,
							'/',
							author,
							' - ',
							name,
							'.sl'
						].join;
						system.fetchString(
							url,
							(cache: 'no-cache'),
							{ '*Fetch failed*' }
						)
					}
				])
			}
		).setPath(path)
	}

	ScProgramBrowser { :self :index |
		self.ScProgramBrowser(index, [])
	}

}

ScProgramBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.scProgramIndex.then { :scProgramIndex |
			smallKansas.addFrame(smallKansas.ScProgramBrowser(scProgramIndex), event)
		}
	}

}
