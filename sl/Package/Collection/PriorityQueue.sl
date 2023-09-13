PriorityQueue! : [Object] {

	isEmpty { :self |
		self.size = 0
	}

	peek { :self |
		<primitive: return _self.peek() || null;>
	}

	peekPriority { :self |
		<primitive: return _self.peekValue() || null;>
	}

	pop { :self |
		<primitive: return _self.pop();>
	}

	pseudoSlotNameArray { :self |
		['size']
	}

	push { :self :item :priority |
		<primitive: return _self.push(_item, _priority);>
	}

	pushAll { :self :associationsArray |
		associationsArray.do { :each |
			self.push(each.key, each.value)
		}
	}

	removeAll { :self |
		<primitive: return _self.clear();>
	}

	removeAllAndShrink { :self |
		self.removeAll;
		self.shrink
	}

	shrink { :self |
		<primitive: return _self.shrink();>
	}

	size { :self |
		<primitive: return _self.length;>
	}

}

+Void {

	PriorityQueue {
		<primitive: return new sl.PriorityQueue();>
	}

}
