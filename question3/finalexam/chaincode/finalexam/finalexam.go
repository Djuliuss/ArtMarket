package main

import (
   "fmt"
    "github.com/hyperledger/fabric/core/chaincode/shim"
    pb "github.com/hyperledger/fabric/protos/peer"
    "encoding/json"
    "strings"
)

type FinalExam struct {
}

// This is the structe of the records we will insert in the blockchain
type PieceOfArt struct {
    Snumber string  		// Key reference
    Name string				// Name of the piece of art. Example: "Mona Lisa"
    Type string				// Type. Example: "Painting"
	Owner string   }		// Current owner. Example: "Org1".

func (c *FinalExam) Init(stub shim.ChaincodeStubInterface) pb.Response { 
    return shim.Success(nil) 
}

func (c *FinalExam) Invoke(stub shim.ChaincodeStubInterface) pb.Response { 

    function, args := stub.GetFunctionAndParameters()

    switch function {
    case "createPieceOfArt":
        return c.createPieceOfArt(stub, args)
    case "transferPieceOfArt":
		return c.transferPieceOfArt(stub, args)
    case "queryPieceOfArt":
 		return c.queryPieceOfArt(stub, args)
	default:
        return shim.Error("Available functions: createPieceOfArt, transferPieceOfArt, queryPieceOfArt")
    }
}


// with this function we create the Pieces of Art and insert them into the blockchain.
func (c *FinalExam) createPieceOfArt(stub shim.ChaincodeStubInterface, args []string) pb.Response {

    if len(args) != 3 {
        return shim.Error("create piece of art arguments usage: Serialnumber, Name, Type")
    }
	
// we retreive the sender of the transaction, as we will use this value later on in the code
	creatorByte, err := stub.GetCreator()
	if(err != nil) {
        return shim.Error("GetCreator err")
    }

// the first 3 fields will be provided by the user. The owner of the Piece of art will be automatically 
// populated with the value of the sender of the transaction.
    pieceOfArt := PieceOfArt{args[0], args[1], args[2], (string(creatorByte))[0:6]}

    pieceOfArtAsBytes, err := json.Marshal(pieceOfArt)
    
    if err != nil {
        return shim.Error(err.Error())
    }
    
    err = stub.PutState(pieceOfArt.Snumber, pieceOfArtAsBytes)

    if err != nil {
        return shim.Error(err.Error())
    }
    return shim.Success(nil)
}

// with this function we transfer the ownership of a piece of art by updating the value of the owner field.
func (c *FinalExam) transferPieceOfArt(stub shim.ChaincodeStubInterface, args []string) pb.Response {

    if len(args) != 2 {
        return shim.Error("create transfer piece of art usage: Serialnumber, New owner")
    }

// we retreive the sender of the transaction, as we will use this value later on in the code    
    creatorByte, err := stub.GetCreator()
	if(err != nil) {
        return shim.Error("GetCreator err")
    }

    value, err := stub.GetState(args[0])
    if err != nil {
            return shim.Error("Serial number " + args[0] +" not found")
    }
    
    var pieceOfArt PieceOfArt
    json.Unmarshal(value, &pieceOfArt)

// only if the sender of transaction is the current owner of the Piece of art, will it be possible to change
// the ownership to the new value.
    if !(strings.Contains(string(creatorByte), pieceOfArt.Owner)) {
        return shim.Error("Only owner " + pieceOfArt.Owner +  " can transfer ownership")
    }
    
// we new owner will be passed as an argument. we update the value of field Owner with this argument.    
    pieceOfArt.Owner = args[1]
    pieceOfArtAsBytes, err := json.Marshal(pieceOfArt)
    
    if err != nil {
        return shim.Error(err.Error())
    }
    err = stub.PutState(pieceOfArt.Snumber, pieceOfArtAsBytes)

    return shim.Success(nil)
}


// this query function can be used to validate the current owner of a given Piece of Art
func (c *FinalExam) queryPieceOfArt(stub shim.ChaincodeStubInterface, args []string) pb.Response {
  
    value, err := stub.GetState(args[0])
    if err != nil {
            return shim.Error("Serial number " + args[0] +" not found")
        }

    var pieceOfArt PieceOfArt
    json.Unmarshal(value, &pieceOfArt)

    return shim.Success([]byte(" Snumber: " + pieceOfArt.Snumber + " Name: " + pieceOfArt.Name + " Type: " + pieceOfArt.Type + " Owner: " + pieceOfArt.Owner))
}

func main() {
    err := shim.Start(new(FinalExam))
    if err != nil {
        fmt.Printf("Error starting chaincode sample: %s", err)
    }
}
