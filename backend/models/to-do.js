const mongoose = require('mongoose')

mongoose.connect('mongodb+srv://dasmp123:ETViIPFnBvngwSia@to-do.vzcz2gw.mongodb.net/items')

const ToDoSchema = new mongoose.Schema({
    task: String
})

const ToDoModel = mongoose.model("to-do_list", ToDoSchema)

module.exports = ToDoModel