// console.log("Dwaipayan");
require('dotenv').config();
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');
const socketIo = require('socket.io');

const app = express();
const port = process.env.PORT || 4000;
const server = http.createServer(app);
const io = socketIo(server);  // Attach socket.io to the server

// Use environment variable for MongoDB connection string
const DB = "mongodb+srv://biswastatay73:lljNlmUwvO3QRuWZ@cluster0.oluj3.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

// Socket.io connection event
io.on('connection', (socket) => {
  console.log("Client connected");

  // Event listener for room creation (placeholder logic)
  socket.on('createRoom', ({ nickname }) => {
      console.log(nickname);
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
