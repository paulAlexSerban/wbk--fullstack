# Styling Guide

This document outlines the styling approach and available utilities in this Next.js + TypeScript + shadcn/ui project.

## Overview

The project uses a combination of:
- **Tailwind CSS** - Utility-first CSS framework
- **CSS Variables** - For theme customization
- **CSS Modules** - For component-scoped styles
- **shadcn/ui** - Pre-built accessible components

## File Structure

```
src/styles/
├── globals.css       # Global styles, CSS variables, and Tailwind base
├── Home.module.css   # CSS modules for scoped component styles
└── styles.ts         # TypeScript style utilities and patterns
```

## Theme System

### CSS Variables

Located in `globals.css`, the theme uses HSL color values for easy manipulation:

#### Light Mode
- `--background`: Main background color
- `--foreground`: Main text color
- `--primary`: Primary brand color
- `--secondary`: Secondary brand color
- `--muted`: Muted/subtle elements
- `--accent`: Accent highlights
- `--destructive`: Error/danger states
- `--border`: Border colors
- `--input`: Input field borders
- `--ring`: Focus ring color
- `--card`: Card background
- `--popover`: Popover background

#### Dark Mode
All variables are redefined in `.dark` class with appropriate dark theme values.

### Using Theme Colors

```tsx
// With Tailwind classes
<div className="bg-primary text-primary-foreground">Primary Button</div>
<div className="bg-secondary text-secondary-foreground">Secondary Button</div>

// With CSS
background: hsl(var(--primary));
color: hsl(var(--primary-foreground));
```

## Tailwind Configuration

### Custom Colors
All theme colors are available as Tailwind utilities:
- `bg-primary`, `text-primary`, `border-primary`
- `bg-secondary`, `text-secondary`, `border-secondary`
- `bg-muted`, `text-muted-foreground`
- `bg-accent`, `text-accent-foreground`
- `bg-destructive`, `text-destructive-foreground`
- `bg-card`, `text-card-foreground`
- `bg-popover`, `text-popover-foreground`
- `bg-chart-{1-5}` for chart colors

### Border Radius
- `rounded-sm`: calc(var(--radius) - 4px)
- `rounded-md`: calc(var(--radius) - 2px)
- `rounded-lg`: var(--radius)

### Animations
Custom keyframe animations available:
- `animate-fade-in` - Fade in effect
- `animate-slide-in-from-top` - Slide in from top
- `animate-slide-in-from-bottom` - Slide in from bottom
- `animate-scale-in` - Scale in effect
- `animate-accordion-down` - Accordion expand
- `animate-accordion-up` - Accordion collapse

## Custom Utility Classes

### Scrollbar Styles
```tsx
<div className="scrollbar-thin">Thin custom scrollbar</div>
<div className="scrollbar-none">Hide scrollbar</div>
```

### Glass Morphism
```tsx
<div className="glass">Glass effect with backdrop blur</div>
```

### Gradient Text
```tsx
<h1 className="gradient-text">Gradient colored text</h1>
```

### Transitions
```tsx
<div className="transition-base">Smooth transitions</div>
```

## TypeScript Style Utilities

Import from `@/styles/styles`:

### Container Styles
```tsx
import { containerStyles } from "@/styles/styles";

<div className={containerStyles.narrow}>Narrow container</div>
<div className={containerStyles.wide}>Wide container</div>
```

### Flex Utilities
```tsx
import { flexStyles } from "@/styles/styles";

<div className={flexStyles.center}>Centered flex</div>
<div className={flexStyles.between}>Space between</div>
```

### Grid Layouts
```tsx
import { gridStyles } from "@/styles/styles";

<div className={gridStyles.auto}>Auto responsive grid</div>
```

### Typography
```tsx
import { textStyles } from "@/styles/styles";

<h1 className={textStyles.h1}>Heading 1</h1>
<p className={textStyles.muted}>Muted text</p>
```

### Card Styles
```tsx
import { cardStyles } from "@/styles/styles";

<div className={cardStyles.hover}>Hoverable card</div>
<div className={cardStyles.glass}>Glass card</div>
```

### Combining Styles
```tsx
import { combineStyles, cardStyles, animationStyles } from "@/styles/styles";

<div className={combineStyles(
  cardStyles.interactive,
  animationStyles.fadeIn
)}>
  Animated interactive card
</div>
```

## CSS Modules

For component-specific styles, use CSS Modules:

```tsx
import styles from "@/styles/Home.module.css";

<div className={styles.page}>
  <div className={styles.card}>Card content</div>
</div>
```

## Best Practices

### 1. Use Tailwind First
Prefer Tailwind utilities for most styling:
```tsx
<div className="flex items-center gap-4 p-4 rounded-lg bg-card">
```

### 2. Theme Colors
Always use theme variables instead of hardcoded colors:
```tsx
// Good
<div className="bg-primary text-primary-foreground">

// Avoid
<div className="bg-black text-white">
```

### 3. Responsive Design
Use Tailwind's responsive prefixes:
```tsx
<div className="text-base md:text-lg lg:text-xl">
  Responsive text
</div>
```

### 4. Dark Mode
Classes automatically adapt with the `.dark` class on the root element:
```tsx
// Automatically theme-aware
<div className="bg-background text-foreground">
```

### 5. Reusable Patterns
For repeated style combinations, use the TypeScript utilities:
```tsx
import { cardStyles } from "@/styles/styles";
<div className={cardStyles.interactive}>
```

## Component-Specific Styling

### shadcn/ui Components
Components in `src/components/ui/` use:
- `cn()` utility from `@/lib/utils` for class merging
- `class-variance-authority` for variant management
- Theme variables for consistent theming

Example:
```tsx
import { cn } from "@/lib/utils";

<Button className={cn("custom-class", props.className)} />
```

## Custom Animations

### CSS Keyframes
Defined in `globals.css`:
- `fade-in`
- `slide-in-from-top`
- `slide-in-from-bottom`
- `scale-in`

### Usage
```tsx
<div className="animate-fade-in">Fades in on mount</div>
<div className="animate-slide-in-from-top">Slides from top</div>
```

## Performance Tips

1. **Purge Unused CSS**: Tailwind automatically purges unused styles in production
2. **CSS Variables**: Efficient theme switching without reloading styles
3. **Lazy Loading**: Use CSS modules for route-specific styles
4. **Minimize Custom CSS**: Prefer Tailwind utilities to reduce bundle size

## Resources

- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [shadcn/ui Components](https://ui.shadcn.com)
- [CSS Variables Guide](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties)