
File Structure ? 

elevator-project/
├── main.go                 # Entry point: Initializes all modules and starts goroutines
├── config/                 # Constants like num_floors, door_open_time, port_numbers
│   └── config.go
├── elevator/               # Local elevator logic (State Machine)
│   ├── elevator.go         # Elevator state definitions (Idle, Moving, DoorOpen)
│   └── fsm.go              # Finite State Machine logic
├── network/                # Networking module (UDP/TCP abstraction)
│   ├── network.go          # Initialization of network
│   ├── transmitter.go      # Sending messages
│   └── receiver.go         # Listening for other elevators
├── orders/                 # The "Brain": Handles order assignment and sync
│   ├── distributor.go      # Logic for "Which elevator takes this call?"
│   └── queue.go            # Local queue management
└── driver/                 # Hardware/Simulator interface
    ├── driver.go           # CGO or IO wrappers to talk to the elevator
    └── channels.go         # Converts hardware signals into Go channels