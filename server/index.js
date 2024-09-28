// console.log("Dwaipayan");
require('dotenv').config();
const express = require('express');
const http = require('http');
const app = express();
const port = process.env.PORT || 3000;
const server = http.createServer(app);
const mongoose = require('mongoose');
const io = require('socket.io')(server);

const DB = "mongodb+srv://biswastatay73:lljNlmUwvO3QRuWZ@cluster0.oluj3.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

mongoose
  .connect(DB)
  .then(() => {
    console.log('Connection Successful');
  })
  .catch((e) => {
    console.log(e.toString());
  });

// middleware
app.use(express.json());

server.listen(port, () => {
  console.log(`Server started at: ${port}`);
});