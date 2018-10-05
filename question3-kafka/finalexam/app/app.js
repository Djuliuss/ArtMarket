'use strict';

const hfc = require('fabric-client');
let channel;
const enrolUser = function(client, options) {
  return hfc.newDefaultKeyValueStore({ path: options.wallet_path })
    .then(wallet => {
      client.setStateStore(wallet);
      return client.getUserContext(options.user_id, true);
    });
};

const initNetwork = function(client, options, target) {
  let channel;
  try {
    channel = client.newChannel(options.channel_id);
    const peer = client.newPeer(options.peer_url);
    target.push(peer);
    channel.addPeer(peer);
    channel.addOrderer(client.newOrderer(options.orderer_url));
  } catch(e) { // channel already exists
    channel = client.getChannel(options.channel_id);
  }
  return channel;
};

const transactionProposal = function(client, channel, request) {
  request.txId = client.newTransactionID();
  return channel.sendTransactionProposal(request);
};

const responseInspect = function(results) {
  const proposalResponses = results[0];
  const proposal = results[1];
  const header = results[2];

  if (proposalResponses && proposalResponses.length > 0 &&
    proposalResponses[0].response &&
    proposalResponses[0].response.status === 200) {
    return true;
  }
  return false;
};

const sendOrderer = function(channel, request) {
  return channel.sendTransaction(request);
};

const target = [];
const client = new hfc();

function invoke(opt, param) {
    return enrolUser(client, opt)
      .then(user => {
        if(typeof user === "undefined" || !user.isEnrolled())
          throw "User not enrolled";
  
        channel = initNetwork(client, opt, target);
        const request = {
            targets: target,
            chaincodeId: opt.chaincode_id,
            fcn: 'createPieceOfArt',
            args: param,
            chainId: opt.channel_id,
            txId: null
        };
        return transactionProposal(client, channel, request);
      })
      .then(results => {
        if (responseInspect(results)) {
          const request = {
            proposalResponses: results[0],
            proposal: results[1],
            header: results[2]
          };
          return sendOrderer(channel, request);
        } else {
          throw "Response is bad";
        }
      })
      .catch(err => {
        console.log(err);
        throw err;
      });
};
  
function invokeTransfer(opt, param) {
    return enrolUser(client, opt)
      .then(user => {
        if(typeof user === "undefined" || !user.isEnrolled())
          throw "User not enrolled";
  
        channel = initNetwork(client, opt, target);
        const request = {
            targets: target,
            chaincodeId: opt.chaincode_id,
            fcn: 'transferPieceOfArt',
            args: param,
            chainId: opt.channel_id,
            txId: null
        };
        return transactionProposal(client, channel, request);
      })
      .then(results => {
        if (responseInspect(results)) {
          const request = {
            proposalResponses: results[0],
            proposal: results[1],
            header: results[2]
          };
          return sendOrderer(channel, request);
        } else {
          throw "Response is bad";
        }
      })
      .catch(err => {
        console.log(err);
        throw err;
      });
};

function addPeer(opt, param) {
	console.log("foo");
	return enrolUser(client, opt)
      	.then(user => {
      		console.log("foo2")
        	if(typeof user === "undefined" || !user.isEnrolled())
          		throw "User not enrolled";
	        channel = initNetwork(client, opt, target);
        	let tx_id = client.newTransactionID();
        	console.log("foo3")
			let g_request = {
  				txId :     tx_id
			};
			return channel.getGenesisBlock(g_request)
		})	
		.then((block) => {
  			console.log("foo4")
  			let genesis_block = block;
  			let tx_id = client.newTransactionID();
  			let j_request = {
    				targets : target,
    				block : genesis_block,
    				txId :     tx_id
  			};
  			return channel.joinChannel(j_request);
  		
  		})
  		.then((results) =>{
  			console.log("foo5")
  			if(results && results.response && results.response.status == 200) {
    			console.log("foo6")
  			} else {
    			console.log("foo7")
  			}
		});
}


const options = {
	Org1 : {
      wallet_path: '/home/julio/hlf/FinalExam/question3-nodejsAddsPeer/finalexam/app/certs',
      user_id: 'Org1Admin',
      channel_id: 'test',
      chaincode_id: 'finalexam',
      peer_url: 'grpc://localhost:7051',
      orderer_url: 'grpc://localhost:7050'
    },
    Org2 : {
      wallet_path: '/home/julio/hlf/FinalExam/question3-nodejsAddsPeer/finalexam/app/certs',
      user_id: 'Org2Admin',
      channel_id: 'test',
      chaincode_id: 'finalexam',
      peer_url: 'grpc://localhost:8051',
      orderer_url: 'grpc://localhost:7050'
    },    
    Org3 : {
      wallet_path: '/home/julio/hlf/FinalExam/question3-nodejsAddsPeer/finalexam/app/certs',
      user_id: 'Org3Admin',
      channel_id: 'test',
      chaincode_id: 'finalexam',
      peer_url: 'grpc://localhost:9051',
      orderer_url: 'grpc://localhost:7050'
    }
};

const query = function(opt, param, request) {
  return enrolUser(client, opt)
    .then(user => {
      if(typeof user === "undefined" || !user.isEnrolled()) {
        throw "User not enrolled";
      }
      channel = initNetwork(client, opt, target);
      request.chaincodeId = opt.chaincode_id;
      request.chainId = opt.channel_id;
      request.args = param;
      request.txId = client.newTransactionID();
      return channel.queryByChaincode(request);
    })
    .then(queryResponses => {
      const result=[];

      for(let i = 0; i < queryResponses.length; i++) {
        result.push( queryResponses[i].toString('utf8') );
      }

      return JSON.stringify({ result });
    })
    .catch(err => {
      console.log(err);
      throw err;
    });
}

const requests = {
  queryPieceOfArt: {
    targets: null,
    chaincodeId: null,
    fcn: 'queryPieceOfArt',
    args: null,
    chainId: null,
    txId: null
  },
};

const express = require("express");
const app = express();
const http = require('http');
const bodyParser = require('body-parser');
const path = require('path');

app.engine('html', require('ejs').renderFile);

const server = http.createServer(app).listen(4000, function() {});
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname));
app.set('views', __dirname);

app.post('/addPeer', function(req, res, next) {
  addPeer(options["Org3"], [''])
    .then(() => res.send("Peer added"))
    .catch(err => {
      res.status(500);
      res.send(err.toString());
    });
});


app.post('/invoke', function(req, res, next) {
  const args = req.body.args;
  invoke(options[args[0]], args.slice(1))
    .then(() => res.send("Chaincode invoked"))
    .catch(err => {
      res.status(500);
      res.send(err.toString());
    });
});

app.post('/invokeTransfer', function(req, res, next) {
  const args = req.body.args;
  invokeTransfer(options[args[0]], args.slice(1))
    .then(() => res.send("Chaincode invoked"))
    .catch(err => {
      res.status(500);
      res.send(err.toString());
    });
});

app.get('/API/queryPieceOfArt', function(req, res, next) {
  query(
      options[req.query.org],
      [ req.query.reference.toString() ],
      requests[ "queryPieceOfArt" ])
    .then(result => res.json(result))
    .catch(err => {
      res.status(500);
      res.send(err.toString());
    });
});


app.get('/', function(req, res) {
  res.render('UI.html');
});