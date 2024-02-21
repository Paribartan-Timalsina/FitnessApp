const express=require("express")
const cookieParser=require("cookie-parser")
const bodyParser = require("body-parser")
const cors=require('cors');

const app=express()
const user=require("./routes/userRoutes")
const fitness=require("./routes/fitnessRoutes")
const exercises = require("./routes/exerciseRoutes")
app.use(express.json());
app.use(cookieParser())

app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors())
app.use("/user",user)
app.use("/fitness",fitness)
app.use("/exercise",exercises)

module.exports = app

