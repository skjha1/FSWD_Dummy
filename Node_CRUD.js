const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
const port = 5000;

app.use(cors());
app.use(express.json());

// MongoDB connection
mongoose.connect('mongodb://localhost:27017/heartDB', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

// Log MongoDB connection events
mongoose.connection.on('connected', () => {
    console.log('Mongoose connected to heartDB');
});

mongoose.connection.on('error', (err) => {
    console.log('Mongoose connection error: ' + err);
});

// Define the schema and model
const heartSchema = new mongoose.Schema({
    name: String,
    age: Number,
    heartRate: Number,
});

const Heart = mongoose.model('Heart', heartSchema);

// API endpoint to fetch heart data
app.get('/api/heartData', async (req, res) => {
    try {
        const heartData = await Heart.find();
        console.log('Heart Data:', heartData); // Log fetched data
        res.json(heartData);
    } catch (error) {
        console.error('Error fetching heart data:', error); // Log error
        res.status(500).send(error);
    }
});

// API endpoint to create a new heart data entry
app.post('/api/heartData', async (req, res) => {
    const { name, age, heartRate } = req.body;

    try {
        const newHeartData = new Heart({ name, age, heartRate });
        await newHeartData.save();
        console.log('New Heart Data created:', newHeartData); // Log created data
        res.status(201).json(newHeartData); // Return the created data
    } catch (error) {
        console.error('Error creating heart data:', error); // Log error
        res.status(500).send(error);
    }
});

// API endpoint to delete a heart data entry by ID
app.delete('/api/heartData/:id', async (req, res) => {
    const { id } = req.params;

    try {
        const deletedHeartData = await Heart.findByIdAndDelete(id);
        if (!deletedHeartData) {
            return res.satatus(404).send('Heart Data not found');
        }
        console.log('Heart Data deleted:', deletedHeartData); // Log deleted data
        res.status(200).json(deletedHeartData); // Return the deleted data
    } catch (error) {
        console.error('Error deleting heart data:', error); // Log error
        res.status(500).send(error);
    }
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
