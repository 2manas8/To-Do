const Todo=require('../models/to-do');

exports.getTask = async (req, res) => {
    try {
        const getAllTask = await Todo.find();
        res.status(200).json({message: "Task fetched", task: getAllTask});
    } catch (error) {
        res.status(500).json({message: "Internal Server Error"});
    }
}