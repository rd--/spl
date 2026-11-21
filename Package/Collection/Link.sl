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

	do { :self :aFunction/1 |
		self.linksDo { :each |
			aFunction(each.value)
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

	linkAtIfAbsent { :self :index :errorFunction/0 |
		let counter = 0;
		withReturn { :return/1 |
			self.linksDo { :link |
				counter := counter + 1;
				(counter = index).ifTrue {
					link.return
				}
			};
			errorFunction()
		}
	}

	linkOf { :self :anObject |
		self.linkOfIfAbsent(anObject) {
			'linkOf: no such element'.error
		}
	}

	linkOfIfAbsent { :self :anObject :errorFunction/0 |
		withReturn { :return/1 |
			self.linksDo { :link |
				(link.value = anObject).ifTrue {
					link.return
				}
			};
			errorFunction()
		}
	}

	linksDo { :self :aFunction/1 |
		let aLink = self;
		{ aLink.isNil }.whileFalse {
			aFunction(aLink);
			aLink := aLink.nextLink
		}
	}

}

Link : [Object, Copy, Store, Equal, Do, Collection, Link] {

	| value nextLink | <@Object>

	collect { :self :aFunction/1 |
		let answer = nil;
		self.do { :each |
			answer := Link(aFunction(each), answer)
		};
		answer.reverse
	}

	isEqualBy { :self :anObject :aFunction/2 |
		anObject.isLink & {
			aFunction(self.value, anObject.value) & {
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

}
