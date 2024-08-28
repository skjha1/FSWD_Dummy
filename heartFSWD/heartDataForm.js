// src/components/HeartDataForm.js
import React, { useState } from 'react';
import axios from 'axios';

function HeartDataForm({ onAdd }) {
    const [formData, setFormData] = useState({
        name: '',
        age: '',
        heartRate: ''
    });

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setFormData({
            ...formData,
            [name]: value
        });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await axios.post('http://localhost:5000/api/heartData', formData);
            onAdd(response.data);
            setFormData({ name: '', age: '', heartRate: '' });
        } catch (error) {
            console.error('Error creating heart data:', error);
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <h2>Add Heart Data</h2>
            <input
                type="text"
                name="name"
                value={formData.name}
                onChange={handleInputChange}
                placeholder="Name"
                required
            />
            <input
                type="number"
                name="age"
                value={formData.age}
                onChange={handleInputChange}
                placeholder="Age"
                required
            />
            <input
                type="number"
                name="heartRate"
                value={formData.heartRate}
                onChange={handleInputChange}
                placeholder="Heart Rate"
                required
            />
            <button type="submit">Add Heart Data</button>
        </form>
    );
}

export default HeartDataForm;
