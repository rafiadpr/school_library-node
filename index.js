const express = require(`express`)
const cors = require(`cors`)
const app = express()
const PORT = 8000
app.use(cors())
app.use(express.static(__dirname))

const memberRoute = require(`./routes/member.route`)
const adminRoute = require(`./routes/admin.route`)
const bookRoute = require(`./routes/book.route`)
const borrowRoute = require(`./routes/borrow.route`)
const auth = require(`./routes/auth.routes`)

app.use(`/member`, memberRoute)
app.use(`/admin`, adminRoute)
app.use(`/book`, bookRoute)
app.use(`/borrow`, borrowRoute)
app.use(`/auth`, auth)

app.listen(PORT, () => {
    console.log(`Server of School's Library runs on port ${PORT}`)
})