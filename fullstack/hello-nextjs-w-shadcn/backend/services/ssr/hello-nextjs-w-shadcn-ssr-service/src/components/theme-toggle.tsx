import { Moon, Sun } from "lucide-react"
import { Button } from "@/components/ui/button"
import { useTheme } from "@/components/theme-provider"

export function ThemeToggle() {
  const { theme, setTheme } = useTheme()

  const toggleTheme = () => {
    if (theme === 'light') {
      setTheme('dark')
    } else if (theme === 'dark') {
      setTheme('system')
    } else {
      setTheme('light')
    }
  }

  return (
    <Button
      variant="outline"
      size="icon"
      onClick={toggleTheme}
      title={`Current theme: ${theme}`}
      className="shadow-md hover:shadow-lg transition-all hover:scale-105 border-2"
    >
      {theme === 'light' && <Sun className="h-[1.2rem] w-[1.2rem] text-amber-500" />}
      {theme === 'dark' && <Moon className="h-[1.2rem] w-[1.2rem] text-blue-400" />}
      {theme === 'system' && (
        <div className="relative h-[1.2rem] w-[1.2rem]">
          <Sun className="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0 text-amber-500" />
          <Moon className="absolute top-0 h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100 text-blue-400" />
        </div>
      )}
      <span className="sr-only">Toggle theme</span>
    </Button>
  )
}