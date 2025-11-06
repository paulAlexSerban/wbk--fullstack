import Head from "next/head";
import Link from "next/link";
import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import { ThemeToggle } from "@/components/theme-toggle";
import { 
  ArrowLeft, 
  Code, 
  Palette, 
  Zap, 
  Shield, 
  Smartphone,
  Globe,
  Heart
} from "lucide-react";

interface Feature {
  icon: React.ReactNode;
  title: string;
  description: string;
  badge?: string;
}

export default function Demo() {
  const [email, setEmail] = useState<string>("");

  const features: Feature[] = [
    {
      icon: <Code className="h-6 w-6" />,
      title: "TypeScript First",
      description: "Built with TypeScript for better developer experience and type safety.",
      badge: "TS"
    },
    {
      icon: <Palette className="h-6 w-6" />,
      title: "shadcn/ui Components",
      description: "Beautiful, accessible components built on Radix UI primitives.",
      badge: "UI"
    },
    {
      icon: <Zap className="h-6 w-6" />,
      title: "Fast Development",
      description: "Rapid prototyping with pre-built components and utilities.",
      badge: "Speed"
    },
    {
      icon: <Shield className="h-6 w-6" />,
      title: "Type Safe",
      description: "Catch errors at compile time with strict TypeScript configuration.",
      badge: "Safe"
    },
    {
      icon: <Smartphone className="h-6 w-6" />,
      title: "Responsive Design",
      description: "Works perfectly on all devices with Tailwind CSS.",
      badge: "Mobile"
    },
    {
      icon: <Globe className="h-6 w-6" />,
      title: "SEO Ready",
      description: "Server-side rendering with Next.js for better SEO performance.",
      badge: "SEO"
    }
  ];

  const handleNewsletterSubmit = (e: React.FormEvent<HTMLFormElement>): void => {
    e.preventDefault();
    if (email.trim()) {
      alert(`Thank you for subscribing with email: ${email}`);
      setEmail("");
    }
  };

  return (
    <>
      <Head>
        <title>Demo - Next.js + TypeScript + shadcn/ui</title>
        <meta name="description" content="A comprehensive demo showcasing Next.js, TypeScript, and shadcn/ui components" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      
      <div className="min-h-screen bg-gradient-to-br from-background via-background to-accent/5 text-foreground">
        <div className="absolute top-4 right-4 z-10 animate-fade-in">
          <ThemeToggle />
        </div>
        
        <div className="absolute top-4 left-4 z-10 animate-fade-in">
          <Button variant="outline" size="sm" asChild className="shadow-sm hover:shadow-md transition-shadow">
            <Link href="/">
              <ArrowLeft className="h-4 w-4 mr-2" />
              Back to Home
            </Link>
          </Button>
        </div>

        <main className="container mx-auto px-4 py-16 max-w-6xl animate-slide-in-from-bottom">
          {/* Hero Section */}
          <div className="text-center mb-16 animate-scale-in">
            <Badge variant="secondary" className="mb-4 px-4 py-1.5 text-xs font-semibold shadow-sm">
              Demo Page
            </Badge>
            <h1 className="text-5xl md:text-6xl font-bold tracking-tight mb-6 bg-gradient-to-r from-primary via-primary/80 to-primary bg-clip-text text-transparent">
              Next.js + TypeScript + shadcn/ui
            </h1>
            <p className="text-xl text-muted-foreground max-w-2xl mx-auto mb-8 leading-relaxed">
              A modern web development stack showcasing the power of type-safe React development 
              with beautiful, accessible UI components.
            </p>
            <div className="flex gap-4 justify-center">
              <Button size="lg" className="shadow-lg hover:shadow-xl transition-all hover:scale-105">
                Get Started
              </Button>
              <Button variant="outline" size="lg" className="shadow-sm hover:shadow-md transition-all">
                View Components
              </Button>
            </div>
          </div>

          {/* Features Grid */}
          <div className="mb-16 animate-fade-in">
            <h2 className="text-3xl md:text-4xl font-bold text-center mb-4">
              Why This Stack?
            </h2>
            <p className="text-center text-muted-foreground mb-8 max-w-2xl mx-auto">
              Discover the benefits of building with modern, type-safe technologies
            </p>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {features.map((feature, index) => (
                <Card 
                  key={index} 
                  className="border-2 hover:border-primary/20 transition-all duration-300 hover:shadow-xl group cursor-pointer animate-slide-in-from-bottom"
                  style={{ animationDelay: `${index * 100}ms` }}
                >
                  <CardHeader>
                    <div className="flex items-center justify-between mb-2">
                      <div className="p-3 bg-primary/10 rounded-xl text-primary group-hover:scale-110 transition-transform">
                        {feature.icon}
                      </div>
                      {feature.badge && (
                        <Badge variant="outline" className="shadow-sm">{feature.badge}</Badge>
                      )}
                    </div>
                    <CardTitle className="text-lg group-hover:text-primary transition-colors">{feature.title}</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <CardDescription className="text-base leading-relaxed">
                      {feature.description}
                    </CardDescription>
                  </CardContent>
                </Card>
              ))}
            </div>
          </div>

          {/* Component Showcase */}
          <div className="mb-16 animate-fade-in">
            <h2 className="text-3xl md:text-4xl font-bold text-center mb-4">
              Component Showcase
            </h2>
            <p className="text-center text-muted-foreground mb-8 max-w-2xl mx-auto">
              Explore the variety of pre-built, customizable components
            </p>
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
              {/* Buttons */}
              <Card className="border-2 shadow-lg">
                <CardHeader>
                  <CardTitle>Button Variants</CardTitle>
                  <CardDescription>
                    Different button styles and sizes
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="flex flex-wrap gap-2">
                    <Button className="shadow-sm hover:shadow-md transition-shadow">Default</Button>
                    <Button variant="secondary" className="shadow-sm hover:shadow-md transition-shadow">Secondary</Button>
                    <Button variant="outline" className="shadow-sm hover:shadow-md transition-shadow">Outline</Button>
                    <Button variant="ghost">Ghost</Button>
                    <Button variant="destructive" className="shadow-sm hover:shadow-md transition-shadow">Destructive</Button>
                    <Button size="sm">Small</Button>
                    <Button size="lg">Large</Button>
                  </div>
                </CardContent>
              </Card>

              {/* Badges */}
              <Card className="border-2 shadow-lg">
                <CardHeader>
                  <CardTitle>Badge Variants</CardTitle>
                  <CardDescription>
                    Different badge styles for labels and status
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="flex flex-wrap gap-2">
                    <Badge className="shadow-sm">Default</Badge>
                    <Badge variant="secondary" className="shadow-sm">Secondary</Badge>
                    <Badge variant="outline" className="shadow-sm">Outline</Badge>
                    <Badge variant="destructive" className="shadow-sm">Destructive</Badge>
                  </div>
                </CardContent>
              </Card>
            </div>
          </div>

          {/* Newsletter Signup */}
          <Card className="max-w-md mx-auto border-2 shadow-xl animate-scale-in">
            <CardHeader className="text-center">
              <div className="inline-flex items-center justify-center w-12 h-12 rounded-full bg-red-500/10 mx-auto mb-3">
                <Heart className="h-6 w-6 text-red-500" />
              </div>
              <CardTitle className="text-2xl">
                Stay Updated
              </CardTitle>
              <CardDescription>
                Subscribe to get the latest updates about this project
              </CardDescription>
            </CardHeader>
            <CardContent>
              <form onSubmit={handleNewsletterSubmit} className="space-y-4">
                <div>
                  <Label htmlFor="email" className="text-sm font-medium">Email address</Label>
                  <Input
                    id="email"
                    type="email"
                    placeholder="your@email.com"
                    value={email}
                    onChange={(e: React.ChangeEvent<HTMLInputElement>) => setEmail(e.target.value)}
                    required
                    className="mt-1.5 shadow-sm focus:shadow-md transition-shadow"
                  />
                </div>
                <Button type="submit" className="w-full shadow-md hover:shadow-lg transition-all hover:scale-[1.02]">
                  Subscribe
                </Button>
              </form>
            </CardContent>
          </Card>

          {/* Footer */}
          <div className="mt-16 text-center text-muted-foreground animate-fade-in">
            <div className="inline-flex items-center gap-2 text-sm">
              <span>Built with</span>
              <Heart className="h-4 w-4 text-red-500 fill-current" />
              <span>using Next.js, TypeScript, Tailwind CSS, and shadcn/ui</span>
            </div>
          </div>
        </main>
      </div>
    </>
  );
}