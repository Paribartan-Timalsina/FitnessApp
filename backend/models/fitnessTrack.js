const mongoose=require('mongoose')
const User=require("./userModel")
const Exercise=require("./exercises")
const fitnessTrackSchema=new mongoose.Schema({
    userId:{
        type:mongoose.Schema.Types.ObjectId,
        ref:"User",
        required:true,
    },
    fitnessRoutine:[
        {
            typeofExercise:{
                type:mongoose.Schema.Types.ObjectId,
                ref:"Exercise",
                required:true,
            },
            date:{
                type:Date,
                required:true,
            },
            day:{
                type:String,
                required:true
            },
            weekNumber:{
                type:Number,
                required:true,
            }
            
        }
    ]
})
module.exports=mongoose.model("fitnessTrack",fitnessTrackSchema)