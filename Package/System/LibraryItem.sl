/* Requires: CacheStorage, Url */

LibraryItem : [Object] { | name category url mimeType parser unparsedContents parsedContents |

	cachedFetch { :self |
		self.url.asUrl.cachedFetchMimeType('SplLibraryItems', self.mimeType).thenElse { :answer |
			self.unparsedContents := answer;
			/* self.contents := self.parse(answer);
			system.cache[self.name] := self.contents;
			self.contents */
			self
		} { :reason |
			[self, reason].postLine;
			self.error('LibraryItem>>cachedFetch: ' ++ reason)
		}
	}

	contents { :self |
		self.unparsedContents.ifNil {
			self.error('contents: not acquired')
		};
		self.parsedContents.ifNil {
			self.parsedContents := self.parser.value(self.unparsedContents)
		};
		self.parsedContents
	}

	printString { :self |
		'LibraryItem(%, %, %, %)'.format([self.name, self.category, self.url, self.mimeType])
	}

	request { :self |
		Promise { :resolve:/1 :reject:/1 |
			self.unparsedContents.ifNotNil { :answer |
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
		self.unparsedContents.ifNil {
			self.request;
			self.error('require: item not on shelf, requested')
		} {
			self.contents
		}
	}

}

+String {

	LibraryItem { :name :category :url :mimeType :parser |
		newLibraryItem().initializeSlots(name, category, url, mimeType, parser, nil, nil)
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
		self.requestLibraryItem(name).thenElse { :unused |
			aBlock()
		} { :reason |
			self.error('awaitLibraryItem: failure: ' ++ reason)
		}
	}

	awaitLibraryItems { :self :names :aBlock:/0 |
		names.collect { :each |
			self.requestLibraryItem(each)
		}.allFulfilled.thenElse { :unused |
			aBlock()
		} { :reason |
			self.error('awaitLibraryItems: failure: ' ++ reason)
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
