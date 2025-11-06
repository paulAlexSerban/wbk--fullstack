# Next.js + TypeScript + shadcn/ui Application

A modern, full-stack web application built with Next.js, TypeScript, and shadcn/ui components. This project demonstrates best practices for type-safe development with beautiful, accessible UI components.

## 🚀 Features

- **Next.js 15** - React framework with SSR/SSG capabilities
- **TypeScript** - Type-safe development with strict configuration
- **shadcn/ui** - Beautiful, accessible components built on Radix UI
- **Tailwind CSS** - Utility-first CSS framework
- **Dark/Light Mode** - Theme switching with system preference detection
- **API Routes** - Full-stack functionality with type-safe APIs
- **Responsive Design** - Mobile-first approach

## 🛠️ Tech Stack

- **Frontend**: Next.js, React 19, TypeScript
- **UI Components**: shadcn/ui, Radix UI primitives
- **Styling**: Tailwind CSS, CSS Variables
- **Icons**: Lucide React
- **Type Safety**: TypeScript with strict configuration
- **Development**: ESLint, Hot reload

## 📁 Project Structure

```
src/
├── components/
│   ├── ui/                 # shadcn/ui components
│   │   ├── button.tsx
│   │   ├── card.tsx
│   │   ├── input.tsx
│   │   ├── label.tsx
│   │   └── badge.tsx
│   ├── theme-provider.tsx  # Theme context provider
│   └── theme-toggle.tsx    # Theme switching component
├── lib/
│   ├── utils.ts           # Utility functions
│   └── api.ts             # API client utilities
├── pages/
│   ├── api/               # API routes
│   │   ├── hello.ts
│   │   └── todos.ts
│   ├── _app.tsx           # App wrapper with providers
│   ├── _document.tsx      # Document structure
│   ├── index.tsx          # Todo application
│   └── demo.tsx           # Component showcase
├── styles/
│   └── globals.css        # Global styles and theme variables
└── types/
    └── index.ts           # TypeScript type definitions
```

## 🚦 Getting Started

First, run the development server:

```bash
yarn develop
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## 📝 Available Scripts

- `yarn develop` - Start development server with Turbopack
- `yarn build` - Build for production
- `yarn start` - Start production server
- `yarn lint` - Run ESLint

## 🎯 TypeScript Configuration

The project uses strict TypeScript configuration with:
- Strict mode enabled
- Path mapping for imports (`@/*`)
- Type checking for React components
- API route type safety

## 📚 Pages

### `/` (Home)
Interactive todo application demonstrating:
- State management with TypeScript
- Form handling with proper types
- Component composition
- CRUD operations

### `/demo`
Component showcase featuring:
- All available UI components
- Different variants and sizes
- Newsletter signup form
- Responsive grid layouts

## 🔗 API Routes

### `/api/hello`
- **GET** - Simple greeting API with TypeScript types
- Query parameter: `name` (optional)

### `/api/todos`
- **GET** - Retrieve all todos or specific todo by ID
- **POST** - Create new todo
- **PUT** - Update existing todo
- **DELETE** - Delete todo

You can start editing the page by modifying `pages/index.tsx`. The page auto-updates as you edit the file.

[API routes](https://nextjs.org/docs/pages/building-your-application/routing/api-routes) can be accessed on [http://localhost:3000/api/hello](http://localhost:3000/api/hello). This endpoint can be edited in `pages/api/hello.ts`.

The `pages/api` directory is mapped to `/api/*`. Files in this directory are treated as [API routes](https://nextjs.org/docs/pages/building-your-application/routing/api-routes) instead of React pages.

This project uses [`next/font`](https://nextjs.org/docs/pages/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn-pages-router) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/pages/building-your-application/deploying) for more details.
