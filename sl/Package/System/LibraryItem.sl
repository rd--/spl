(* {"requires": ["Url"]} *)

LibraryItem : [Object] { | name url mimeType parser useLocalStorage value |

	key { :self |
		'sl/library/' ++ self.url.hostname ++ self.url.pathname
	}

	readLocalStorage { :self |
		| text = system.localStorage[self.key]; |
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
		Promise { :resolve:/1 :reject:/1 |
			self.value.ifNotNil { :answer |
				answer.resolve
			} {
				system.localStorage.includesIndex(self.key).if {
					self.value := self.readLocalStorage;
					self.value.resolve
				} {
					system.fetchMimeType(self.url, self.mimeType, ()).thenElse { :answer |
						self.useLocalStorage.ifTrue {
							self.writeLocalStorage(answer)
						};
						self.value := self.parser.value(answer);
						self.value.resolve
					} { :message |
						message.reject
					}
				}
			}
		}
	}

	writeLocalStorage { :self :anObject |
		self.mimeType.caseOfOtherwise([
			'application/json' -> {
				system.localStorage[self.key] := anObject.json
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
		newLibraryItem().initializeSlots(name, url.asUrl, mimeType, parser, true, nil)
	}

}

+@Cache {

	addLibraryItem { :self :libraryItem |
		self.library.includesIndex(libraryItem.name).if {
			self.warning('addLibraryItem: item exists: ' ++ libraryItem.name)
		} {
			self.library[libraryItem.name] := libraryItem
		}
	}

	includesLibraryItem { :self :name |
		self.library.includesIndex(name)
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
		| name = libraryItem.name; |
		self.includesLibraryItem(name).ifFalse {
			self.addLibraryItem(libraryItem)
		};
		self.requireLibraryItem(name)
	}

}
