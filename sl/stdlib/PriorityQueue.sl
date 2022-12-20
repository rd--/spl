PriorityQueue {

	clear { :self |
		<primitive: return _self.clear();>
	}

	clearAndShrink { :self |
		self.clear;
		self.shrink
	}

	isEmpty { :self |
		self.size = 0
	}

	peek { :self |
		<primitive: return _self.peek() || null;>
	}

	peekPriority { :self |
		<primitive: return _self.peekValue()  || null;>
	}

	pop { :self |
		<primitive: return _self.pop();>
	}

	push { :self :item :priority |
		<primitive: return _self.push(_item, _priority);>
	}

	pushAll { :self :associationsArray |
		associationsArray.do { :each |
			self.push(each.key, each.value)
		}
	}

	shrink { :self |
		<primitive: return _self.shrink();>
	}

	size { :self |
		<primitive: return _self.length;>
	}

}

+ Void {

	PriorityQueue {
		<primitive: return new sl.PriorityQueue();>
	}

}
