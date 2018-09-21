package main

import (
   "fmt"
    "github.com/hyperledger/fabric/core/chaincode/shim"
    pb "github.com/hyperledger/fabric/protos/peer"
    "encoding/json"
)

type FinalExam struct {
}

type PieceOfArt struct {
    Snumber string  		// Key reference
    Name string				// Name of the piece of art. Example: "Mona Lisa"
    Type string				// Type. Example: "Picture"
	Owner string   }		// Owner. Example: "Org1"

func (c *FinalExam) Init(stub shim.ChaincodeStubInterface) pb.Response { 
    return shim.Success(nil) 
}

func (c *FinalExam) Invoke(stub shim.ChaincodeStubInterface) pb.Response { 

    function, args := stub.GetFunctionAndParameters()

    switch function {
    case "createPieceOfArt":
        return c.createPieceOfArt(stub, args)
//    case "transferPieceOfArt":
//		return c.transferPieceOfArt(stub, args)
// 	  case "queryPieceOfArt":
// 		return c.queryPieceOfArt(stub, args)
	default:
        return shim.Error("Available functions: createPieceOfArt, transferPieceOfArt, queryPieceOfArt")
    }
}

func (c *FinalExam) createPieceOfArt(stub shim.ChaincodeStubInterface, args []string) pb.Response {

    if len(args) != 3 {
        return shim.Error("create piece of art arguments usage: Serialnumber, Name, Type")
    }
	
	creatorByte, err := stub.GetCreator()
	if(err != nil) {
        return shim.Error("GetCreator err")
    }

	pieceOfArt := PieceOfArt{args[0], args[1], args[2], string(creatorByte)}

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

func main() {
    err := shim.Start(new(FinalExam))
    if err != nil {
        fmt.Printf("Error starting chaincode sample: %s", err)
    }
}