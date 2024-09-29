require('dotenv').config();
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');
const socketIo = require('socket.io');

const app = express();
const port = process.env.PORT || 4000;
const server = http.createServer(app);
const Room = require('./models/rooms');
const io = socketIo(server);  // Attach socket.io to the server

// MongoDB connection string
const DB = "mongodb+srv://biswastatay73:lljNlmUwvO3QRuWZ@cluster0.oluj3.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

// Socket.io connection event
io.on('connection', async (socket) => {
  console.log("Client connected");

  // Event listener for room creation
  socket.on('createRoom', async ({ nickname }) => {
    try {
      console.log(`Nickname received: ${nickname}`);

      // Create a new room and add the player
      let room = new Room();
      let player = {
        socketID: socket.id,
        nickname,
        playerType: 'X',
      };
      room.players.push(player);
      room.turn = player;

      // Save the room in MongoDB
      room = await room.save();
      console.log('Room created:', room);

      const roomId = room._id.toString();

      // Join the player to the room
      socket.join(roomId);

      // Emit room success event to the client
      io.to(roomId).emit('CreateRoomSuccess', room);
    } catch (error) {
      console.log('Room creation error:', error);
    }
  });

  // Disconnect event
  socket.on('disconnect', () => {
    console.log("Client disconnected");
  });
});

// MongoDB connection
mongoose
  .connect(DB)
  .then(() => {
    console.log('MongoDB Connection Successful');
  })
  .catch((error) => {
    console.error('MongoDB Connection Failed:', error);
  });

// Middleware for parsing JSON
app.use(express.json());

// Start the server
server.listen(port, () => {
  console.log(`Server started at: http://localhost:${port}`);
});
