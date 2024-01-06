HelpIndex : [Object] { | contents |

	areas { :self |
		['Language', 'SmallKansas', 'SuperCollider']
	}

	fetch { :self :path |
		path.ifNotNil {
			let url = self.url(path[1], path[2], path[3]);
			self.notify('fetch: ' ++ path.joinSeparatedBy('/'));
			system.fetchString(url, (cache: 'no-cache'), { '*Fetch Failed*' })
		}
	}

	fetchFor { :self :topic |
		self.fetch(self.find(topic))
	}

	find { :self :topic |
		self.contents.detectIfNone { :each |
			each.third = topic
		} {
			self.warning('find: no help for: ' ++ topic);
			nil
		}
	}

	kind { :self :area |
		['Guide', 'Reference']
	}

	names { :self :area :kind |
		self.contents.select { :each |
			each.first = area & {
				each.second = kind
			}
		}.collect(third:/1).copyWithoutDuplicates.sort
	}

	url { :self :area :kind :name |
		['./lib/spl/help/', area, '/', kind, '/', name, '.help.sl'].join
	}

}

+String {

	HelpIndex { :self |
		newHelpIndex().initializeSlots(
			self.lines.select(notEmpty:/1).collect { :each |
				let [spl, help, area, kind, name] = each.replaceString('.help.sl', '').splitBy('/');
				[area, kind, name]
			}
		)
	}

}

+@Cache {

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
