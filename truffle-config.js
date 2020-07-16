const HDWalletProvider = require("@truffle/hdwallet-provider");
const mnemonic = "orange apple banana ... ";

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/<INFURA_PROJECT_ID>")
      },
      network_id: 3
    }
  },

  compilers: {
    solc: {
      version: "0.6.8"
    }
  }
}
