# 🎟️ ConquerEvents Smart Contract

Este es un **smart contract** desarrollado en **Solidity** que permite la creación de eventos, la compra y devolución de tickets. Se basa en el estándar **ERC1155** y utiliza la biblioteca de **OpenZeppelin** para su gestión segura.

## 📌 Características

- Creación y cancelación de eventos.
- Compra y reembolso de tickets.
- Transferencia de tickets entre usuarios.
- Validación de tickets.
- Gestión de fondos por parte del propietario del contrato.

## 🚀 Instalación y Uso

### 1️⃣ Clonar el repositorio
```sh
 git clone <URL_DEL_REPOSITORIO>
 cd <NOMBRE_DEL_REPOSITORIO>
```

### 2️⃣ Implementación en Remix
1. Abre [Remix IDE](https://remix.ethereum.org/).
2. Carga el archivo `ConquerEvents.sol` en Remix.
3. Compila el contrato con el compilador de Solidity.
4. Despliega el contrato en una red de pruebas (Goerli, Sepolia, etc.) o en una red local como Hardhat/Ganache.

### 3️⃣ Interacción con el Contrato

#### 🛠️ Crear un evento
```solidity
createEvent("Evento Blockchain", 100, 0.05 ether);
```

#### 🎫 Comprar tickets
```solidity
buyTickets(1, 2);
```

#### 🔄 Transferir tickets
```solidity
transferTickets(0xRecipientAddress, 1, 1);
```

#### 🔍 Validar tickets de un usuario
```solidity
validateTicket(0xUserAddress, 1);
```

#### 🔄 Reembolso de tickets
```solidity
refundTickets(1, 1);
```

#### 💰 Retirar fondos (solo el owner)
```solidity
withdraw();
```

## 📄 Eventos Emitidos
El contrato emite los siguientes eventos para monitoreo:
- `newEvent(uint256 id, string name, uint256 totalSupply, uint256 price)` → Cuando se crea un nuevo evento.
- `TicketsBought(address buyer, uint256 id, uint256 amount)` → Cuando se compran tickets.

## 🛠️ Tecnologías Utilizadas
- Solidity
- Remix IDE
- OpenZeppelin
- Ethers.js / Web3.js
- Hardhat (opcional para pruebas y despliegue avanzado)

## ⚠️ Consideraciones
- Prueba el contrato en una red de pruebas antes de desplegarlo en la mainnet.
- La devolución de tickets puede incluir costos de gas.

## 📝 Licencia
Este proyecto está bajo la licencia **GPL-3.0**.

---
✉️ Para dudas o mejoras, abre un issue o contáctame.
