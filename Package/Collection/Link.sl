@Link {

	nextLink { :self |
		self.typeResponsibility('@Link>>nextLink')
	}

	value { :self |
		self.typeResponsibility('@Link>>value')
	}

}

+@Link {

	do { :self :aBlock/1 |
		self.linksDo { :each |
			aBlock(each.value)
		}
	}

	lastLink { :self |
		let answer = self;
		{ answer.nextLink.isNil }.whileFalse {
			answer := answer.nextLink
		};
		answer
	}

	linkAt { :self :index |
		self.linkAtIfAbsent(index) {
			self.errorInvalidIndex('linkAt', index)
		}
	}

	linkAtIfAbsent { :self :index :errorBlock/0 |
		let counter = 0;
		withReturn { :return/1 |
			self.linksDo { :link |
				counter := counter + 1;
				(counter = index).ifTrue {
					link.return
				}
			};
			errorBlock()
		}
	}

	linkOf { :self :anObject |
		self.linkOfIfAbsent(anObject) {
			'linkOf: no such element'.error
		}
	}

	linkOfIfAbsent { :self :anObject :errorBlock/0 |
		withReturn { :return/1 |
			self.linksDo { :link |
				(link.value = anObject).ifTrue {
					link.return
				}
			};
			errorBlock()
		}
	}

	linksDo { :self :aBlock/1 |
		let aLink = self;
		{ aLink.isNil }.whileFalse {
			aBlock(aLink);
			aLink := aLink.nextLink
		}
	}

	[List, linkToList] { :self |
		let h = self;
		let answer = [];
		{
			h.isNotNil
		}.whileTrue {
			answer.add!(h.value);
			h := h.nextLink
		};
		answer
	}

}

ValueLink : [Object, Copy, Store, Equal, Do, Link] {

	| value nextLink |

	isEqualBy { :self :anObject :aBlock/2 |
		anObject.isValueLink & {
			aBlock(self.value, anObject.value) & {
				self.nextLink == anObject.nextLink
			}
		}
	}

}

+@Object {

	ValueLink { :self :aLinkOrNil |
		newValueLink().initializeSlots(self, aLinkOrNil)
	}

}
