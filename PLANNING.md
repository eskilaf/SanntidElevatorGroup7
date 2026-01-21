Planning for the Elevator Project

## W4 

### Modules & Variables

Requests // info about the local elevator
- info: Returnerer om det er noen i request i LocalOrderList
- LocalOrderTable

Timer
- info: Module for setting timers.

NetworkModule
- info: Contains the functions to allow easy message passing between the other modules

Elevator
- info: Interacts with driver
- ElevatorStates (floor, direction, worldView, etc.)

FSM
- info: decision making

OrderController // info about all the elevators
- info: Hall orders and unassigned hall orders. For redundancy of the whole system
- HallOrderTable
- UnassignedOrders
- CabOrderTable

SlaveKeeper
- AliveList

### What backup has to know
- Unassigned orders
- HallOrderTable // Hvilke heiser som betjener ordrene
- AliveList ?

### When to update OrderTable
- New order / redistributuon of orders
	- It gets a message from the order assign/recieve verifier
- Order is done for
	- The elevator is in the correct floor
	- The elevator door is open
	- When clear current floor is called:
		- Master should be notified
		- There is a message from request from the distributor from the slave
			- The slave can clear it at once
		- It neads to send to the master throgh the network that it is cleared
		- The master getsa a message from the slave that goes to order distributor
			- Then master can also remove that order from OrderList
		- Another possibility: 
			- The slave can alert the master and the master notifies everyone, including the slave itsetlf
		- Another possibiloty:
			- The master/slave can have two OrderList and and UnasignedOrderList; One list for what only the slaves possibly know about, and one for the "global ish" list. 
			- This may be better incase we get problems when a master/slave shuts down in the middle of the communication process
	- Lights:
		- When we have verified the orders from backup:
			- The lights should be turned on 
		- When we have verified the confirmation:
			- The light are to be turned off
		- So basicly:
			- The lights are what everyone agrees about

### What happens when a slave becomes a master?
- Make a common rule for the new master
	- Lowest IP = new master
- The new assigned master must:
	- elevator.master = true
	- send i am alive to the backups
	- the master needs to know which backups are alive
	- remove earlier master from alivelist

### What is a new node on the network? 
- The new nod needs to be sent all the data, not only the changes
- Idempotant: A new message overwrites the old 
	- We may also do this

### Program Flow (hall call)
1. Slave gets a button press
2. Slave updates its own UnassignedOrders
3. Slaves sends a new message to master through network
4. Master recieves new order and sends it to OrderController
5. Master writes down this order into the masters UnassignedOrders
6. OrderDistributor (master) forwards this message throught network to slaves
7. All slaves updates their UnassignedOrders
8. Slaves turn on their lamp
9. Slaves ack they have recieved this list
10. Master now knows that the order is distributed and verifies the order
11. Master updates its UnassignedOrders
11. Master turns on its lights
12. OrderController (master) calculates the elevator to take the order (slave2)
13. Master updates: HallOrderTable, UnassignedOrders
14. Master sends a network message to everyone that slave2 takes the order
15. The slaves updates their HallOrderTable
16. The relevant slave (slave2) updates its LocalOrderTable ( e.requests(floor)(ButtonType) )
17. The slaves ack they recieved the order update // ??
18. // If the relevant elevator does not ack the recieved order, the order will re-enter the order distributor
19. The relevant slave (slave2) moves to the floor based on the fsm logic
20. // If this is interrupted the master notices and redistributes the order
21. When the elevator arrives at relevant floor and opens the door the order has been served
22. Then the request module notifies the order module (slave side) that the order is cleared
23. The slave removes this order from its LocalOrderTable (requests)
24. The slave (slave2) notifies the master that the order is cleared
25. The master updates its HallOrderTable and notitifies all the slaves 
26. Resend until slaves ack

#### Comments on program flow (hall call)
- Usikker på om vi faktisk trenger ekstra kopier av listene som masteer ikke kanskje vet
- Dobbeltsjekka at alle disse acksene er nødvending
- Bestem oss for navn på lister det ble litt rot

### Questions
- What is meant by a new node on the network? 

### TODO
- Lage flow for nettverk, cab calls, ny person på nettverks osv
- Lage sekvensdiagram 
- Tilstandsdiagrammer innad i de forskjellige trådene