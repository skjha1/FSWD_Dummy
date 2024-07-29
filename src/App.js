import React, { useState } from 'react';
import Header from './components/Header';
import TaskList from './components/TaskList';
import AddTaskForm from './components/AddTaskForm';
import Timer from './components/Timer';
import DarkModeToggle from './components/DarkModeToggle'; // Import the DarkModeToggle component
import './styles/App.css';

const App = () => {
  const [tasks, setTasks] = useState([]);
  const [darkMode, setDarkMode] = useState(false); // Dark mode state

  const addTask = (task) => {
    setTasks([...tasks, task]);
  };

  const editTask = (id, updatedTask) => {
    setTasks(tasks.map(task => (task.id === id ? updatedTask : task)));
  };

  const deleteTask = (id) => {
    setTasks(tasks.filter(task => task.id !== id));
  };

  const toggleComplete = (id) => {
    setTasks(
      tasks.map(task => 
        task.id === id ? { ...task, complete: !task.complete } : task
      )
    );
  };

  const toggleDarkMode = () => {
    setDarkMode(prevMode => !prevMode); // Toggle dark mode state
  };

  return (
    <div className={`App ${darkMode ? 'dark-mode' : ''}`}>
      <Header />
      <DarkModeToggle toggleDarkMode={toggleDarkMode} darkMode={darkMode} /> {/* Pass function and state */}
      <AddTaskForm addTask={addTask} />
      <TaskList 
        tasks={tasks} 
        editTask={editTask} 
        deleteTask={deleteTask} 
        toggleComplete={toggleComplete} 
      />
      <Timer />
    </div>
  );
};

export default App;
