import React, { useState, useEffect } from 'react';
import alarm from '../assets/alarm.mp3';
import '../styles/Timer.css';

const Timer = () => {
  const [time, setTime] = useState(0);
  const [isRunning, setIsRunning] = useState(false);

  useEffect(() => {
    let timer;
    if (isRunning && time > 0) {
      timer = setInterval(() => {
        setTime(prevTime => prevTime - 1);
      }, 1000);
    } else if (time === 0 && isRunning) {
      setIsRunning(false);
      new Audio(alarm).play();
    }

    return () => clearInterval(timer);
  }, [isRunning, time]);

  const startTimer = () => {
    if (time > 0) {
      setIsRunning(true);
    }
  };

  const stopTimer = () => {
    setIsRunning(false);
  };

  const resetTimer = () => {
    setIsRunning(false);
    setTime(0);
  };

  return (
    <div className="timer">
      <h2>Timer</h2>
      <div className="time-display">{`${Math.floor(time / 60)}:${time % 60 < 10 ? '0' : ''}${time % 60}`}</div>
      <div className="timer-controls">
        <input 
          type="number" 
          value={Math.floor(time / 60)} 
          onChange={(e) => setTime(e.target.value * 60 + (time % 60))} 
          min="0" 
          max="59"
        />:
        <input 
          type="number" 
          value={time % 60} 
          onChange={(e) => setTime(Math.floor(time / 60) * 60 + parseInt(e.target.value))} 
          min="0" 
          max="59"
        />
        <button onClick={startTimer}>Start</button>
        <button onClick={stopTimer}>Stop</button>
        <button onClick={resetTimer}>Reset</button>
      </div>
    </div>
  );
};

export default Timer;
