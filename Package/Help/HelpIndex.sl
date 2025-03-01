HelpIndex : [Object] { | contents |

	fetch { :self :path |
		path.ifNotNil {
			let url = self.urlFor(path[1], path[2]);
			self.notify('fetch: ' ++ path.stringIntercalate('/'));
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
		['Guide', 'Reference', 'Terse']
	}

	names { :self :kind |
		self.contents.select { :each |
			each.first = kind
		}.collect(second:/1).sorted
	}

	urlFor { :self :kind :name |
		[
			'./lib/spl/Help/',
			kind,
			'/',
			name,
			'.help.sl'
		].stringCatenate
	}

	size { :self |
		self.contents.size
	}

}

+List {

	HelpIndex { :self |
		newHelpIndex().initializeSlots(self)
	}

}

+System {

	helpIndex { :self |
		self.requireLibraryItem('HelpIndex')
	}

}

LibraryItem(
	name: 'HelpIndex',
	category: 'System/Help',
	url: 'https://rohandrape.net/sw/spl/Help/Index.text',
	mimeType: 'text/plain',
	parser: { :text |
		text
		.lines
		.select(notEmpty:/1)
		.collect { :each |
			let [kind, name] = each.replaceString('.help.sl', '').splitBy('/');
			[kind, name]
		}
		.HelpIndex
	}
)
