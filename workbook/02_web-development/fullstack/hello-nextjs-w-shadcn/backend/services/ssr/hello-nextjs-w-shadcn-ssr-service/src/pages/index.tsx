import Head from "next/head";
import Link from "next/link";
import { useState } from "react";
import { Geist, Geist_Mono } from "next/font/google";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { ThemeToggle } from "@/components/theme-toggle";
import { Plus, Trash2, CheckCircle2, ExternalLink } from "lucide-react";
import type { Todo } from "@/types";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export default function Home() {
  const [todos, setTodos] = useState<Todo[]>([
    { id: 1, text: "Learn Next.js with TypeScript", completed: true },
    { id: 2, text: "Set up shadcn/ui components", completed: true },
    { id: 3, text: "Build an awesome app", completed: false },
  ]);
  const [newTodo, setNewTodo] = useState<string>("");

  const addTodo = (): void => {
    if (newTodo.trim()) {
      setTodos([...todos, {
        id: Date.now(),
        text: newTodo.trim(),
        completed: false
      }]);
      setNewTodo("");
    }
  };

  const toggleTodo = (id: number): void => {
    setTodos(todos.map(todo =>
      todo.id === id ? { ...todo, completed: !todo.completed } : todo
    ));
  };

  const deleteTodo = (id: number): void => {
    setTodos(todos.filter(todo => todo.id !== id));
  };

  const handleKeyPress = (e: React.KeyboardEvent<HTMLInputElement>): void => {
    if (e.key === 'Enter') {
      addTodo();
    }
  };

  return (
    <>
      <Head>
        <title>Next.js + TypeScript + shadcn/ui</title>
        <meta name="description" content="A modern Todo app built with Next.js, TypeScript, and shadcn/ui" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <div className={`min-h-screen bg-gradient-to-br from-background via-background to-muted/20 text-foreground ${geistSans.variable} ${geistMono.variable}`}>
        <div className="absolute top-4 right-4 z-10 animate-fade-in">
          <ThemeToggle />
        </div>
        <main className="container mx-auto px-4 py-8 max-w-2xl animate-slide-in-from-bottom">
          <div className="text-center mb-8 space-y-4">
            <div className="inline-block">
              <h1 className="text-4xl md:text-5xl font-bold tracking-tight mb-2 bg-gradient-to-r from-primary via-primary/80 to-primary bg-clip-text text-transparent">
                Next.js + TypeScript + shadcn/ui
              </h1>
            </div>
            <p className="text-lg text-muted-foreground max-w-xl mx-auto">
              A modern todo application showcasing the power of type-safe development with beautiful, accessible UI components
            </p>
            <div className="flex items-center justify-center gap-2">
              <Button variant="outline" size="sm" asChild className="shadow-sm hover:shadow-md transition-shadow">
                <Link href="/demo">
                  View Full Demo
                  <ExternalLink className="h-4 w-4 ml-2" />
                </Link>
              </Button>
            </div>
          </div>

          <Card className="mb-6 border-2 shadow-lg hover:shadow-xl transition-shadow animate-scale-in">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Plus className="h-5 w-5 text-primary" />
                Add New Todo
              </CardTitle>
              <CardDescription>
                Create a new task to add to your todo list
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="flex space-x-2">
                <div className="flex-1">
                  <Label htmlFor="new-todo" className="sr-only">
                    New todo
                  </Label>
                  <Input
                    id="new-todo"
                    placeholder="Enter a new todo..."
                    value={newTodo}
                    onChange={(e: React.ChangeEvent<HTMLInputElement>) => setNewTodo(e.target.value)}
                    onKeyPress={handleKeyPress}
                    className="shadow-sm focus:shadow-md transition-shadow"
                  />
                </div>
                <Button onClick={addTodo} size="icon" className="shadow-sm hover:shadow-md transition-all hover:scale-105">
                  <Plus className="h-4 w-4" />
                  <span className="sr-only">Add todo</span>
                </Button>
              </div>
            </CardContent>
          </Card>

          <Card className="border-2 shadow-lg animate-scale-in">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <CheckCircle2 className="h-5 w-5 text-primary" />
                Todo List
              </CardTitle>
              <CardDescription>
                Manage your tasks with TypeScript type safety
              </CardDescription>
            </CardHeader>
            <CardContent>
              {todos.length === 0 ? (
                <div className="text-center py-12 animate-fade-in">
                  <div className="inline-flex items-center justify-center w-16 h-16 rounded-full bg-muted mb-4">
                    <CheckCircle2 className="h-8 w-8 text-muted-foreground" />
                  </div>
                  <p className="text-muted-foreground">
                    No todos yet. Add one above!
                  </p>
                </div>
              ) : (
                <div className="space-y-2">
                  {todos.map((todo: Todo) => (
                    <div
                      key={todo.id}
                      className="flex items-center space-x-2 p-3 border-2 rounded-lg hover:border-primary/30 hover:shadow-md transition-all duration-200 bg-card"
                    >
                      <Button
                        variant="ghost"
                        size="icon"
                        onClick={() => toggleTodo(todo.id)}
                        className={`${todo.completed 
                            ? "text-green-600 hover:text-green-700" 
                            : "text-muted-foreground hover:text-foreground"
                          } transition-colors`}
                      >
                        <CheckCircle2 className={`h-5 w-5 ${todo.completed ? 'fill-current' : ''}`} />
                        <span className="sr-only">
                          {todo.completed ? "Mark incomplete" : "Mark complete"}
                        </span>
                      </Button>
                      <span
                        className={`flex-1 transition-all duration-200 ${todo.completed
                            ? "line-through text-muted-foreground"
                            : "text-foreground font-medium"
                          }`}
                      >
                        {todo.text}
                      </span>
                      <Button
                        variant="ghost"
                        size="icon"
                        onClick={() => deleteTodo(todo.id)}
                        className="text-destructive/70 hover:text-destructive hover:bg-destructive/10 transition-colors"
                      >
                        <Trash2 className="h-4 w-4" />
                        <span className="sr-only">Delete todo</span>
                      </Button>
                    </div>
                  ))}
                </div>
              )}

              <div className="mt-6 pt-4 border-t-2">
                <div className="grid grid-cols-3 gap-4 text-center">
                  <div className="p-3 rounded-lg bg-muted/50">
                    <div className="text-2xl font-bold text-foreground">{todos.length}</div>
                    <div className="text-xs text-muted-foreground font-medium">Total</div>
                  </div>
                  <div className="p-3 rounded-lg bg-green-500/10 border border-green-500/20">
                    <div className="text-2xl font-bold text-green-600 dark:text-green-400">
                      {todos.filter(todo => todo.completed).length}
                    </div>
                    <div className="text-xs text-green-600/70 dark:text-green-400/70 font-medium">Completed</div>
                  </div>
                  <div className="p-3 rounded-lg bg-primary/10 border border-primary/20">
                    <div className="text-2xl font-bold text-primary">
                      {todos.filter(todo => !todo.completed).length}
                    </div>
                    <div className="text-xs text-primary/70 font-medium">Remaining</div>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>

          <div className="mt-8 text-center animate-fade-in">
            <p className="text-sm text-muted-foreground">
              Built with ❤️ using Next.js, TypeScript, and shadcn/ui
            </p>
          </div>
        </main>
      </div>
    </>
  );
}
