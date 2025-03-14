const { ethers } = require("hardhat");

async function main() {
    const [client, freelancer] = await ethers.getSigners();  // Get accounts
    const escrowAddress = "0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0"; // Replace with actual deployed contract address
    const Escrow = await ethers.getContractFactory("Escrow");

    // ✅ Attach contract using the `signer`
    const escrow = new ethers.Contract(escrowAddress, Escrow.interface, client); // Use `client` as signer

    console.log("Client approving...");
    const approveTx = await escrow.connect(client).approve();
    await approveTx.wait();
    console.log("✅ Client Approved");

    console.log("Freelancer approving...");
    const freelancerApproveTx = await escrow.connect(freelancer).approve();
    await freelancerApproveTx.wait();
    console.log("✅ Freelancer Approved");

    console.log("Releasing funds...");
    const releaseTx = await escrow.connect(client).releaseFunds(); // ✅ Use `client` to send transactions
    await releaseTx.wait();
    console.log("✅ Funds Released to Freelancer");
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
