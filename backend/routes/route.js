const express= require('express')
const router = express.Router()

const {addTask} = require('../controller/addTask')
router.post('/add', addTask);

const {getTask} = require('../controller/getTask')
router.get('/get', getTask);

const {deleteTask} = require('../controller/deleteTask')
router.delete('/delete/:id', deleteTask);

const {taskComplete} = require('../controller/taskComplete')
router.put('/complete/:id', taskComplete);


module.exports = router