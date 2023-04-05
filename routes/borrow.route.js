const express = require(`express`)
const app = express()
app.use(express.json())

const borrowController = require(`../controller/borrow.controller`)
const {authorize} = require(`../controller/auth.controller`)
const {validateBorrow} = require(`../middlewares/borrow-validation`)

app.post("/", borrowController.addBorrowing)
app.put("/update/:id", [authorize], [validateBorrow], borrowController.updateBorrowing)
app.delete("/:id", [authorize], borrowController.deleteBorrowing)
app.get("/return/:id", [authorize], borrowController.returnBook)
app.get("/", borrowController.getBorrow)
app.post("/filter", [authorize], borrowController.filterBorrow)
module.exports = app