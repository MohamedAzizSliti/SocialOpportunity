const express = require("express");
const mysql = require("mysql");
const bodyParser=require('body-parser')
const app = express();



var mysqlConnection= mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"0000",
    database:"DB",
})
app.use(express.json());

mysqlConnection.connect((err)=>{
    if(!err){
        console.log('====================================');
        console.log('Connection Successfully');
        console.log('====================================');
    }
    else {
        console.log('====================================');
        console.log('Connection Failed');
        console.log('====================================');
    }
})

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Example app listening on port ${port}!`));

app.get("/", (req, res) => res.send("Hello World!"));
app.get("/api/socialopportunity",(res,req)=>{
    mysqlConnection.query('SELECT * FROM opportunity',(err,rows,fields)=>{
        if(!err){
            req.send(rows);
        }
        else{
            console.log(err)
        }
    })
})

app.post("/api/socialopportunity/add",(req, res) => {
    let {name,description,category,date,address} =req.body;
    let sql = `INSERT INTO opportunity (Name, Description,Category,Date,Address) VALUES ('${name}', '${description}','${category}','${date}','${address}' )`;
    console.log(sql)
    mysqlConnection.query(sql, (err, rows, fields)=>{
        if(!err){
            res.status(201).send({message: "Opportunity added successfully"});
        }
        else{
            res.status(400).send({message: "Error adding opportunity"+err});
        }
    })
})


app.put("/api/socialopportunity/favorite/:id", (req, res) => {
    let id = req.params.id;
    let sql = `SELECT Favorite FROM opportunity WHERE idopportunity = ?`;
    mysqlConnection.query(sql, [id], (err, rows, fields) => {
        if (!err) {
            if (rows.length > 0) {
                let newValue = !rows[0].Favorite;
                sql = `UPDATE opportunity SET Favorite = ${newValue} WHERE idopportunity = ?`;
                mysqlConnection.query(sql, [id], (err, rows, fields) => {
                    if (!err) {
                        res.status(200).send({ message: "Opportunity favorite updated successfully" });
                    } else {
                        res.status(400).send({ message: "Error updating opportunity" });
                    }
                });
            } else {
                res.status(404).send({ message: "Opportunity not found" });
            }
        } else {
            res.status(400).send({ message: "Error adding opportunity" });
        }
    });
});

