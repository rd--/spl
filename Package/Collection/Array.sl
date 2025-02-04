/*
Array : [Object] { | shape strides elementType contents |

}
*/

+List {

	isArray { :self |
		self.shapeOrNil.notNil
	}

	rank { :self |
		self.shape.size
	}

	shapeOrNil { :self |
		(self.size = 0).if {
			[0]
		} {
			let type = self.typeOf;
			let elementTypes = self.elementTypes;
			elementTypes.allSatisfy { :each |
				each = type
			}.if {
				let elementShapes = self.collect(shape:/1);
				(elementShapes.nub.size = 1).if {
					[self.size] ++ elementShapes.first
				} {
					nil
				}
			} {
				elementTypes.includes(type).if {
					nil
				} {
					[self.size]
				}
			}
		}
	}

	shape { :self |
		self.shapeOrNil.ifNil {
			self.error('shape: irregular arrays do not have shape')
		} { :answer |
			answer
		}
	}

	zeros { :self |
		[0].reshape(self)
	}

}

+[List, Range] {

	reshape { :self :shape |
		shape.ifEmpty {
			self.error('reshape: empty shape?')
		} {
			let size = shape.product;
			let answer = self.flatten.wrapExtend(size);
			shape.allButFirst.reverseDo { :n |
				answer := answer.clump(n)
			};
			answer
		}
	}

	reshapeLike { :self :another |
		let index = 1;
		let items = self.flatten;
		another.deepCollect { :unusedItem |
			let item = items.atWrap(index);
			index := index + 1;
			item
		}
	}

}

+@Object {

	rank { :self |
		0
	}

	shape { :self |
		[]
	}

}
