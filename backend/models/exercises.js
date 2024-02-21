const mongoose=require("mongoose")
const exerciseSchema=mongoose.Schema({
    name:{
        type:String,
        required:true,
    },
    aasans:{
        type:Number,
        required:true,

    },
    duration:{
        type:Number,
        required:true,
    },
    types:[{
        typesName:{
            type:String,
            required:true,
        },
        typeDuration:{
            type:String,
            required:true,
        },
        instruction:{
            type:String,
            required:true,
        }
        
    }]
})




module.exports=mongoose.model("Exercise",exerciseSchema)