import type { FC } from 'react';
import { GetServerSideProps } from 'next';
import { stringify } from 'qs';

import { EventItem, Pagination } from '@/components';
import GenericLayout from '@/layouts/GenericLayout';
import type { Event, EventsResponse, EventsPageProps } from '@/types';

import { PRIVATE_CMS_API_URL } from '@/config';

const EventsPage: FC<EventsPageProps> = ({ events, page, total, pageCount, pageSize }) => {
    return (
        <GenericLayout>
            <h1>Past Events</h1>
            {events.length === 0 && <h3>No events to show</h3>}
            {events.map((evt, index) => (
                <EventItem key={index} event={evt} />
            ))}
            {pageCount > 1 && <Pagination
                page={page}
                pageCount={pageCount}
                pageSize={pageSize}
                total={total}
            />}
            <p>Upcoming events:
                <a href="/events"> Click here</a>
            </p>
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

// export const getStaticProps = (async () => {
//     const res = await fetch(`${PRIVATE_CMS_API_URL}/events?populate=image&sort=date:asc`);
//     const events: EventsResponse = await res.json();
//     const { data } = events;

//     return {
//         props: {
//             events: data,
//             revalidate: 15, // In seconds - this will revalidate the page every second
//         },
//     };
// }) satisfies GetStaticProps<{ events: Event[] }>;

export const getServerSideProps = (async ({ query }) => {
    const { page = '1' } = query as { page: string };
    const pageNumber = parseInt(page, 10);
    const pageSize = 10;
    const offset = (pageNumber - 1) * pageSize;
    const limit = pageSize;
    const cmsQuery = stringify({
        sort: ['date:asc'],
        populate: ['image'],
        pagination: {
            page,
            pageSize,
            // use pagination for offset and limit
            // start: offset,
            // limit
        },
        filters: {
            date: {
                $lte: new Date().toISOString(),
            },
        },
    })

    const url = new URL(`${PRIVATE_CMS_API_URL}/events`);

    // url.searchParams.append('filters', JSON.stringify(filters));
    // url.searchParams.append('pagination[filters]', JSON.stringify(filters));
    // url.searchParams.append('pagination[page]', pageNumber.toString());
    const res = await fetch(`${url}?${cmsQuery}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
    });
    if (!res.ok) {
        if (res.status === 403 || res.status === 401) {
            return {
                redirect: {
                    destination: '/user/login',
                    permanent: false,
                },
            };
        }
        return {
            notFound: true,
        };
    }
    if (res.status === 404) {
        return {
            notFound: true,
        };
    }
    if (res.status === 500) {
        return {
            redirect: {
                destination: '/500',
                permanent: false,
            },
        };
    }
    if (res.status === 400) {
        return {
            redirect: {
                destination: '/400',
                permanent: false,
            },
        };
    }
    const events: EventsResponse = await res.json();
    const { data, meta } = events;

    return {
        props: {
            events: data,
            page: pageNumber,
            total: meta.pagination.total,
            pageCount: meta.pagination.pageCount,
            pageSize: meta.pagination.pageSize,
        },
    };
}
) satisfies GetServerSideProps<{ events: Event[] }>;