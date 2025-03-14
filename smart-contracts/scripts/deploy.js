const { ethers } = require("hardhat");

async function main() {
    const [deployer, freelancer] = await ethers.getSigners(); // ✅ Get accounts

    console.log("Deploying contract with:", deployer.address);
    console.log("Freelancer will be:", freelancer.address);

    const Escrow = await ethers.getContractFactory("Escrow");
    
    const escrow = await Escrow.deploy(freelancer.address, { 
        value: ethers.parseEther("1.0"), // ✅ Send 1 ETH to escrow
    });

    await escrow.waitForDeployment(); // ✅ Wait for deployment

    const escrowAddress = await escrow.getAddress(); // ✅ Get deployed contract address

    console.log("✅ Escrow Contract deployed to:", escrowAddress);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
