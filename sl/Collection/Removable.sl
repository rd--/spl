@Removable {

	remove { :self :oldObject |
		self.removeIfAbsent(oldObject) {
			self.errorNotFound(oldObject)
		}
	}

	removeAll { :self |
		self.do { :each |
			self.remove(each)
		}
	}

	removeAll { :self :aCollection |
		(aCollection == self).if {
			self.removeAll
		} {
			aCollection.do { :each |
				self.remove(each)
			}
		};
		aCollection
	}

	removeAllFoundIn { :self :aCollection |
		aCollection.do { :each |
			self.removeIfAbsent(each) {
			}
		};
		aCollection
	}

	removeAllSuchThat { :self :aBlock:/1 |
		self.copy.do { :each |
			aBlock(each).ifTrue {
				self.remove(each)
			}
		}
	}

	removeIfAbsent { :self :oldObject :anExceptionBlock |
		self.typeResponsibility('@Collection>>removeIfAbsent')
	}

}
