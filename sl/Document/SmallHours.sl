SmallHours : [Object] { | helpIndex programIndex |

	helpAreas { :self |
		['spl', 'sc', 'sk']
	}

	helpKind { :self :area |
		['doc', 'help']
	}

	helpBrowser { :self |
		ColumnBrowser(
			'Help Browser',
			true,
			[1, 1, 3],
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						self.helpAreas
					},
					1 -> {
						self.helpKind(path[1])
					},
					2 -> {
						self.helpNames(path[1], path[2])
					},
					3 -> {
						self.helpFetch(path)
					}
				])
			}
		)
	}

	helpFetch { :self :path |
		path.ifNotNil {
			('SmallHours>>helpFetch: ' ++ path.joinSeparatedBy('/')).postLine;
			system.window.fetchString(self.helpUrl(path[1], path[2], path[3]), (cache: 'no-cache'))
		}
	}


	helpFind { :self :name |
		self.helpIndex.detectIfNone { :each |
			each[3] = name
		} {
			('SmallHours>>helpFind: no help for: ' ++ name).postLine;
			nil
		}
	}

	helpFor { :self :subject |
		self.helpFetch(self.helpFind(subject))
	}

	helpNames { :self :area :kind |
		self.helpIndex.select { :each |
			each[1] = area & {
				each[2] = kind
			}
		}.collect(third:/1).IdentitySet.Array.sorted
	}

	helpParse { :self :aString |
		| [kind, area, name] = aString.replace('.help.sl', '').splitRegExp(RegExp('/')); |
		[area, kind, name]
	}

	helpProject { :self :area |
		area.caseOf([
			'sc' -> { 'stsc3' },
			'sk' -> { 'spl' },
			'spl' -> { 'spl' }
		])
	}

	helpUrl { :self :area :kind :name |
		['./lib/', self.helpProject(area), '/', kind, '/', area, '/', name, '.help.sl'].join
	}

	loadHelpIndex { :self |
		system.window.fetchString('./text/smallhours-help.text', (cache: 'no-cache')).then { :aString |
			self.helpIndex := aString.lines.select(notEmpty:/1).collect { :each |
				self.helpParse(each)
			}
		}
	}

	loadProgramIndex { :self |
		system.window.fetchString('./text/smallhours-programs.text', (cache: 'no-cache')).then { :aString |
			self.programIndex := aString.lines.select(notEmpty:/1).collect { :each |
				self.programParse(each)
			}
		}
	}

	programAuthors { :self :category |
		self.programIndex.select { :each |
			each[1] = category
		}.collect(second:/1).IdentitySet.Array.sorted
	}

	programBrowser { :self |
		ColumnBrowser(
			'Program Browser',
			false,
			[1, 1, 3],
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
		)
	}

	programCategories { :self |
		self.programIndex.collect(first:/1).IdentitySet.Array.sorted.reject { :each |
			each = 'collect'
		}
	}

	programFetch { :self :category :author :name |
		system.window.fetchString(self.programUrl(category, author, name), (cache: 'no-cache'))
	}

	programNames { :self :category :author |
		self.programIndex.select { :each |
			each[1] = category & {
				each[2] = author
			}
		}.collect(third:/1).IdentitySet.Array.sorted
	}

	programParse { :self :aString |
		aString.replace('.sl', '').splitRegExp(RegExp(' - |/'))
	}

	programUrl { :self :category :author :name |
		['./lib/stsc3/help/', category, '/', author, ' - ', name, '.sl'].join
	}

}

+ Void {

	SmallHours {
		newSmallHours()
	}

}
