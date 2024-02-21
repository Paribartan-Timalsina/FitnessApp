const Exercise=require("../models/exercises")

exports.addExercise=async (req,res,next)=>{
        const {name,aasans,duration,types}=req.body
        const newExercise=await new Exercise({name,aasans,duration,types})
        await newExercise.save().then(()=>{
            return res.status(201).send("Exercise added successfully")
        }
            ).catch((error)=>{
                console.log("error")
                res.status(400).send(error)
            }
                
            )

}
exports.getExercise=async(req,res,next)=>{
    console.log("This API is directly hit")
    const {
    name,
    day,
    weekNumber,
    date,
    completed,
    _id}= req.body
    const exerciseName=await Exercise.findById({_id})
    console.log(exerciseName);
    console.log(name,day,weekNumber,date,completed,_id);
    res.status(200).send(exerciseName)
}