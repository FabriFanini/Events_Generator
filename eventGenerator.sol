// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ConquerEvents is ERC1155, Ownable {
    //Errors
    error AlreadyCanceled();

    //Events
    event newEvent(uint256 id, string name, uint256 totalSupply, uint256 price);

    //Variables
    uint256 eventId;

    //Struct

    struct Event {
        uint256 id;
        string name;
        uint256 totalSupply;
        uint256 availableTickets;
        uint256 price;
        bool isActive;
    }

    //Mappings
    mapping (uint256 => Event) public _events;

    //Constructor
    constructor () ERC1155("https://api.example/metadata/{id}.json") Ownable(msg.sender) {
        eventId = 0;
    }

    //Functions
    function createEvent(string memory _name, uint256 _totalSupply, uint256 _price) external onlyOwner{
        eventId = eventId + 1;

        _events[eventId]= Event({
            id:eventId,
            name: _name,
            totalSupply: _totalSupply,
            availableTickets: _totalSupply,
            price: _price,
            isActive: true
        });

        emit newEvent(eventId, _name, _totalSupply, _price);
    }

    function cancelEvent(uint256 _eventId) external onlyOwner{
        if (!_events[_eventId].isActive){
            revert AlreadyCanceled();
        }

        _events[eventId].isActive = false;
    }
}