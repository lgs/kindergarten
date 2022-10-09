// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract Lottery {
    /**
     * global variables:
     * - owner
     * - commission
     * - players
     */
    address public owner;
    uint public commission;
    address payable[] public players;

    constructor() {
        owner = msg.sender;
    }

    /**
     * functions:
     * - enter lottery
     * - pick winner
     * - get random number
     */
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }

    function enter() public payable {
        require(msg.value > .001 ether);

        // address of player entering lottery
        players.push(payable(msg.sender));
    }

    function getRandomNumber() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(owner, block.timestamp)));
    }

    /** function pickWinner() public onlyOwner {
        uint index = getRandomNumber() % players.lenght;
        players[index].transfer(address(this).balance - 5 ether);

        // reset the state of the contract
        players = new address payable[](0);
    } */
    function pickWinner() public onlyOwner {
        uint index = getRandomNumber() % players.length;
        commission = (address(this).balance * 17) / 100;
        console.log("commission: ", commission);

        players[index].transfer(address(this).balance - commission);

        // reset the state of the contract
        players = new address payable[](0);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * others:
     * - get pot balance
     * - get players
     * - others ?
     */
}
