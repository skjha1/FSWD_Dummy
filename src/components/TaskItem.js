import React, { useState } from 'react';
import EditTaskForm from './EditTaskForm';
import '../styles/TaskItem.css';

const TaskItem = ({ task, editTask, deleteTask, toggleComplete }) => {
  const [isEditing, setIsEditing] = useState(false);

  return (
    <div className={`task-item ${task.complete ? 'complete' : ''}`}>
      {isEditing ? (
        <EditTaskForm 
          task={task} 
          editTask={editTask} 
          setIsEditing={setIsEditing} 
        />
      ) : (
        <>
          <span onClick={() => toggleComplete(task.id)}>
            {task.text} - <em>{task.category}</em>
          </span>
          <button onClick={() => setIsEditing(true)}>Edit</button>
          <button onClick={() => deleteTask(task.id)}>Delete</button>
        </>
      )}
    </div>
  );
};

export default TaskItem;
