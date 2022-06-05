// migrations look at name of contract and not name of the .sol file
// migrate --reset to redo the migration
const Dog = artifacts.require("Dog");
const Proxy = artifacts.require("Proxy");

module.exports = async function (deployer, network, accounts){
  const dog = await Dog.new();
  const proxy = await Proxy.new(dog.address);

  var proxyDog = await Dog.at(proxy.address);
  await proxyDog.setNumberOfDogs(10);
  var numberofDogs = await proxyDog.getNumberOfDogs();
  console.log(numberofDogs.toString());

  // since delegate call is used, 10 is stored on proxy, dogs still is 0
  
}