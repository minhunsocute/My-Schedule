console.log("Hello");

// run sever

const express = require("express");
const PORT = 3000;
const app = express();

//CREATING AN API
app.get('/hello-world', (req, res) => {
    res.send("Hello world");
});
// GET, PUT, POST, DELETE, UPDATE->CRUD

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connect at port ${PORT} hello`);
});