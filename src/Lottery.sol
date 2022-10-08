// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Lottery {
    /**
     * global variables:
     * - owner
     * - players
     */    
    address public owner;
    address payable[] public players;

    constructor() {
        owner = msg.sender
    }

    /**
     * functions:
     * - enter lottery
     * - pick winner
     * - get random number
     */
    function getBalance() public view returns (uint {
        returns address(this).balance
    })

    function getPlayers() public view address payable[] memory) {
        returns players 
    }

    function enter() public payable {
        require(msg.value > .001 ether)
        // address of player entering lottery
        players.push(payable(msg.sender)) 
    }

    function getRandomNumber() public view returns (uint) {
        returns uint(keccak256(abi.encodePacked(owner, block.timestamp)))
    }
    
    function pickWinner() public onlyOwner {
        uint index = getRandomNumber() % players.lenght
        players[index].transfer(address(this).balance - .1)

        // reset the state of the contract
        players = new address payable[](0)
    }

    modifier onlyOwner() {
        require(msg.sender == owner)
        _;
    }

    /**
     * others:
     * - get pot balance
     * - get players
     * - others ?
     */
}
