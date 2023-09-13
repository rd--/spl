+HelpSystem {

	programAuthors { :self :category |
		self.programIndex.select { :each |
			each[1] = category
		}.collect(second:/1).Set.Array.sorted
	}

	ProgramBrowser { :self :path |
		ColumnBrowser(
			'Program Browser',
			'text/plain',
			false,
			false,
			[1, 1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						self.programCategories
					},
					1 -> {
						self.programAuthors(path[1])
					},
					2 -> {
						self.programNames(path[1], path[2])
					},
					3 -> {
						self.programFetch(path[1], path[2], path[3])
					}
				])
			}
		).setPath(path)
	}

	ProgramBrowser { :self |
		self.ProgramBrowser([])
	}

	programCategories { :self |
		self.programIndex.collect(first:/1).Set.Array.sorted.reject { :each |
			each = 'collect'
		}
	}

	programFetch { :self :category :author :name |
		| url = ['./lib/stsc3/help/', category, '/', author, ' - ', name, '.sl'].join; |
		system.window.fetchString(url, (cache: 'no-cache'))
	}

	programNames { :self :category :author |
		self.programIndex.select { :each |
			each[1] = category & {
				each[2] = author
			}
		}.collect(third:/1).sorted
	}

}

ProgramBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.getHelp { :help |
			smallKansas.addFrame(help.ProgramBrowser, event)
		}
	}

}
