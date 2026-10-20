@Remove {

	remove! { :self :oldObject |
		self.removeIfAbsent!(oldObject) {
			self.errorNotFound(oldObject)
		}
	}

	remove { :self :oldObject |
		let answer = self.copy;
		answer.remove!(oldObject);
		answer
	}

	removeAll! { :self |
		self.do { :each |
			self.remove!(each)
		}
	}

	removeAll! { :self :aCollection |
		(aCollection == self).if {
			self.removeAll!
		} {
			aCollection.do { :each |
				self.remove!(each)
			}
		}
	}

	removeAllEqualTo! { :self :oldObject |
		self.removeAllSuchThat! { :each |
			each = oldObject
		}
	}

	removeAllFoundIn! { :self :aCollection |
		aCollection.do { :each |
			self.removeIfAbsent!(each) {
			}
		};
		aCollection
	}

	removeAllSuchThat! { :self :aBlock/1 |
		self.copy.do { :each |
			aBlock(each).ifTrue {
				self.remove!(each)
			}
		}
	}

	removeIfAbsent! { :self :oldObject :anExceptionBlock |
		self.typeResponsibility('@Remove>>removeIfAbsent!')
	}

	without! { :self :oldObject |
		self.removeAllSuchThat! { :each |
			each = oldObject
		};
		self
	}

	withoutAll! { :self :aCollection |
		self.removeAllSuchThat! { :each |
			aCollection.includes(each)
		};
		self
	}

}
