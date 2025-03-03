+Record {

	atDelegateToIfAbsent { :self :key :delegateKey :aBlock:/0 |
		self.atIfAbsent(key) {
			self.includesIndex(delegateKey).if {
				self[delegateKey].atDelegateToIfAbsent(
					key,
					delegateKey,
					aBlock:/0
				)
			} {
				aBlock()
			}
		}
	}

	atDelegateTo { :self :key :delegateKey |
		self.atDelegateToIfAbsent(key, delegateKey) {
			self.error('Record>>atDelegate: unknown key: ' ++ key)
		}
	}

	atPutDelegateToIfAbsent { :self :key :value :delegateKey :aBlock:/0 |
		self.includesIndex(key).if {
			self.atPut(key, value)
		} {
			self.atIfAbsent(key) {
				self.includesIndex(delegateKey).if {
					self[delegateKey].atPutDelegateToIfAbsent(
						key,
						value,
						delegateKey,
						aBlock:/0
					)
				} {
					aBlock()
				}
			}
		}
	}

	atPutDelegateTo { :self :key :value :delegateKey |
		self.atPutDelegateToIfAbsent(key, value, delegateKey) {
			self.atPut(key, value)
		}
	}

	messageSend { :self :selector :delegateKey :argumentsList |
		let answer = self.atDelegateTo(selector, delegateKey);
		answer.isBlock.if {
			answer.apply([self] ++ argumentsList)
		} {
			answer
		}
	}

}
