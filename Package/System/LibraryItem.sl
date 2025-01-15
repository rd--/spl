/* Requires: CacheStorage, Url */

LibraryItem : [Object] { | name category url mimeType parser contents |

	cachedFetch { :self |
		self.url.asUrl.cachedFetchMimeType('SplLibraryItems', self.mimeType).thenElse { :answer |
			self.contents := self.parse(answer);
			system.cache[self.name] := self.contents;
			self.contents
		} { :reason |
			self.error(reason)
		}
	}

	parse { :self :aString |
		self.parser.value(aString)
	}

	request { :self |
		Promise { :resolve:/1 :reject:/1 |
			self.contents.ifNotNil { :answer |
				resolve(answer)
			} {
				self.cachedFetch.thenElse { :answer |
					resolve(answer)
				} { :message |
					reject(message)
				}
			}
		}
	}

	require { :self |
		self.contents.ifNil {
			self.request;
			self.error('require: item not on shelf, requested')
		}
	}

}

+String {

	LibraryItem { :name :category :url :mimeType :parser |
		newLibraryItem().initializeSlots(name, category, url, mimeType, parser, nil)
	}

}

+Record {

	asLibraryItem { :self |
		LibraryItem(
			self['name'],
			self['category'],
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
		self.library[key] := libraryItem;
		libraryItem.cachedFetch;
		libraryItem
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
