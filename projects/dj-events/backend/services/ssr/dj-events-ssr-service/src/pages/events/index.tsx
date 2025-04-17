import type { FC } from 'react';
import { GetStaticProps } from 'next';
import Link from 'next/link';

import { EventItem } from '@/components';
import GenericLayout from '@/layouts/GenericLayout';
import type { Event, EventsResponse } from '@/types';

import { PRIVATE_CMS_API_URL } from '@/config';

type EventsPageProps = {
    events: Event[];
};

const EventsPage: FC<EventsPageProps> = ({ events }) => {
    return (
        <GenericLayout>
            <h1>Upcoming Events</h1>
            {events.length === 0 && <h3>No events to show</h3>}
            {events.map((evt, index) => (
                <EventItem key={index} event={evt} />
            ))}
        </GenericLayout>
    );
};

export default EventsPage;

/**
 * Notes
 * - getStaticProps is a function that will be called at build time in production
 *   - used for static site generation as it fetches data at build time
 *
 * - getServerSideProps is a function that will be called at request time - every time you fetch a page
 *   - used for server-side rendering as it fetches data on each request
 */

export const getStaticProps = (async () => {
    const res = await fetch(`${PRIVATE_CMS_API_URL}/events?populate=image&sort=date:asc`);
    const events: EventsResponse = await res.json();
    const { data } = events;

    return {
        props: {
            events: data,
            revalidate: 15, // In seconds - this will revalidate the page every second
        },
    };
}) satisfies GetStaticProps<{ events: Event[] }>;