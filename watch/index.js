
/* Setup initial NPM packages */
const RPC_CLIENT = require('bitcoin-rpc-promise')
const express = require('express')
const app = express()

/* Declare llocalhostocal variables */
const auth = {
  user: "user",
  pass: "pass",
  host: "ip", /* Default Recommended */
  port: 26211
}

let node = {
  status: "offline",
  blocks: 0,
  peers: 0
}

/* Initialize RPC connection */
const RPC = new RPC_CLIENT('http://' + auth.user + ':' + auth.pass + '@' + auth.host + ':' + auth.port)


/* Initialize express server */
app.get('/health', function (req, res) {
  res.json(node)
})

app.listen(3000)

/* Fired repeatedly while the node is Offline or Errored, in an attempt to reconnect and verify node health */
function checkRPC () {
  RPC.call('getblockcount').then(blocks => {
    node.status = "online"
    console.log("RPC Response: " + blocks + ", Node status changed to " + node.status)
    updateRPC()
  }).catch(rpcError)
}

checkRPC()

/* Fired repeatedly, updates node information periodically, if online */
function updateRPC () {
  if (node.status === "online") {
    RPC.call('getblockcount').then(blocks => {
      node.blocks = blocks
      RPC.call('getconnectioncount').then(conns => {
        node.peers = conns
        console.log("RPC Updated: " + blocks + " blocks and " + conns + " peers")
      }).catch(rpcError)
    }).catch(rpcError)
  }
}

setInterval(updateRPC, sec(10))

/* Fired when the Monitor catches an RPC error */
function rpcError () {
  node.status = "offline"
  console.error("RPC Error: Node status changed to " + node.status)
  setTimeout(checkRPC, sec(60))
}

/* Converts seconds into miliseconds */
function sec (s) {
  return s * 1000
}