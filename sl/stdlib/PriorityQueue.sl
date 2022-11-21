PriorityQueue {

	push { :self :item :priority | <primitive: return _self.push(_item, _priority);> }
	pop { :self | <primitive: return _self.pop();> }
	peek { :self | <primitive: return _self.peek() || null;> }
	peekPriority { :self | <primitive: return _self.peekValue()  || null;> }
	clear { :self | <primitive: return _self.clear();> }
	shrink { :self | <primitive: return _self.shrink();> }
	size { :self | <primitive: return _self.length;> }

	clearAndShrink { :self |
		self.clear;
		self.shrink
	}

	isEmpty { :self |
		self.size = 0
	}

	pushAll { :self :associationsArray |
		associationsArray.do { :each | self.push(each.key, each.value) }
	}

}

+ Void {

	PriorityQueue { <primitive: return new sl.PriorityQueue();> }

}
