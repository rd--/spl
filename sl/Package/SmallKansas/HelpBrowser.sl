HelpIndex : [Object] { | contents |

	areas { :self |
		['spl', 'sc', 'sk']
	}

	fetch { :self :path |
		path.ifNotNil {
			| url = self.url(path[1], path[2], path[3]); |
			self.notify('fetch: ' ++ path.joinSeparatedBy('/'));
			system.window.fetchString(url, (cache: 'no-cache'))
		}
	}

	fetchFor { :self :subject |
		self.fetch(self.find(subject))
	}

	find { :self :name |
		self.contents.detectIfNone { :each |
			each.third = name
		} {
			self.warning('find: no help for: ' ++ name);
			nil
		}
	}

	HelpBrowser { :self |
		ColumnBrowser(
			'Help Browser',
			'text/markdown',
			false,
			false,
			[1, 1, 3],
			nil,
			nil,
			{ :browser :path |
				path.size.caseOf([
					0 -> {
						self.areas
					},
					1 -> {
						self.kind(path[1])
					},
					2 -> {
						self.names(path[1], path[2])
					},
					3 -> {
						self.fetch(path)
					}
				])
			}
		)
	}

	kind { :self :area |
		['doc', 'help']
	}

	names { :self :area :kind |
		self.contents.select { :each |
			each.first = area & {
				each.second = kind
			}
		}.collect(third:/1).withoutDuplicates.sort
	}

	project { :self :area |
		area.caseOf([
			'sc' -> { 'stsc3' },
			'sk' -> { 'spl' },
			'spl' -> { 'spl' }
		])
	}

	url { :self :area :kind :name |
		['./lib/', self.project(area), '/', kind, '/', area, '/', name, '.help.sl'].join
	}

}

+String {

	HelpIndex { :self |
		newHelpIndex().initializeSlots(
			self.lines.select(notEmpty:/1).collect { :each |
				| [kind, area, name] = each.replaceString('.help.sl', '').splitRegExp(RegExp('/')); |
				[area, kind, name]
			}
		)
	}

}

+SmallKansas {

	helpFor { :self :subject :event |
		self.helpIndex.then { :helpIndex |
			helpIndex.fetchFor(subject).then { :aString |
				self.addFrame(
					TextEditor('HelpViewer', 'text/markdown', aString),
					event
				)
			}
		}
	}

	helpIndex { :self |
		self.useLibraryItem(
			LibraryItem(
				'helpIndex',
				'https://rohandrape.net/sw/jssc3/text/smallhours-help.text',
				'text/plain',
				HelpIndex:/1
			)
		)
	}

}

HelpBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.helpIndex.then { :helpIndex |
			smallKansas.addFrame(helpIndex.HelpBrowser, event)
		}
	}

}
