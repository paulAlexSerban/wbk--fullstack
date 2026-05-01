// Global type definitions for the application

export interface Todo {
  id: number;
  text: string;
  completed: boolean;
  createdAt?: Date;
  updatedAt?: Date;
}

export interface User {
  id: string;
  name: string;
  email: string;
  avatar?: string;
}

export interface ApiResponse<T> {
  success: boolean;
  data?: T;
  error?: string;
  message?: string;
}

export type Theme = 'light' | 'dark' | 'system';

export interface ComponentProps {
  className?: string;
  children?: React.ReactNode;
}

// Form types
export interface ContactForm {
  name: string;
  email: string;
  message: string;
}

// API endpoints types
export interface TodoApiEndpoints {
  GET: (id?: number) => Promise<ApiResponse<Todo | Todo[]>>;
  POST: (todo: Omit<Todo, 'id'>) => Promise<ApiResponse<Todo>>;
  PUT: (id: number, todo: Partial<Todo>) => Promise<ApiResponse<Todo>>;
  DELETE: (id: number) => Promise<ApiResponse<void>>;
}