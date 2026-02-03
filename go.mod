module SanntidElevatorGroup7

go 1.20

// Tell go these files exist
require (
    elevatorIO v0.0.0
    elevatorMovement v0.0.0
    network v0.0.0
    orderControl v0.0.0
    requests v0.0.0
    roleManager v0.0.0
)
// Point go to local folders
replace (
    elevatorIO => ./elevatorIO
    elevatorMovement => ./elevatorMovement
    network => ./network
    orderControl => ./orderControl
    requests => ./requests
    roleManager => ./roleManager
)