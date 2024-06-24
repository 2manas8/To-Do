const Todo=require('../models/to-do');

exports.deleteTask = async (req, res) => {
    try {
        //get id from params
        const task = req.params.id;
        const existingTask = await Todo.findOne({_id: task});
        if(!existingTask) {
            return res.status(400).json({message: "Task Not Found"});
        }
        const deleteTask = await Todo.deleteOne({
            _id: task
        });
        res.status(200).json({message: "Task deleted", task: deleteTask});
    } catch (error) {
        res.status(500).json({message: "Internal Server Error"});
    }
}