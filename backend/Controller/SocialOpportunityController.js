


const getOpportunity = async (req, res) => {
    console.log("aaaaaa");
    await con.select("*").from("opportunity").then((data) => {
      res.status(200).json({
        status: "success",
        data: data,
      });
    });
  };
   const addOpportunity= async (req, res) => {
    const { name, description, category,date,address } = req.body;
  
    // error check
    const { errors } = validationResult(req);
    if (!(errors.length === 0)) {
      return res.status(400).json({
        success: false,
        errors
      })
    }
    try {
  
  
  
      const newopportunity = { name, description, category,date,address};
  
      await con
        .insert(newopportunity)
        .into("opportunity");
  
  
  
      return res.status(200).json({
        message: "Opportunity added successfully",
      });
  
    } catch (error) {
      return res.status(400).json({
        message: err,
      })
    }
  
  };

  module.exports ={getOpportunity,addOpportunity}