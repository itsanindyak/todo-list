import { createContext, useContext } from "react";

export const todoContext = createContext({
  todos: [
    {
      id: 1,
      text: "Todo massage",
      completed: false,
      
    },
  ],
  addTodo: (todo) => {},
  updateTodo: (id, todo) => {},
  deleteTodo: (id) => {},
  toggleTodo: (id) => {},
});

export const TodoContextProvider = todoContext.Provider

export const useTodo = () => {
  return useContext(todoContext);
};
