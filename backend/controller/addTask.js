const Todo = require('../models/to-do');

exports.addTask = async (req, res) => {
    try {
        const task = req.body.task;
        const existingTask = await Todo.findOne({task});
        if(existingTask) {
            return res.status(400).json({message: "Task already exists"});
        }
        const saveTask = await Todo.create({task});
        res.status(200).json({message: "Task added", task: saveTask});
    } catch (error) {
        res.status(500).json({message: "Internal Server Error"});
    }
}