
const PropertyPage = async ({ params }: { params: Promise<{ id: string }> }) => {
    const { id } = await params
    return <div>
        <h1 className="text-2xl">PropertyPage</h1>
        <div>Property ID: {id}</div>
    </div>
}
export default PropertyPage