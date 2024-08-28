// src/App.js
import React, { useState } from 'react';
import FetchHeartData from './components/FetchHeartData';
import HeartDataForm from './components/HeartDataForm';
import './App.css';

function App() {
    const [heartData, setHeartData] = useState([]);

    const handleAddHeartData = (newData) => {
        setHeartData([...heartData, newData]);
    };

    return (
        
        <div className="App">
            <h1>Heart Data Management</h1>
            <HeartDataForm onAdd={handleAddHeartData} />
            <FetchHeartData heartData={heartData} setHeartData={setHeartData} />
        </div>
    );
}

export default App;
