const express = require(`express`)
const app = express()
app.use(express.json())

const memberController = require(`../controller/member.controller`)
const {authorize} = require(`../controller/auth.controller`)
const {validator} = require(`../middlewares/member-validation`)

app.get("/", memberController.getAllMember)
app.get("/:id", memberController.getMember)
app.post("/", memberController.addMember)
app.post("/find", [authorize], memberController.findMember)
app.put("/:id", [authorize], memberController.updateMember)
app.put("/photo/:id", [authorize], memberController.photoMember)
app.delete("/:id", memberController.deleteMember)
module.exports = app