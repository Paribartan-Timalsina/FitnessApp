const express=require("express")
const router=express.Router()
const {addExercise,getExercise}=require("../Controllers/exerciseController")
router.route("/addexercise").post(addExercise)
router.route("/myexercise").post(getExercise)

module.exports=router