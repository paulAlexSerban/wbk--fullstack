type ImageFormats = "thumbnail" | "small" | "medium" | "large" | "custom";

type EventDescription = [
  {
    type: string;
    children: [
      {
        type: string;
        text: string;
      }
    ];
  }
];

type EventImage = {
  data: {
    attributes: {
      name: string;
      alternativeText: string;
      caption: string;
      formats: {
        [key in ImageFormats]: {
          url: string;
        };
      };
    };
  };
};

type EventAttributes = {
  id: string;
  name: string;
  slug: string;
  venue: string;
  address: string;
  performers: string;
  date: string;
  time: string;
  description: EventDescription;
  image: EventImage;
};

export type Event = {
  id: string;
  name: string;
  slug: string;
  venue: string;
  address: string;
  performers: string;
  date: string;
  time: string;
  description: string;
  image: string;
};

export type EventsResponseData = Event[];
