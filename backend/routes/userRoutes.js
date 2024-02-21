const express=require("express")
const JWT=require("jsonwebtoken")
const JWTToken=require("../middleware/jwtToken")
const router=express.Router()
const myUser=require("../models/userModel")
const {registerUser,loginUser,forgotPassword,resetPassword}=require("../Controllers/userControllers")
router.route("/register").post(registerUser)
router.route("/login").post(loginUser)
router.route("/forgotpassword").put(forgotPassword)
router.route("/resetpassword").post(resetPassword)


module.exports=router