const express = require('express')
const router = express.Router()
const model = require('../models/to-do')

router.delete('/delete/:id', (req, res) => {
    const {id} = req.params
    model.findByIdAndDelete({_id: id})
    .then(result => res.json(result))
    .catch(er => res.json(er))
})

module.exports = router