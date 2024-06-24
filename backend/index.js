const express = require('express')
const add_route = require('./routes/add_task')
const get_route = require('./routes/get_tasks')
const update_route = require('./routes/task_complete')
const delete_route = require('./routes/delete_task')

const port = 3001
const app = express()
app.use(express.json())

app.use('', add_route)
app.use('', get_route)
app.use('', update_route)
app.use('', delete_route)

app.listen(port, () => {
    console.log('Server is running at port ' + port)
})