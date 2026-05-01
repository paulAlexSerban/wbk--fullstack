import { Url } from "next/dist/shared/lib/router/router";
import Link from "next/link";

type InfoBoxProps = {
  heading: String;
  children: String;
  buttonInfo: {
    text: String;
    url: Url;
    backgroundColor: String;
  };
  backgroundColor?: String;
  textColor?: String;
};

const InfoBox = ({
  heading,
  children,
  backgroundColor = "bg-gray-100",
  textColor = "text-gray-800",
  buttonInfo,
}: InfoBoxProps) => {
  return (
    <div className={`${backgroundColor} p-6 rounded-lg shadow-md`}>
      <h2 className="text-2xl font-bold">{heading}</h2>
      <p className={`mt-2 mb-4 ${textColor}`}>{children}</p>
      <Link
        href={buttonInfo.url}
        className={`inline-block ${buttonInfo.backgroundColor} text-white rounded-lg px-4 py-2 hover:bg-gray-700`}
      >
        {buttonInfo.text}
      </Link>
    </div>
  );
};

export default InfoBox;
