import Link from "next/link"

const HomePage = () => {
    return <div >
        <h1 className="text-3xl">HomePage</h1>
        <Link href="/">Home</Link>
        <Link href={{
            pathname: 'properties',
        }}>Properties</Link>
        <Link href="/properties/add">Add Property</Link>
    </div>
}

export default HomePage