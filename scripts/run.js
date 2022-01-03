const main = async () => {
  const gameContractFactory = await hre.ethers.getContractFactory(
    "GenericGame"
  );
  const gameContract = await gameContractFactory.deploy(
    ["Poseidon", "Zeus", "Ares"],
    [
      "https://www.kindpng.com/picc/m/249-2498164_almighty-reels-realm-of-poseidon-almighty-reels-realm.png",
      "https://www.kindpng.com/picc/m/231-2315247_zeus-png-zeus-greek-god-zeus-transparent-png.png",
      "https://www.kindpng.com/picc/m/50-505387_freetoedit-ares-gods-greek-mythology-god-of-war.png",
    ],
    [600, 420, 1000],
    [300, 380, 260]
  );
  await gameContract.deployed();
  console.log("Contract deployed to:", gameContract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();
