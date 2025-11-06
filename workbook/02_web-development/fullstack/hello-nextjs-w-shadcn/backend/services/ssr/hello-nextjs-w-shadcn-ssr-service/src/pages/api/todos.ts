import type { NextApiRequest, NextApiResponse } from "next";
import type { Todo, ApiResponse } from "@/types";

// In-memory storage for demo purposes
// In a real app, you'd use a database
let todos: Todo[] = [
  {
    id: 1,
    text: "Learn Next.js with TypeScript",
    completed: true,
    createdAt: new Date('2023-01-01'),
    updatedAt: new Date('2023-01-01')
  },
  {
    id: 2,
    text: "Set up shadcn/ui components",
    completed: true,
    createdAt: new Date('2023-01-02'),
    updatedAt: new Date('2023-01-02')
  },
  {
    id: 3,
    text: "Build an awesome app",
    completed: false,
    createdAt: new Date('2023-01-03'),
    updatedAt: new Date('2023-01-03')
  },
];

let nextId = 4;

export default function handler(
  req: NextApiRequest,
  res: NextApiResponse<ApiResponse<Todo | Todo[] | void>>
) {
  switch (req.method) {
    case 'GET':
      return handleGet(req, res);
    case 'POST':
      return handlePost(req, res);
    case 'PUT':
      return handlePut(req, res);
    case 'DELETE':
      return handleDelete(req, res);
    default:
      return res.status(405).json({
        success: false,
        error: 'Method not allowed'
      });
  }
}

function handleGet(req: NextApiRequest, res: NextApiResponse<ApiResponse<Todo | Todo[]>>) {
  const { id } = req.query;
  
  if (id) {
    const todo = todos.find(t => t.id === parseInt(id as string));
    if (!todo) {
      return res.status(404).json({
        success: false,
        error: 'Todo not found'
      });
    }
    return res.status(200).json({
      success: true,
      data: todo
    });
  }
  
  return res.status(200).json({
    success: true,
    data: todos
  });
}

function handlePost(req: NextApiRequest, res: NextApiResponse<ApiResponse<Todo>>) {
  const { text } = req.body;
  
  if (!text || typeof text !== 'string') {
    return res.status(400).json({
      success: false,
      error: 'Text is required and must be a string'
    });
  }
  
  const newTodo: Todo = {
    id: nextId++,
    text: text.trim(),
    completed: false,
    createdAt: new Date(),
    updatedAt: new Date()
  };
  
  todos.push(newTodo);
  
  return res.status(201).json({
    success: true,
    data: newTodo,
    message: 'Todo created successfully'
  });
}

function handlePut(req: NextApiRequest, res: NextApiResponse<ApiResponse<Todo>>) {
  const { id } = req.query;
  const { text, completed } = req.body;
  
  const todoIndex = todos.findIndex(t => t.id === parseInt(id as string));
  
  if (todoIndex === -1) {
    return res.status(404).json({
      success: false,
      error: 'Todo not found'
    });
  }
  
  const updatedTodo: Todo = {
    ...todos[todoIndex],
    ...(text !== undefined && { text }),
    ...(completed !== undefined && { completed }),
    updatedAt: new Date()
  };
  
  todos[todoIndex] = updatedTodo;
  
  return res.status(200).json({
    success: true,
    data: updatedTodo,
    message: 'Todo updated successfully'
  });
}

function handleDelete(req: NextApiRequest, res: NextApiResponse<ApiResponse<void>>) {
  const { id } = req.query;
  
  const todoIndex = todos.findIndex(t => t.id === parseInt(id as string));
  
  if (todoIndex === -1) {
    return res.status(404).json({
      success: false,
      error: 'Todo not found'
    });
  }
  
  todos.splice(todoIndex, 1);
  
  return res.status(200).json({
    success: true,
    message: 'Todo deleted successfully'
  });
}