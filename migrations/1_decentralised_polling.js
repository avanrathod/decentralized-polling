const Polling = artifacts.require("polling");

module.exports = function(deployer) {
    deployer.deploy(Polling);
}