const dotenv =require('dotenv')
dotenv.config({path:"./config/config.env"})
const app=require("./app.js")
const connectDatabase=require("./models/database.js")
const user=require("./routes/userRoutes")
const fitness=require("./routes/fitnessRoutes")
//handling uncaught exception
process.on("uncaughtException", (err) => {
    console.log(`Error:${err.message}`);
    console.log("Shutting Down Server due to Unhandled Exception");
    process.exit(1);
  });

connectDatabase();



const server=app.listen(process.env.PORT,()=>{
    console.log(`APP IS RUNNING ON PORT ${process.env.PORT}`)
})


//Unhandled Promise Rejection
process.on("unhandledRejection", (err) => {
    console.log(`Error:${err.message}`);
    console.log("Shutting Down Server due to Unhandled Promise Rejection");
    server.close(() => {
      process.exit(1);
    });
  });





