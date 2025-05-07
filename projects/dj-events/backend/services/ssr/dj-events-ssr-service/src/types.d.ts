import { DashboardPageProps } from '@/types';
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
  name: string;
  alternativeText: string;
  caption: string;
  url: string;
  formats: {
    [key in ImageFormats]: {
      url: string;
    };
  };
};

export type Event = {
  id: string;
  documentId: string;
  name: string;
  slug: string;
  venue: string;
  address: string;
  performers: string;
  date: Date;
  time: string;
  description: EventDescription;
  image: EventImage;
};

export type EventsResponseData = Event[];

export type EventsResponse = {
  data: Event[];
  meta: {
    pagination: {
      page: number;
      pageSize: number;
      pageCount: number;
      total: number;
    };
  };
};

export type EventsPageProps = {
  events: Event[];
  page: number;
  total: number;
  pageCount: number;
  pageSize: number;
};

export type DashboardPageProps = EventsPageProps;