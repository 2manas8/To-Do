const Todo = require('../models/to-do');

exports.taskComplete = async (req, res) => {
    try {
        const taskId = req.params.id;
        const existingTask = await Todo.findOne({_id: taskId});
        if(!existingTask) {
            return res.status(400).json({message: "Task Not Found"});
        }
        const taskComplete = await Todo.updateOne({
            _id: taskId
        }, {
            $set: {
                done: true
            }
        });
        res.status(200).json({message: "Task Updated", task: taskComplete});
    } catch (error) {
        res.status(500).json({message: "Internal Server Error"});
    }
}