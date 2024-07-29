import React, { useState } from 'react';
import '../styles/EditTaskForm.css';

const EditTaskForm = ({ task, editTask, setIsEditing }) => {
  const [newTask, setNewTask] = useState(task.text);

  const handleSubmit = (e) => {
    e.preventDefault();
    editTask(task.id, { ...task, text: newTask });
    setIsEditing(false);
  };

  return (
    <form className="edit-task-form" onSubmit={handleSubmit}>
      <input 
        type="text" 
        value={newTask} 
        onChange={(e) => setNewTask(e.target.value)} 
      />
      <button type="submit">Update Task</button>
    </form>
  );
};

export default EditTaskForm;
