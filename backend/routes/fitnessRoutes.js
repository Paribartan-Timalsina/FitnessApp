const express=require("express")
const { myFitness, fitnessRoutine, addFitness } = require("../Controllers/fitnessContoller")
const router=express.Router()

router.route("/myfitness").get(myFitness)
router.route("/fitnessroutine").get(fitnessRoutine)
router.route("/addroutine").post(addFitness)

module.exports=router