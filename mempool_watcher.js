const { ethers } = require("ethers");

async function watchMempool() {
    const provider = new ethers.WebSocketProvider(process.env.WSS_RPC);
    provider.on("pending", (txHash) => {
        // Logic to decode transaction and check for large price impacts
        console.log("Analyzing potential opportunity in tx:", txHash);
    });
}
