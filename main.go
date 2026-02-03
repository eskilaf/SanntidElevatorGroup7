package main

import (
	_ "elevatorIO"
	_ "elevatorMovement"
	"fmt"
	"network"
	_ "orderControl"
	_ "requests"
	"roleManager"
)

func main() {
	fmt.Println("Hello from Main")

	roleManager.PrintMessageFromRoleManager()
	network.PrintMessageFromNetwork()

}
