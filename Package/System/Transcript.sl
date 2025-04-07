TranscriptEntry : [Object] { | category message time |

}

+String {

	TranscriptEntry { :self :message |
		newTranscriptEntry().initializeSlots(self, message, system.absoluteTime)
	}

}

Transcript : [Object] { | entries |

	addError { :self :message |
		self.entries.add(TranscriptEntry('error', message));
		system.consoleError(message)
	}

	addNotification { :self :message |
		self.entries.add(TranscriptEntry('notification', message));
		system.consoleNotification(message)
	}

	addWarning { :self :message |
		self.entries.add(TranscriptEntry('warning', message));
		system.consoleWarning(message)
	}

	removeAll { :self |
		system.consoleClear;
		self.entries.removeAll
	}

	errorMessages { :self |
		self.messages('error')
	}

	messages { :self :category |
		self.entries.selectThenCollect { :each |
			each.category = category
		} { :each |
			each.message
		}
	}

	notificationMessages { :self |
		self.messages('notification')
	}

	String { :self |
		self.entries.collect { :each |
			(each.category = 'notification').if {
				each.message
			} {
				each.category ++ ': ' ++ each.message
			}
		}.unlines
	}

	warningMessages { :self |
		self.messages('warning')
	}

}

+Void {

	Transcript {
		newTranscript().initializeSlots([])
	}

}

+System {

	postLine { :self :aString |
		self.transcript.addNotification(aString)
	}

	transcript { :self |
		self.cached('transcript') {
			Transcript()
		}
	}

}
