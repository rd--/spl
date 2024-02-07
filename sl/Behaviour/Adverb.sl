+Block {

	atop { :self:/2 :aBlock:/1 |
		{ :anObject :anotherObject |
			aBlock(self(anObject, anotherObject))
		}
	}

	bind { :self :anObject |
		self.bindLeft(anObject)
	}

	bindLeft { :self:/2 :anObject |
		{ :each |
			self(anObject, each)
		}
	}

	bindRight { :self:/2 :anObject |
		{ :each |
			self(each, anObject)
		}
	}

	compose { :self:/1 :aBlock:/1 |
		self.composeLeft(aBlock:/1)
	}

	composeLeft { :self:/1 :aBlock:/1 |
		{ :anObject |
			self(aBlock(anObject))
		}
	}

	composeRight { :self:/1 :aBlock:/1 |
		{ :anObject |
			aBlock(self(anObject))
		}
	}

	e { :self:/2 |
		{ :alpha :beta |
			alpha.withCollectEqual(beta, self:/2)
		}
	}

	each { :self |
		(self.numArgs = 1).if {
			{ :aCollection |
				aCollection.collect(self)
			}
		} {
			{ :alpha :beta |
				alpha.withCollect(beta, self)
			}
		}
	}

	f { :self:/2 |
		{ :alpha :beta |
			alpha.withCollectFolding(beta, self:/2)
		}
	}

	innerProduct { :self:/2 :aBlock:/2 |
		{ :p :q |
			p.withCollect(q,self:/2).foldRight(aBlock:/2)
		}
	}

	map { :self:/2 |
		{ :alpha :beta |
			alpha.withCollect(beta, self:/2)
		}
	}

	outerProduct { :self:/2 |
		{ :p :q |
			p.collect { :each |
				q.collect { :alpha |
					self(each, alpha)
				}
			}
		}
	}

	over { :f:/2 :g:/1 |
		{ :p :q |
			f(p.g, q.g)
		}
	}

	power { :self:/1 :count |
		{ :each |
			count.timesRepeat {
				each := self(each)
			};
			each
		}
	}

	s { :self:/2 |
		{ :alpha :beta |
			alpha.withCollectTruncating(beta, self:/2)
		}
	}

	self { :self:/2 |
		{ :each |
			self(each, each)
		}
	}

	swap { :self:/2 |
		(self:/2.numArgs ~= 2).ifTrue {
			'Block>>swap: not two argument block'.error
		};
		{ :alpha :beta |
			self(beta, alpha)
		}
	}

	t { :self:/2 |
		{ :alpha :beta |
			alpha.withCollectTable(beta, self:/2)
		}
	}

	w { :self:/2 |
		{ :alpha :beta |
			alpha.withCollectWrapping(beta, self:/2)
		}
	}

	x { :self:/2 |
		{ :alpha :beta |
			alpha.withCollectCrossed(beta, self:/2)
		}
	}

}
