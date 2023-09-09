LibraryItem : [Object] { | name url mimeType parser useLocalStorage value |

	key { :self |
		'sl/library/' ++ self.url.hostname ++ self.url.pathname
	}

	readLocalStorage { :self |
		| text = system.window.localStorage[self.key]; |
		self.mimeType.caseOfOtherwise([
			'application/json' -> {
				self.parser . (text.parseJson)
			},
			'text/plain' -> {
				self.parser . (text)
			}
		]) {
			self.error('readLocalStorage: unsupported mimeType')
		}
	}

	require { :self |
		('LibraryItem>>require' ++ self.name).postLine;
		Promise { :resolve:/1 :reject:/1 |
			self.value.ifNotNil {
				self.value.resolve
			} {
				system.window.localStorage.includesIndex(self.key).if {
					self.value := self.readLocalStorage;
					self.value.resolve
				} {
					system.window.fetchMimeType(self.url, self.mimeType, ()).then { :answer |
						self.useLocalStorage.ifTrue {
							self.writeLocalStorage(answer)
						};
						self.value := self.parser . (answer);
						self.value.resolve
					}
				}
			}
		}
	}

	writeLocalStorage { :self :anObject |
		self.mimeType.caseOfOtherwise([
			'application/json' -> {
				system.window.localStorage[self.key] := anObject.json
			},
			'text/plain' -> {
				system.window.localStorage[self.key] := anObject.asString
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
