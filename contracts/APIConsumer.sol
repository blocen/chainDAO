// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

/**
 * Request testnet LINK and ETH here: https://faucets.chain.link/
 * Find information on LINK Token Contracts and get the latest ETH and LINK faucets here: https://docs.chain.link/docs/link-token-contracts/
 */

/**
 * THIS IS AN EXAMPLE CONTRACT WHICH USES HARDCODED VALUES FOR CLARITY.
 * PLEASE DO NOT USE THIS CODE IN PRODUCTION.
 */
contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    uint256 public volume;

    address private oracle;
    bytes32 private jobId;
    uint256 private fee;

    /**
     * Network: Kovan
     * Oracle: 0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8 (Chainlink Devrel
     * Node)
     * Job ID: d5270d1c311941d0b08bead21fea7747
     * Fee: 0.1 LINK
     *
     * Rinkeby: 0x7AFe1118Ea78C1eae84ca8feE5C65Bc76CcF879e
     * c8084988f0b54520ba17945c4a2ab7bc
     */
    constructor() {
        setPublicChainlinkToken();
        // oracle = 0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8;
        // jobId = "d5270d1c311941d0b08bead21fea7747";
        oracle = 0x7AFe1118Ea78C1eae84ca8feE5C65Bc76CcF879e;
        jobId = "c8084988f0b54520ba17945c4a2ab7bc";
        fee = 0.1 * 10**18; // (Varies by network and job)
    }

    /**
     * Create a Chainlink request to retrieve API response, find the target
     * data, then multiply by 1000000000000000000 (to remove decimal places from data).
     */
    function requestVolumeData() public returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfill.selector
        );

        // Set the URL to perform the GET request on
        // https://hub.snapshot.org/graphql?operationName=Proposals&query=query%20Proposals%20%7B%0A%20%20proposals%20(%0A%20%20%20%20first%3A%2010%2C%0A%20%20%20%20skip%3A%200%2C%0A%20%20%20%20where%3A%20%7B%0A%20%20%20%20%20%20space_in%3A%20%5B%22bdudao.eth%22%2C%20%22carbinocapital.eth%22%5D%2C%0A%20%20%20%20%20%20%23%20space_in%3A%20%5B%22bdudao.eth%22%5D%2C%0A%20%20%20%20%20%20%23%20space_in%3A%20%5B%22enabel.eth%22%5D%2C%0A%20%20%20%20%20%20%23%20state%3A%20%22closed%22%20%23%20todo%3A%20only%20closed%2Ffinished%0A%20%20%20%20%20%20%23%20scores_state_in%3A%20%5B%22final%22%5D%0A%20%20%20%20%20%20type_in%3A%20%5B%22single-choice%22%2C%20%22basic%22%5D%0A%20%20%20%20%20%20%0A%20%20%20%20%7D%2C%0A%20%20%20%20orderBy%3A%20%22created%22%2C%0A%20%20%20%20orderDirection%3A%20desc%0A%20%20)%20%7B%0A%20%20%20%20id%0A%20%20%20%20space%20%7B%0A%20%20%20%20%20%20id%0A%20%20%20%20%7D%0A%20%20%20%20type%0A%20%20%20%20title%0A%20%20%20%20choices%0A%20%20%20%20scores_total%0A%20%20%20%20scores_state%0A%20%20%20%20scores_updated%0A%20%20%20%20scores_by_strategy%0A%20%20%20%20votes%0A%20%20%20%20scores%0A%20%20%7D%0A%7D%0A%0A%0A

        request.add(
            "get",
            "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD"
        );

        // Set the path to find the desired data in the API response, where the response format is:
        // {"RAW":
        //   {"ETH":
        //    {"USD":
        //     {
        //      "VOLUME24HOUR": xxx.xxx,
        //     }
        //    }
        //   }
        //  }
        // request.add("path", "RAW.ETH.USD.VOLUME24HOUR");

        // multi response?
        request.add("path", "data.proposals.scores");

        // Multiply the result by 1000000000000000000 to remove decimals
        int256 timesAmount = 10**18;
        request.addInt("times", timesAmount);

        // Sends the request
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    /**
     * Receive the response in the form of uint256
     */
    function fulfill(bytes32 _requestId, uint256 _volume)
        public
        recordChainlinkFulfillment(_requestId)
    {
        volume = _volume;
    }

    // function withdrawLink() external {} - Implement a withdraw function to avoid locking your LINK in the contract
}
