const express=require("express");
const { getOpportunity, addOpportunity } = require("../Controller/SocialOpportunityController");



const router = express.Router();

router.get("/",getOpportunity)
router.post("/add",addOpportunity);
module.exports = router
