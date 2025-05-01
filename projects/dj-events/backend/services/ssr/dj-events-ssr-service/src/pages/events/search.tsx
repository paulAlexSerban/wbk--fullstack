import type { FC } from 'react';
import { GetServerSideProps } from 'next';
import { useRouter } from 'next/router';
import  Link  from 'next/link';
import { stringify } from 'qs';

import { EventItem } from '@/components';
import GenericLayout from '@/layouts/GenericLayout';
import type { Event, EventsResponse } from '@/types';

import { PRIVATE_CMS_API_URL } from '@/config';

type EventsPageProps = {
    events: Event[];
};

const EventsPage: FC<EventsPageProps> = ({ events }) => {
    const router = useRouter();
    const { term } = router.query;
    const searchTerm = term ? term : '';

    return (
        <GenericLayout>
            <Link href="/events" className="btn-secondary">
                Go Back
            </Link>
            <h1>Search Results for "{searchTerm}"</h1>
            {(events.length) === 0 && <h3>No events to show</h3>}
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

export const getServerSideProps = (async ({ query }) => {
    const { term } = query;
    const cmsQuery = stringify({
        sort: ['date:asc'],
        populate: ['image'],
        filters: {
            $or: [
                {
                    name: {
                        // $containsi: term - case insensitive
                        $containsi: term,
                    }
                },
                {
                    description: {
                        $containsi: term,
                    }
                },
                {
                    venue: {
                        $containsi: term,
                    }
                },
                {
                    performers: {
                        $containsi: term,
                    }
                }
            ]
        }
    })
    console.log({ cmsQuery })
    const res = await fetch(`${PRIVATE_CMS_API_URL}/events?${cmsQuery}`);
    const events: EventsResponse = await res.json();
    const { data } = events;
    return {
        props: {
            events: data
        },
    };
}) satisfies GetServerSideProps<{ events: Event[] }>;
