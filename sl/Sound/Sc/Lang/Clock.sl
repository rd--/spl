Clock : [Object] { | priorityQueue nextEntryTime existingDelay |

	clear { :self |
		self.priorityQueue.clearAndShrink;
		self.existingDelay.ifNotNil {
			self.existingDelay.cancel
		};
		self.nextEntryTime := nil;
		self.existingDelay := nil
	}

	collectTexture { :self :aCollection :aProcedure:/1 :delay |
		| end = aCollection.size; |
		self.recurseEvery({ :index |
			{
				aProcedure(aCollection[index])
			}.play;
			(index = end).if {
				nil
			} {
				index + 1
			}
		}, 1, delay)
	}

	initialize { :self |
		self.initializeSlots(PriorityQueue(), nil, nil)
	}

	playEvery { :self :aProcedure :delay |
		self.repeatEvery({ : nextDelay |
			{
				aProcedure.cull(nextDelay)
			}.play
		}, delay)
	}

	recurseEvery { :self :aProcedure:/1 :anObject :delay |
		self.scheduleInjecting(0, anObject) { :inputValue |
			| nextDelay = delay.value; |
			(inputValue.notNil & {
				nextDelay.notNil
			}).ifTrue {
				[nextDelay, aProcedure(inputValue)]
			}
		}
	}

	repeatEvery { :self :aProcedure :delay |
		self.schedule(0) {
			| nextDelay = delay.value; |
			nextDelay.notNil.if {
				aProcedure.cull(nextDelay);
				nextDelay
			} {
				nil
			}
		}
	}

	schedule { :self :deltaTime :aProcedure |
		|
			currentTime = system.systemTimeInMilliseconds,
			scheduledTime = deltaTime * 1000 + currentTime,
			wakeupTime = self.nextEntryTime;
		|
		self.priorityQueue.push(aProcedure, scheduledTime);
		(wakeupTime = nil | {
			scheduledTime < wakeupTime
		}).ifTrue {
			self.nextEntryTime := scheduledTime;
			self.existingDelay.ifNotNil {
				self.existingDelay.cancel
			};
			self.existingDelay := {
				self.wakeup(scheduledTime)
			}.evaluateAfterMilliseconds(deltaTime * 1000)
		}
	}

	scheduleInjecting { :self :deltaTime :anObject :aProcedure:/1 |
		self.schedule(deltaTime) {
			| reply = aProcedure(anObject); |
			reply.ifNotNil {
				self.scheduleInjecting(reply[1], reply[2], aProcedure:/1)
			};
			nil
		}
	}

	wakeup { :self :scheduledTime |
		|
			currentTime = system.systemTimeInMilliseconds,
			queue = self.priorityQueue,
			front = self.nextEntryTime;
		|
		{
			front ~= nil & {
				front <= currentTime
			}
		}.whileTrue {
			| activity = queue.pop, rescheduleAfter = activity.value; |
			rescheduleAfter.isNumber.ifTrue {
				self.priorityQueue.push(activity, rescheduleAfter * 1000 + scheduledTime)
			};
			front := queue.peekPriority
		};
		self.nextEntryTime := front;
		front.ifNotNil {
			self.existingDelay.ifNotNil {
				self.existingDelay.cancel
			};
			self.existingDelay := {
				self.wakeup(front)
			}.evaluateAfterMilliseconds(front - currentTime)
		}
	}

}

+ Number {

	schedule { :self :aProcedure |
		workspace::clock.schedule(self, aProcedure)
	}

	scheduleInjecting { :self :anObject :aProcedure |
		workspace::clock.scheduleInjecting(self, anObject, aProcedure)
	}

}

+ Procedure {

	schedule { :self |
		workspace::clock.schedule(0, self)
	}

	scheduleInjecting { :self :anObject |
		workspace::clock.scheduleInjecting(0, anObject, self)
	}

}

+ Void {

	Clock {
		newClock().initialize
	}

}
