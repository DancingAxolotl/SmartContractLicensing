const TieredLicense = artifacts.require("TieredLicense");

module.exports = function(deployer) {
  deployer.deploy(TieredLicense); // Ignore migrations
};
