const express = require('express')
const router = express.Router()
const model = require('../models/to-do')

router.get('/get', (req, res) => {
    model.find()
    .then(result => res.json(result))
    .catch(er => res.json(er))
})

module.exports = router