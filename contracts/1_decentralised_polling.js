const Polling = artifacts.require("./Polling.sol");

module.exports = function(deployer) {
    deployer.deploy(Polling);
}