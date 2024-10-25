HelpIndex : [Object] { | contents |

	fetch { :self :path |
		path.ifNotNil {
			let url = self.url(path[1], path[2]);
			self.notify('fetch: ' ++ path.join('/'));
			url.fetchTextWithDefault('*Fetch Failed*')
		}
	}

	fetchFor { :self :topic |
		self.fetch(self.find(topic))
	}

	find { :self :topic |
		self.contents.detectIfNone { :each |
			each.second = topic
		} {
			self.warning('HelpIndex>>find: no help for: ' ++ topic);
			nil
		}
	}

	kind { :self |
		['Guide', 'Reference']
	}

	names { :self :kind |
		self.contents.select { :each |
			each.first = kind
		}.collect(second:/1).sorted
	}

	url { :self :kind :name |
		[
			'./lib/spl/help/',
			kind,
			'/',
			name,
			'.help.sl'
		].join('')
	}

}

+String {

	HelpIndex { :self |
		newHelpIndex().initializeSlots(
			self.lines.select(notEmpty:/1).collect { :each |
				let [kind, name] = each.replaceString('.help.sl', '').splitBy('/');
				[kind, name]
			}
		)
	}

}

+@Cache {

	helpIndex { :self |
		self.useLibraryItem(
			LibraryItem(
				'helpIndex',
				'https://rohandrape.net/sw/spl/help/Index.text',
				'text/plain',
				HelpIndex:/1
			)
		)
	}

}
