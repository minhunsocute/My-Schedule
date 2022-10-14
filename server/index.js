//IMPORTS FROM PACKAGES
const express = require("express");
const { default: mongoose } = require("mongoose");
// IMPORTS FROM OTHER FILE 
const authRouter = require();

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://MinhHung:20112002@cluster0.9kjcygv.mongodb.net/?retryWrites=true&w=majority";

//CREATING AN API

// app.get('/', (req, res) => {
//     res.json({ 'name': 'Minh Hung' });
// })

// app.get('/hello-world', (req, res) => {
//     // res.send("Hello world");
//     res.json({ hi: "Hello World" });
// });
// GET, PUT, POST, DELETE, UPDATE->CRUD

mongoose.connect(DB).then(() => {
        console.log("Connection Successful");
    })
    .catch((e) => {
        console.log(e);
    });

app.listen(PORT, () => { // if remove 0.0.0.0 can use local host
    console.log(`connect at port ${PORT} hello`);
});