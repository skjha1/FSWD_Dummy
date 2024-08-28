// src/components/FetchHeartData.js
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import LoadingSpinner from './LoadingSpinner';
import HeartDataList from './HeartDataList';

function FetchHeartData() {
    const [heartData, setHeartData] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchHeartData();
    }, []);

    const fetchHeartData = async () => {
        try {
            const response = await axios.get('http://localhost:5000/api/heartData');
            setHeartData(response.data);
        } catch (error) {
            console.error('Error fetching heart data:', error);
        } finally {
            setLoading(false);
        }
    };

    const handleDelete = async (id) => {
        try {
            await axios.delete(`http://localhost:5000/api/heartData/${id}`);
            setHeartData(heartData.filter((data) => data._id !== id));
        } catch (error) {
            console.error('Error deleting heart data:', error);
        }
    };

    return (
        <div>
            {loading ? (
                <LoadingSpinner />
            ) : (
                <HeartDataList heartData={heartData} onDelete={handleDelete} />
            )}
        </div>
    );
}

export default FetchHeartData;
