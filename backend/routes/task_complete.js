const express = require('express')
const router = express.Router()
const model = require('../models/to-do')

router.put('/update/:id', (req, res) => {
    const {id} = req.params
    model.findByIdAndUpdate({_id: id}, [{$set: {done: {$not: "$done"}}}])
    .then(result => res.json(result))
    .catch(er => res.json(er))
})

module.exports = router