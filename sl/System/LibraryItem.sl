/* Requires: Url */

LibraryItem : [Object] { | name url mimeType parser useLocalStorage value |

	key { :self |
		'sl/library/' ++ self.url.hostName ++ self.url.pathName
	}

	readLocalStorage { :self |
		let text = system.localStorage[self.key];
		self.mimeType.caseOfOtherwise([
			'application/json' -> {
				self.parser.value(text.parseJson)
			},
			'text/plain' -> {
				self.parser.value(text)
			}
		]) {
			self.error('readLocalStorage: unsupported mimeType')
		}
	}

	require { :self |
		('LibraryItem>>require' ++ self.name).postLine;
		self.url := self.url.asUrl;
		Promise { :resolve:/1 :reject:/1 |
			self.value.ifNotNil { :answer |
				resolve(answer)
			} {
				system.localStorage.includesKey(self.key).if {
					self.value := self.readLocalStorage;
					resolve(self.value)
				} {
					self.url.fetchMimeType(self.mimeType).thenElse { :answer |
						self.useLocalStorage.ifTrue {
							self.writeLocalStorage(answer)
						};
						self.value := self.parser.value(answer);
						resolve(self.value)
					} { :message |
						reject(message)
					}
				}
			}
		}
	}

	writeLocalStorage { :self :anObject |
		self.mimeType.caseOfOtherwise([
			'application/json' -> {
				system.localStorage[self.key] := anObject.asJson
			},
			'text/plain' -> {
				system.localStorage[self.key] := anObject.asString
			}
		]) {
			self.error('writeLocalStorage: unsupported mimeType')
		}
	}

}

+String {

	LibraryItem { :name :url :mimeType :parser |
		newLibraryItem().initializeSlots(name, url, mimeType, parser, true, nil)
	}

}

+Record {

	asLibraryItem { :self |
		LibraryItem(
			self['name'],
			self['url'],
			self['mimeType'],
			self['parser']
		)
	}

}

+System {

	addLibraryItem { :self :libraryItem |
		self.library.includesKey(libraryItem.name).if {
			self.warning('addLibraryItem: item exists: ' ++ libraryItem.name)
		} {
			self.library[libraryItem.name] := libraryItem
		}
	}

	includesLibraryItem { :self :name |
		self.library.includesKey(name)
	}

	library { :self |
		self.cached('library') {
			()
		}
	}

	libraryItem { :self :name |
		self.library[name].require
	}

	requireLibraryItem { :self :name |
		self.includesLibraryItem(name).if {
			self.libraryItem(name)
		} {
			self.error('@Cache>>requireLibraryItem: does not exist: ' ++ name)
		}
	}

	requireLibraryItems { :self :names |
		name.collect { :each |
			self.requireLibraryItem(each)
		}.Promise
	}

	useLibraryItem { :self :libraryItem |
		let name = libraryItem.name;
		self.includesLibraryItem(name).ifFalse {
			self.addLibraryItem(libraryItem)
		};
		self.requireLibraryItem(name)
	}

}
