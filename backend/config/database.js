require('dotenv').config()
const mongoose = require('mongoose')

const dbConnect = () => {
	mongoose.connect(process.env.DATABASE_URL)
	.then(() => console.log('Successfully connected to the database'))
	.catch((err) => {
		console.log('Failed to connect to the database')
		console.error(err.message)
		process.exit(1)
	})
};

module.exports = dbConnect