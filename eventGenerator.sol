// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ConquerEvents is ERC1155, Ownable {
    //Errors
    error AlreadyCanceled();
    error CanceledEvent();
    error NonAvailableTickets();
    error InsufficientBalance();

    //Events
    event newEvent(uint256 id, string name, uint256 totalSupply, uint256 price);
    event TicketsBought(address to, uint256 id, uint256 amount);

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

    function buyTickets (uint256 id, uint256 amount) external payable{
        Event storage _event = _events[id];

        //Si el evento esta cancelado deberia dar un error
        if (!_event.isActive){
            revert CanceledEvent();
        }
        // si la cantidad de tickets es mayot a las disponibles deberia dar poblemas
        if (_event.availableTickets < amount){
            revert NonAvailableTickets();
        }

        uint256 totalCost = amount * _event.price;
        //Si el dinero en cuenta es menor a lo que salen las entradas deberia dar error
        if (msg.value < (totalCost)){
            revert InsufficientBalance();
        }

        _mint(msg.sender, id, amount, "");

        uint256 refund = msg.value - totalCost;

        if (refund > 0){
            payable(msg.sender).transfer(refund); 
        }

        emit TicketsBought(msg.sender, id, amount);

        _event.availableTickets = _event.availableTickets - amount;
    }

    function withdraw() external onlyOwner{
        payable(owner()).transfer(address(this).balance);
    }
    
}