/**
 * Reusable style utilities for common patterns
 */

export const containerStyles = {
  base: "container mx-auto px-4",
  narrow: "container mx-auto px-4 max-w-2xl",
  wide: "container mx-auto px-4 max-w-6xl",
  full: "w-full px-4",
} as const;

export const flexStyles = {
  center: "flex items-center justify-center",
  between: "flex items-center justify-between",
  start: "flex items-center justify-start",
  end: "flex items-center justify-end",
  col: "flex flex-col",
  colCenter: "flex flex-col items-center justify-center",
} as const;

export const gridStyles = {
  auto: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4",
  autoNarrow: "grid grid-cols-1 md:grid-cols-2 gap-4",
  autoWide: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4",
  responsive: "grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4",
} as const;

export const textStyles = {
  h1: "text-4xl md:text-5xl font-bold tracking-tight",
  h2: "text-3xl md:text-4xl font-bold tracking-tight",
  h3: "text-2xl md:text-3xl font-semibold tracking-tight",
  h4: "text-xl md:text-2xl font-semibold",
  body: "text-base",
  small: "text-sm",
  muted: "text-sm text-muted-foreground",
  lead: "text-xl text-muted-foreground",
} as const;

export const cardStyles = {
  base: "rounded-lg border bg-card text-card-foreground shadow-sm",
  hover: "rounded-lg border bg-card text-card-foreground shadow-sm hover:shadow-md transition-shadow",
  interactive: "rounded-lg border bg-card text-card-foreground shadow-sm hover:shadow-md hover:border-primary/20 transition-all cursor-pointer",
  glass: "rounded-lg border border-border/50 bg-background/80 backdrop-blur-lg shadow-sm",
} as const;

export const buttonStyles = {
  primary: "inline-flex items-center justify-center gap-2 rounded-md bg-primary text-primary-foreground px-4 py-2 text-sm font-medium hover:bg-primary/90 transition-colors",
  secondary: "inline-flex items-center justify-center gap-2 rounded-md bg-secondary text-secondary-foreground px-4 py-2 text-sm font-medium hover:bg-secondary/80 transition-colors",
  outline: "inline-flex items-center justify-center gap-2 rounded-md border border-input bg-background px-4 py-2 text-sm font-medium hover:bg-accent hover:text-accent-foreground transition-colors",
  ghost: "inline-flex items-center justify-center gap-2 rounded-md px-4 py-2 text-sm font-medium hover:bg-accent hover:text-accent-foreground transition-colors",
} as const;

export const inputStyles = {
  base: "flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm shadow-sm transition-colors placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50",
  large: "flex h-10 w-full rounded-md border border-input bg-transparent px-3 py-2 text-base shadow-sm transition-colors placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50",
} as const;

export const animationStyles = {
  fadeIn: "animate-fade-in",
  slideInTop: "animate-slide-in-from-top",
  slideInBottom: "animate-slide-in-from-bottom",
  scaleIn: "animate-scale-in",
} as const;

export const spacingStyles = {
  section: "py-12 md:py-16 lg:py-20",
  sectionNarrow: "py-8 md:py-12",
  sectionWide: "py-16 md:py-24 lg:py-32",
} as const;

/**
 * Utility function to combine class names
 */
export function combineStyles(...styles: (string | undefined | false | null)[]): string {
  return styles.filter(Boolean).join(" ");
}