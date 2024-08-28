// src/components/HeartDataList.js
import React from 'react';

function HeartDataList({ heartData, onDelete }) {
    return (
        <div>
            <h2>Heart Data</h2>
            {heartData.length > 0 ? (
                <ul>
                    {heartData.map((data) => (
                        <li key={data._id}>
                            {data.name} - {data.age} years - {data.heartRate} bpm
                            <button onClick={() => onDelete(data._id)}>Delete</button>
                        </li>
                    ))}
                </ul>
            ) : (
                <p>No heart data available.</p>
            )}
        </div>
    );
}

export default HeartDataList;
