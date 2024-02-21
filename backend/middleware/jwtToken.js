const JWTToken=(newUser,statusCode,res)=>{
const token=newUser.getJWTToken();
const options = {
    expires: new Date(
      Date.now() + process.env.COOKIE_EXPIRATION * 24 * 60 * 60 * 1000
    ),
    httpOnly: true,
  };
  res.status(statusCode).cookie("token", token, options).json({
    success: true,
    token,
  });
}
module.exports=JWTToken