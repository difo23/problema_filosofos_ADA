import threading
from time import sleep
import os
 
# Layout of the table (P = philosopher, f = fork):
#      

 
# Number of philosophers at the table. There'll be the same number of forks.
numPhilosophers = 5
 
# Lists to hold the philosophers and the forks. Philosophers are threads while
# forks are essentially numbered locks.
philosophers = []
forks = []
 
class Philosopher(threading.Thread):
    def __init__(self, position):
        threading.Thread.__init__(self)
        self.position = position
 
    def run(self):
        # Eat forever
        while True:
            # Fork on left is has position self.position.
            # Fork on right has position (self.position - 1 + numPhilosophers) %
            # numPhilosophers
            leftFork = self.position
            rightFork = (self.position - 1 + numPhilosophers) % numPhilosophers
 
            # Try and pick up the largest fork
            if leftFork > rightFork:
                forkPickedUp = leftFork
            else:
                forkPickedUp = rightFork
            pickedUp = forks[forkPickedUp].tryAndPickUp(self.position)
 
            # We got the fork, try and pick up the other fork
            if pickedUp:
                otherFork = leftFork if forkPickedUp == leftFork else rightFork
                pickedUpOther = forks[otherFork].tryAndPickUp(self.position)
 
                # Did we get the other fork? If so, eat. Both forks get put down
                # either way.
                if pickedUpOther:
                    print("Philosopher", self.position, "eats.")
                    forks[otherFork].putDown()
                forks[forkPickedUp].putDown()
 
class Fork:
    def __init__(self, position):
        self.position = position
        self.lock = threading.Lock()
        self.owner = -1
 
    def tryAndPickUp(self, philosopher):
        with self.lock:
            if self.owner == -1:
                self.owner = philosopher
        return self.owner == philosopher
 
    def putDown(self):
        with self.lock:
            self.owner = -1
 
if __name__ == "__main__":
    # Create our philosophers and forks
    for i in range(0, numPhilosophers):
        philosopher = Philosopher(i)
        philosopher.name = "Philosopher" + str(i)
        philosopher.daemon = True
        philosophers.append(philosopher)
        forks.append(Fork(i))
 
    # All philosophers start eating
    for i in range(0, numPhilosophers):
        philosophers[i].start()
 
    # Allow CTRL + C to exit the program
    try:
        while True: sleep(0.1)
    except (KeyboardInterrupt, SystemExit):
        os._exit(0)