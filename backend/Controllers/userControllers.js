const myUser = require("../models/userModel");

const nodemailer = require('nodemailer')

const JWTToken = require("../middleware/jwtToken.js");
const crypto = require("crypto");

exports.registerUser = (req, res, next) => {
    console.log("Hello")
    const { name, email, password } = req.body;
    const newUser = new myUser({ name, email, password })
    newUser.save().then(
        JWTToken(newUser, 201, res))
}

exports.loginUser = async (req, res, next) => {
    const { email, password } = req.body; // Removed unnecessary await
    console.log(email, password);

    if (!email || !password) {
        return res.status(400).send("Please provide the details and fill up all details");
    }

    const requiredUser = await myUser.findOne({ email }).select("+password");

    if (!requiredUser) {
        return res.status(400).send("Please provide the correct email and password");
    }

    const passwordMatched = await requiredUser.comparePassword(password);

    if (!passwordMatched) {
        return res.status(400).send("Please provide the correct email and password");
    }

    // If everything is correct, generate and send the JWT token
    JWTToken(requiredUser, 201, res);
};


exports.forgotPassword = async (req, res, next) => {
    const { email } = req.body
    const user = await myUser.findOne({ email })
    console.log(user)
    if (!user) {
       return  res.status(400).send("This user doesn't exist.Sorry")
    }
    const otp = Math.floor(1000 + Math.random() * 9000);
    const otpExpier = new Date();
    otpExpier.setMinutes(otpExpier.getMinutes() + 1);
    user.otp = otp
    user.otpExpier = otpExpier

    await user.save()
    const transporter = nodemailer.createTransport({
        service: 'gmail',
        host: 'smtp.gmail.com',
        port: 465,
        secure: true,
        auth: {
            user: 'pt55021320@student.ku.edu.np',
            pass: 'hqcg osmq ojna fawd',
        },
    });

    const mailOptions = {
        from: 'pt55021320@student.ku.edu.np',
        to: email,
        subject: 'Password reset OTP',
        text: `Your OTP (It is expired after 1 min): ${otp}`,
    };
    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.log(error)
           return res.status(400).send("There is some error in the request")
        } else {
          return  res.json({
                data: "Your OTP has been sent to the email"
            });
        }
    });

}

exports.resetPassword = async (req, res, next) => {
    const { password, confirmPassword, otp } = req.body
    if (password != confirmPassword) {
       return res.status(400).send("The passwords don't match.Please try again")
    }
    const matchedUser = await myUser.findOne({
        otp: otp,
        otpExpier: { $gt: new Date() }

    })
    console.log(matchedUser)
    if (!matchedUser) {
        console.log("No matched user is available")
        return res.status(400).send("OTP didn't matched or the time is expired")
    } else {
        matchedUser.password = password
        matchedUser.otp = null
        matchedUser.otpExpier = null
        await matchedUser.save()
       return res.status(201).send("Password changed successfully")
    }
}
