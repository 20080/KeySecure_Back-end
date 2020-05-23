var AllTransactions = artifacts.require("./AllTransactions.sol");

module.exports = function(deployer) {
  deployer.deploy(AllTransactions);
};
