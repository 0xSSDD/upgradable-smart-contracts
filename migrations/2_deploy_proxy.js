// migrations look at name of contract and not name of the .sol file
const Dog = artifacts.require("Dog");
const Proxy = artifacts.require("Proxy");

module.exports = async function (deployer, network, accounts){
  const dog = await Dog.new();
  const proxy = await Proxy.new(dog.address);
}