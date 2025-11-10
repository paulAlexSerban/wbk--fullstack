import Link from "next/link";
import properties from "@/data/properties.json";
import PropertyCard from "./PropertyCard";

const HomeProperties = () => {
  const recentProperties = properties
    .sort(
      (a, b) =>
        new Date(b.updatedAt).getTime() - new Date(a.updatedAt).getTime()
    )
    .slice(0, 3);
  return (
    <>
      {" "}
      <section className="px-4 py-6">
        <div className="container-xl lg:container m-auto px-4 py-6">
          <h2 className="text-3xl font-bold text-blue-500 mb-6 text-center">
            Recent Properties
          </h2>
          {recentProperties.length === 0 ? (
            <p>No properties available.</p>
          ) : (
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {recentProperties.map((property) => (
                <div
                  key={property._id}
                  className="border rounded-lg overflow-hidden shadow-sm"
                >
                  <PropertyCard {...property} />
                </div>
              ))}
            </div>
          )}
        </div>
      </section>
      <section className="m-auto max-w-lg my-10 px-6">
        <Link
          href="/properties"
          className="block text-center bg-black text-white py-3 px-6 rounded-lg font-semibold hover:bg-gray-700 transition"
        >
          View All Properties
        </Link>
      </section>
    </>
  );
};

export default HomeProperties;
