(* Requires: Collection-PriorityQueue *)
Clock : [Object] { | priorityQueue nextEntryTime existingDelay |

	initialize { :self |
		self.initializeSlots(PriorityQueue(), nil, nil)
	}

	recurseEvery { :self :aProcedure:/2 :anObject :delay |
		self.scheduleInjecting(0, anObject) { :currentTime :inputValue |
			| nextDelay = delay.value; |
			(inputValue.notNil & {
				nextDelay.notNil
			}).ifTrue {
				[nextDelay, aProcedure(currentTime, inputValue)]
			}
		}
	}

	removeAll { :self |
		self.priorityQueue.removeAllAndShrink;
		self.existingDelay.ifNotNil {
			self.existingDelay.cancel
		};
		self.nextEntryTime := nil;
		self.existingDelay := nil
	}

	repeatEvery { :self :aProcedure:/2 :delay |
		self.schedule(0) { :currentTime |
			| nextDelay = delay.value; |
			nextDelay.ifNotNil {
				aProcedure(currentTime, nextDelay);
				nextDelay
			}
		}
	}

	schedule { :self :deltaTime :aProcedure:/1 |
		|(
			currentTime = system.systemTimeInSeconds,
			scheduledTime = currentTime + deltaTime,
			wakeupTime = self.nextEntryTime
		)|
		self.priorityQueue.push(aProcedure:/1, scheduledTime);
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

	scheduleInjecting { :self :deltaTime :anObject :aProcedure:/2 |
		self.schedule(deltaTime) { :currentTime |
			| reply = aProcedure(currentTime, anObject); |
			reply.ifNotNil {
				self.scheduleInjecting(reply[1], reply[2], aProcedure:/2)
			};
			nil
		}
	}

	wakeup { :self :scheduledTime |
		|(
			currentTime = system.systemTimeInSeconds,
			queue = self.priorityQueue,
			frontOfQueueTime = self.nextEntryTime
		)|
		{
			frontOfQueueTime ~= nil & {
				frontOfQueueTime <= currentTime
			}
		}.whileTrue {
			|(
				activityProcedure:/1 = queue.pop,
				rescheduleAfter = activityProcedure(scheduledTime)
			)|
			rescheduleAfter.ifNotNil {
				self.priorityQueue.push(activityProcedure:/1, scheduledTime + rescheduleAfter)
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
			}.evaluateAfterMilliseconds(frontOfQueueTime - currentTime * 1000)
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

+SmallFloat {

	schedule { :self :aProcedure:/2 |
		system.clock.schedule(self, aProcedure:/2)
	}

	scheduleInjecting { :self :anObject :aProcedure:/2 |
		system.clock.scheduleInjecting(self, anObject, aProcedure:/2)
	}

}

+Procedure {

	schedule { :self:/1 |
		system.clock.schedule(0, self:/1)
	}

	scheduleInjecting { :self:/2 :anObject |
		system.clock.scheduleInjecting(0, anObject, self:/2)
	}

}
