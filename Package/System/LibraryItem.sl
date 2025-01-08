/* Requires: Url */

LibraryItem : [Object] { | name url mimeType parser useLocalStorage contents |

	deleteLocalStorage { :self |
		system.localStorage.removeKeyIfAbsent(self.storageKey) { };
		self
	}

	isAcquired { :self |
		let hasContents = self.contents.notNil;
		hasContents | {
			self.isLocal.if {
				self.readLocalStorage;
				true
			} {
				false
			}
		}
	}

	isLocal { :self |
		system.localStorage.includesKey(self.storageKey)
	}

	fetch { :self |
		self.url.asUrl.fetchMimeType(self.mimeType).then { :answer |
			self.useLocalStorage.ifTrue {
				self.writeLocalStorage(answer)
			};
			self.contents := self.parse(answer);
			self.contents
		}
	}

	parse { :self :aString |
		self.parser.value(aString)
	}

	readLocalStorage { :self |
		let text = system.localStorage[self.storageKey];
		let decodedValue = self.mimeType.caseOfOtherwise([
			'application/json' -> {
				self.parse(text.parseJson)
			},
			'text/plain' -> {
				self.parse(text)
			}
		]) {
			self.error('readLocalStorage: unsupported mimeType')
		};
		self.contents := decodedValue
	}

	request { :self |
		Promise { :resolve:/1 :reject:/1 |
			self.contents.ifNotNil { :answer |
				resolve(answer)
			} {
				self.isLocal.if {
					self.readLocalStorage;
					resolve(self.contents)
				} {
					self.fetch.thenElse { :answer |
						resolve(answer)
					} { :message |
						reject(message)
					}
				}
			}
		}
	}

	require { :self |
		self.contents.ifNil {
			self.isLocal.if {
				self.readLocalStorage;
				self.contents
			} {
				self.request;
				self.error('require: item not on shelf, requested')
			}
		}
	}

	storageKey { :self |
		'LibraryItem-' ++ self.url.asString
	}

	writeLocalStorage { :self :anObject |
		let encodedText = self.mimeType.caseOfOtherwise([
			'application/json' -> {
				anObject.asJson
			},
			'text/plain' -> {
				anObject.asString
			}
		]) {
			self.error('writeLocalStorage: invalid mimeType')
		};
		system.localStorage[self.storageKey] := encodedText
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
		let key = libraryItem.name;
		self.library.includesKey(key).ifTrue {
			self.error('addLibraryItem: item exists: ' ++ key)
		};
		self.library[key] := libraryItem
	}

	awaitLibraryItem { :self :name :aBlock:/0 |
		self.requestLibraryItem(name).then { :unused |
			aBlock()
		}
	}

	awaitLibraryItems { :self :names :aBlock:/0 |
		names.collect { :each |
			self.requestLibraryItem(each)
		}.allFulfilled.then { :unused |
			aBlock()
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
		self.library[name]
	}

	requestLibraryItem { :self :name |
		self.library.atIfPresentIfAbsent(name) { :item |
			item.request
		} {
			self.error('requestLibraryItem: does not exist: ' ++ name)
		}
	}

	requestLibraryItems { :self :names |
		names.collect { :each |
			self.requestLibraryItem(each)
		}.Promise
	}

	requireLibraryItem { :self :name |
		self.library.atIfPresentIfAbsent(name) { :item |
			item.require
		} {
			self.error('requireLibraryItem: does not exist: ' ++ name)
		}
	}

}
