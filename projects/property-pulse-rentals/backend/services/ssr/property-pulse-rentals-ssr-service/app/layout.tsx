import "@/assets/styles/globals.css";
import { ReactNode } from "react";

export const metadata = {
    title: "Property Pulse Rentals",
    keywords: "real estate, rentals, property, apartments, houses, homes, leasing, rental listings, property management, tenant services",
    description: "Find your perfect rental property with Property Pulse Rentals. Browse apartments, houses, and homes for rent in your desired location. Easy leasing and tenant services available.",
}

const MainLayout = ({ children }: { children: ReactNode }) => {
    return <html>
        <body>
            <main>
                {children}
            </main>
        </body>
    </html>
}

export default MainLayout
