const express = require(`express`)
const app = express()
app.use(express.json())

const bookController = require(`../controller/book.controller`)
const {midOne} = require(`../middlewares/simple-middleware`)

app.get("/", bookController.getAllBooks)
app.post("/find", bookController.findBooks)
app.post("/", bookController.addBooks)
app.put("/:id", bookController.updateBook)
app.delete("/:id", bookController.deleteBook)
module.exports = app