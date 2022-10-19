const Web3 = require('web3')

const RPC_URL = ''

const abi = [
  {
    inputs: [],
    stateMutability: 'nonpayable',
    type: 'constructor',
  },
  {
    inputs: [
      {
        internalType: 'string',
        name: '_name',
        type: 'string',
      },
    ],
    name: 'updateName',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [],
    name: 'name',
    outputs: [
      {
        internalType: 'string',
        name: '',
        type: 'string',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
]

const CONTRACT_ADDRESS = '0xb88999c2Ba73BF729310b12Bf72512BaF0B450c2'

const PRIVATE_KEY = ''

const web3 = new Web3(new Web3.providers.HttpProvider(RPC_URL))

// Returns Block number
// web3.eth.getBlockNumber()
//   .then(
//     (res) => console.log(res)
//   )

// Returns balance
// web3.eth.getBalance("0x8e05F65a02dd0E0cF7701d7AD6d8BF7c936faf45")
//   .then(
//     (res) => {
//       console.log(res)
//       const balanceInEther = web3.utils.fromWei(res)
//       console.log(balanceInEther)
//     }
// )

// Sending Ether
// web3.eth.accounts.signTransaction({
//     to: '0x2FdFB230b20C3C57EC1C103a289D8c7eeE304C55',
//     value: web3.utils.toWei("0.005", "ether"),
//     gas: 2000000
// }, PRIVATE_KEY)
//   .then(async (tx) => {
//     const txHash = await web3.eth.sendSignedTransaction(tx.rawTransaction)
//     console.log(txHash)
//   });

// Interaction with Contracts
const contract = new web3.eth.Contract(abi, CONTRACT_ADDRESS)

// Return the name
contract.methods
  .name()
  .call()
  .then((name) => {
    console.log(name)
  })

// Set the name
// web3.eth.accounts.signTransaction({
//     to: CONTRACT_ADDRESS,
//     gas: 2000000,
//     data: contract.methods.updateName("Ihuoma").encodeABI()
// }, PRIVATE_KEY)
//   .then(async (tx) => {
//     const txHash = await web3.eth.sendSignedTransaction(tx.rawTransaction)
//     console.log(txHash)
// });
