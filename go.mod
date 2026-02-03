module SanntidElevatorGroup7

go 1.20

// Tell go these files exist
require (
    ElevatorIO v0.0.0
    ElevatorMovement v0.0.0
    Network v0.0.0
    OrderControl v0.0.0
    Requests v0.0.0
    RoleManager v0.0.0
)
// Point go to local folders
replace (
    ElevatorIO => ./ElevatorIO
    ElevatorMovement => ./ElevatorMovement
    Network => ./Network
    OrderControl => ./OrderControl
    Requests => ./Requests
    RoleManager => ./RoleManager
)