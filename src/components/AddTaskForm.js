import React, { useState } from 'react';
import '../styles/AddTaskForm.css';

const AddTaskForm = ({ addTask }) => {
  const [task, setTask] = useState('');
  const [category, setCategory] = useState('Work');

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!task) return;

    addTask({ id: Date.now(), text: task, complete: false, category });
    setTask('');
  };

  return (
    <form className="add-task-form" onSubmit={handleSubmit}>
      <input 
        type="text" 
        value={task} 
        onChange={(e) => setTask(e.target.value)} 
        placeholder="Add a new task" 
      />
      <select value={category} onChange={(e) => setCategory(e.target.value)}>
        <option value="Work">Work</option>
        <option value="Personal">Personal</option>
        <option value="Urgent">Urgent</option>
      </select>
      <button type="submit">Add Task</button>
    </form>
  );
};

export default AddTaskForm;
