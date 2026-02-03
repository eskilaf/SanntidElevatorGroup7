package main

import (
	_ "ElevatorIO"
	_ "ElevatorMovement"
	"Network"
	_ "OrderControl"
	_ "Requests"
	"RoleManager"
	"fmt"
)

func main() {
	fmt.Println("Hello from Main")

	RoleManager.PrintMessageFromRoleManager()
	Network.PrintMessageFromNetwork()

}
