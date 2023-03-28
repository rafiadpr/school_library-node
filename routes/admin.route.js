const express = require(`express`)
const app = express()
app.use(express.json())

const adminController = require(`../controller/admin.controller`)
const {authorize} = require(`../controller/auth.controller`)
let {validateAdmin} = require(`../middlewares/admin-validation`)

app.get("/", adminController.getAllAdmin)
app.post("/", [authorize], [validateAdmin], adminController.addAdmin)
app.post("/find", [authorize], adminController.findAdmin)
app.put("/:id", [authorize], adminController.updateAdmin)
app.delete("/:id", [authorize], adminController.deleteAdmin)
module.exports = app;