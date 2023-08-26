// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;



contract BaboonRank
{
    mapping (address => uint8) _ranks;

    uint256[3] RankPrices;

    function mintRank(uint8 RankIndex) payable public returns(bool)
    {
        require(RankIndex < RankPrices.length && RankIndex > 0, "Invalid Rank Index");
        require(msg.value >= RankPrices[RankIndex], "Price of the rank is higher");

        _ranks[msg.sender] = RankIndex;
        return true;
    }

    function getContractBalance() public view returns(uint256)
    {
        return address(this).balance;
    }

    function getRank() public view returns(uint8)
    {
        return _ranks[msg.sender];
    }

    function getOtherRank(address addr) public view returns(uint8)
    {
        return _ranks[addr];
    }

    constructor()
    {
        RankPrices[0] = 0 wei;
        RankPrices[1] = 1000 wei;
        RankPrices[2] = 2000 wei;
    }
}