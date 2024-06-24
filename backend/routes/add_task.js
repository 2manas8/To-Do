const express = require('express')
const router = express.Router()
const model = require('../models/to-do')

router.post('/add', (req, res) => {
    const task = req.body.task
    model.create({
        task: task
    })
    .then(result => res.json(result))
    .catch(er => res.json(er))
})

module.exports = router