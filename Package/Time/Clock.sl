/* Requires: PriorityQueue */

Clock : [Object] { | priorityQueue nextEntryTime existingDelay |

	initialize { :self |
		self.initializeSlots(PriorityQueue(), nil, nil)
	}

	removeAll { :self |
		self.priorityQueue.removeAllAndShrink;
		self.existingDelay.ifNotNil {
			self.existingDelay.cancel
		};
		self.nextEntryTime := nil;
		self.existingDelay := nil
	}

	scheduleBlock { :self :deltaTime :aBlock:/1 |
		let currentTime = system.sessionTime;
		let scheduledTime = currentTime + deltaTime;
		let wakeupTime = self.nextEntryTime;
		self.priorityQueue.pushWithPriority(aBlock:/1, scheduledTime);
		(wakeupTime = nil | {
			scheduledTime < wakeupTime
		}).ifTrue {
			self.nextEntryTime := scheduledTime;
			self.existingDelay.ifNotNil {
				self.existingDelay.cancel
			};
			self.existingDelay := {
				self.wakeup(scheduledTime)
			}.valueAfter(deltaTime)
		}
	}

	scheduleBlockInjecting { :self :deltaTime :anObject :aBlock:/2 |
		self.scheduleBlock(deltaTime) { :currentTime |
			let reply = aBlock(currentTime, anObject);
			reply.ifNotNil {
				self.scheduleBlockInjecting(reply[1], reply[2], aBlock:/2)
			};
			nil
		}
	}

	wakeup { :self :scheduledTime |
		let currentTime = system.sessionTime;
		let queue = self.priorityQueue;
		let frontOfQueueTime = self.nextEntryTime;
		{
			frontOfQueueTime != nil & {
				frontOfQueueTime <= currentTime
			}
		}.whileTrue {
			let activityBlock:/1 = queue.pop;
			let rescheduleAfter = activityBlock(scheduledTime);
			rescheduleAfter.ifNotNil {
				self.priorityQueue.pushWithPriority(
					activityBlock:/1,
					scheduledTime + rescheduleAfter
				)
			};
			frontOfQueueTime := queue.peekPriority
		};
		self.nextEntryTime := frontOfQueueTime;
		frontOfQueueTime.ifNotNil {
			self.existingDelay.ifNotNil {
				self.existingDelay.cancel
			};
			self.existingDelay := {
				self.wakeup(frontOfQueueTime)
			}.valueAfter(frontOfQueueTime - currentTime)
		}
	}

}

+Void {

	Clock {
		newClock().initialize
	}

}

+@Cache {

	clock { :self |
		self.cached('clock') {
			Clock()
		}
	}

}

+Block {

	recurseEvery { :self:/2 :anObject :delayTime :aClock |
		{ :currentTime :inputValue |
			let nextDelay = delayTime.value;
			(
				inputValue.isNotNil & {
					nextDelay.isNotNil
				}
			).ifTrue {
				[nextDelay, self(currentTime, inputValue)]
			}
		}.scheduleInjecting(anObject, 0, aClock)
	}

	recurseEvery { :self:/2 :anObject :delayTime |
		recurseEvery(self:/2, anObject, delayTime, system.clock)
	}

	repeatEvery { :self:/2 :delayTime :aClock |
		{ :currentTime |
			let nextDelay = delayTime.value;
			nextDelay.ifNotNil {
				self(currentTime, nextDelay);
				nextDelay
			}
		}.schedule(0, aClock)
	}

	repeatEvery { :self:/2 :delayTime |
		repeatEvery(self:/2, delayTime, system.clock)
	}

	schedule { :self:/1 :deltaTime :aClock |
		aClock.scheduleBlock(deltaTime, self:/1)
	}

	schedule { :self:/1 :deltaTime |
		schedule(self:/1, deltaTime, system.clock)
	}

	schedule { :self:/1 |
		schedule(self:/1, 0, system.clock)
	}

	scheduleInjecting { :self:/2 :anObject :deltaTime :aClock |
		aClock.scheduleBlockInjecting(deltaTime, anObject, self:/2)
	}

	scheduleInjecting { :self:/2 :anObject :deltaTime |
		scheduleInjecting(self:/2, anObject, deltaTime, system.clock)
	}

	scheduleInjecting { :self:/2 :anObject |
		scheduleInjecting(self:/2, anObject, 0, system.clock)
	}

}
