const fitnessTrack=require("../models/fitnessTrack")
const Exercise=require("../models/exercises")
const myUser=require("../models/userModel")
const jwt=require("jsonwebtoken")
const moment=require("moment")
const dotenv=require("dotenv")
dotenv.config({path:"../config/config.env"})

exports.myFitness= async (req,res,next)=>{
return res.send("This page sends the score of the fitness along with the calories burnt and other measures")
}


exports.fitnessRoutine = async (req, res, next) => {
    const tobesendData = [];
    const userToken = req.cookies;
    console.log("Hello, we are in the page");
  
    if (!userToken.token) {
      return res.status(400).send("Unauthorized");
    }
  
    try {
      const decodedToken = jwt.verify(userToken.token, process.env.JWT_SECRET);
      const user = await fitnessTrack.findOne({ userId: decodedToken.id });
  
      // Use Promise.all to wait for all asynchronous operations to complete
      const exercisePromises = user.fitnessRoutine.map(async (exerciseType) => {
        const typeofExercise = await Exercise.findById(exerciseType.typeofExercise);
        return { _id:exerciseType.typeofExercise,name: typeofExercise.name, day: exerciseType.day, weekNumber: exerciseType.weekNumber, date: exerciseType.date };
      });
  
      const exercises = await Promise.all(exercisePromises);
  
      // Now 'exercises' contains the results of all the asynchronous operations
      tobesendData.push(...exercises);
      console.log(tobesendData);
  
      res.status(200).send(tobesendData);
    } catch (error) {
      console.error("Error:", error);
      res.status(500).send("Internal Server Error");
    }
  };
  

exports.addFitness=async (req,res,next)=>{
    let newRoutine=[]
    const userToken=req.cookies
    const {fitnessRoutine}=req.body
    console.log(fitnessRoutine)
    fitnessRoutine.map((routine)=>{
        console.log(routine.date)
        const firstDay = new Date(new Date(routine.date).getFullYear(), new Date(routine.date).getMonth(), 1);
    const dayOfWeek = firstDay.getDay() - 1; // Adjust for zero-based index and Sunday as the first day
    const firstWeekStart = new Date(firstDay.setDate(firstDay.getDate() - dayOfWeek));
    
    const diffInDays = Math.floor((new Date(routine.date) - firstWeekStart) / (24 * 60 * 60 * 1000));
    const weeknumber = parseInt(Math.ceil((diffInDays + 1) / 7));
    console.log(weeknumber)
    let reqDay = new Date(routine.date).toLocaleString('en-US', { weekday: 'long',});
    newRoutine.push({typeofExercise:routine.typeofExercise,date:routine.date,weekNumber:weeknumber,day:reqDay})
    })

    //console.log(userToken)
    if(!userToken){
        return res.status(400).send("unauthorized")
    }
    const decodedToken=jwt.verify(userToken.token,process.env.JWT_SECRET)
    console.log(decodedToken)
   const user = await fitnessTrack.findOne({userId:decodedToken.id})


if(!userToken){
return res.send("You aren't logged in so please login to continue")
}
if(user===null){
    console.log("Here we are")

    const newUserRoutine =await new fitnessTrack({userId:decodedToken.id,fitnessRoutine:[...newRoutine]})
    console.log(newUserRoutine)
    await newUserRoutine.save() 
    console.log(newUserRoutine)
    
}
else{
    const newFitnessRoutine=[...user.fitnessRoutine,...newRoutine]
    console.log(newFitnessRoutine)
    // console.log(requiredFitness.fitnessRoutine)
    user.fitnessRoutine=await [...newFitnessRoutine]
 //  console.log(requiredFitness.fitnessRoutine)
   user.save()
   // console.log(requiredFitness)
}


return res.status(200).send('Fitness routines added successfully');
}