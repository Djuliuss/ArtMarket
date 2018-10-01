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

type PieceOfArt struct {
    Snumber string  		// Key reference
    Name string				// Name of the piece of art. Example: "Mona Lisa"
    Type string				// Type. Example: "Painting"
	Owner string   }		// Owner. Example: "Org1"

func (c *FinalExam) Init(stub shim.ChaincodeStubInterface) pb.Response { 
    return shim.Success(nil) 
}

func (c *FinalExam) Invoke(stub shim.ChaincodeStubInterface) pb.Response { 

    function, args := stub.GetFunctionAndParameters()

   //fmt.Printf("\nhello. I am calling function: %s", function)
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

func (c *FinalExam) createPieceOfArt(stub shim.ChaincodeStubInterface, args []string) pb.Response {

    if len(args) != 3 {
        return shim.Error("create piece of art arguments usage: Serialnumber, Name, Type")
    }
	
	creatorByte, err := stub.GetCreator()
	if(err != nil) {
        return shim.Error("GetCreator err")
    }

    pieceOfArt := PieceOfArt{args[0], args[1], args[2], string(creatorByte)}

    fmt.Printf("\npiece of art: %s", pieceOfArt)
    
    pieceOfArtAsBytes, err := json.Marshal(pieceOfArt)
    
    fmt.Printf("\npiece of art as bytes: %s", pieceOfArtAsBytes)
    
    if err != nil {
        return shim.Error(err.Error())
    }
    
    fmt.Printf("\nsnumber: %s", pieceOfArt.Snumber)
    
    err = stub.PutState(pieceOfArt.Snumber, pieceOfArtAsBytes)

    if err != nil {
        return shim.Error(err.Error())
    }
    return shim.Success(nil)
}

func (c *FinalExam) transferPieceOfArt(stub shim.ChaincodeStubInterface, args []string) pb.Response {

    if len(args) != 2 {
        return shim.Error("create transfer piece of art usage: Serialnumber, New owner")
    }
    
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
    if !(strings.EqualFold(pieceOfArt.Owner, string(creatorByte))) {
        fmt.Printf("\n pieceOfArt.Owner : %s ", pieceOfArt.Owner[0:6])
        fmt.Printf("\n string(creatorByte) : %s ", string(creatorByte)[0:6])
        return shim.Error("Only owner " + pieceOfArt.Owner +  " can transfer ownership")
    }
    
    pieceOfArt.Owner = args[1]
    pieceOfArtAsBytes, err := json.Marshal(pieceOfArt)
    
    if err != nil {
        return shim.Error(err.Error())
    }
    err = stub.PutState(pieceOfArt.Snumber, pieceOfArtAsBytes)
    return shim.Success(nil)
}

func (c *FinalExam) queryPieceOfArt(stub shim.ChaincodeStubInterface, args []string) pb.Response {
    
    // fmt.Printf("\nI am here")
    value, err := stub.GetState(args[0])
    if err != nil {
            return shim.Error("Serial number " + args[0] +" not found")
        }
    // fmt.Printf("\nrecovering this piece: %s", args[0])
    var pieceOfArt PieceOfArt
    json.Unmarshal(value, &pieceOfArt)

    // fmt.Printf("\nI am here, too")
    // fmt.Printf("\npiece of art recovered: %s", pieceOfArt)
   
    return shim.Success([]byte(" Snumber: " + pieceOfArt.Snumber + " Name: " + pieceOfArt.Name + " Type: " + pieceOfArt.Type + " Owner: " + pieceOfArt.Owner))
}

func main() {
    err := shim.Start(new(FinalExam))
    if err != nil {
        fmt.Printf("Error starting chaincode sample: %s", err)
    }
}
