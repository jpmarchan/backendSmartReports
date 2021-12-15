const jwt = require('jsonwebtoken');
const config = require('../config')


const verifyToken = async (req, res, next) => {
  let token = req.headers["x-access-token"];

  if (!token) return res.status(403).json({ message: "No token provided" });

  try {
    const decoded = jwt.verify(token, config.SECRET);
    console.log(decoded)
    req.userId = decoded.id;
    next();
  } catch (error) {
    console.log(error)

    return res.status(401).json({ message: "Unauthorized!" });
  }
};

module.exports = {
  verifyToken
}


