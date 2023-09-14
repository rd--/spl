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
					system.window.fetchMimeType(self.url, self.mimeType, ()).thenElse { :answer |
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
