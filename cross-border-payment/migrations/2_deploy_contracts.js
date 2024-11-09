// const SimplePayment = artifacts.require("SimplePayment");

// module.exports = function(deployer) {
//   const exchangeRateINR = 80000; // Example value for INR rate
//   const exchangeRateBDT = 95000; // Example value for BDT rate

//   deployer.deploy(SimplePayment, exchangeRateINR, exchangeRateBDT, { gas: 5000000 });

// };

// const CrossBorderPayment = artifacts.require('CrossBorderPayment');

// module.exports = function(deployer) {
//   deployer.deploy(CrossBorderPayment);
// };

const CrossBorderPayment = artifacts.require("CrossBorderPayment");

module.exports = async function(deployer) {
  // const estimatedGas = await web3.eth.estimateGas({ data: CrossBorderPayment.bytecode });
  deployer.deploy(CrossBorderPayment);
};
