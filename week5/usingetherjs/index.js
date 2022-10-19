const { ethers } = require('ethers')

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

const provider = new ethers.providers.JsonRpcProvider(RPC_URL)

// Look up the current block number
// provider.getBlockNumber()
//   .then((res) => console.log(res)
// )

// // Get the balance of an account (by address or ENS name, if supported by network)
// provider.getBalance("0x8e05F65a02dd0E0cF7701d7AD6d8BF7c936faf45")
//   .then(
//   (res) => {
//     console.log(res)
//     // Often you need to format the output to something more         user-friendly,
//     // such as in ether (instead of wei)
//     const balanceInEther = ethers.utils.formatEther(res)
//     console.log(balanceInEther)
//   }
// )

// Signer
const signer = new ethers.Wallet(PRIVATE_KEY)

// Signer connected to a provider
const signerWithProvider = signer.connect(provider)

// Send ether to an ens name/address.
// const tx = signerWithProvider.sendTransaction({
//   to: "0xd19BE0d119b911C454bf352caB895f0Fc51f521c",
//   value: ethers.utils.parseEther("0.05")
// });

// Interact with a contract
// const NAMER_CONTRACT = new ethers.Contract(CONTRACT_ADDRESS, abi, signerWithProvider);

// NAMER_CONTRACT.name().
//   then(
//     (res) => {
//       console.log(res)
//     }
//   )

// NAMER_CONTRACT.updateName("Chiamaka").
//   then(
//     (res) => {
//       console.log(res)
//     }
//   )
