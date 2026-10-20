@Link {

	nextLink { :self |
		self.typeResponsibility('@Link>>nextLink')
	}

	previousLink { :self |
		self.typeResponsibility('@Link>>previousLink')
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
		{
			answer.nextLink.isNil
		}.whileFalse {
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

Link : [Object, Copy, Store, Equal, Do, Collect, Link] {

	| value nextLink |

	collect { :self :aBlock/1 |
		let answer = nil;
		self.do { :each |
			answer := Link(aBlock(each), answer)
		};
		answer.reverse
	}

	isEqualBy { :self :anObject :aBlock/2 |
		anObject.isLink & {
			aBlock(self.value, anObject.value) & {
				self.nextLink = anObject.nextLink
			}
		}
	}

	reverse { :self |
		let answer = Link(self.value, nil);
		let link = self.nextLink;
		{
			link != nil
		}.whileTrue {
			answer := Link(link.value, answer);
			link := link.nextLink
		};
		answer
	}

}

+@Object {

	Link { :self :aLinkOrNil |
		(
			aLinkOrNil.isLink | {
				aLinkOrNil.isNil
			}
		).if {
			uncheckedLink(self, aLinkOrNil)
		} {
			self.error('Link', [aLinkOrNil])
		}
	}

	uncheckedLink { :self :aLinkOrNil |
		newLink().initializeSlots(self, aLinkOrNil)
	}

}
