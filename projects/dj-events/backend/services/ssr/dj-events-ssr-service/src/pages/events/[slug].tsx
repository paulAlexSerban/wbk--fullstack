import { type FC, useState, useEffect } from 'react';
import { FaPencilAlt, FaTimes } from 'react-icons/fa';
import type { GetServerSideProps } from 'next'

import Link from 'next/link';
import Image from 'next/image';

import GenericLayout from '@/layouts/GenericLayout';
import styles from '@/styles/eventPage.module.scss';
import type { Event } from '@/types';

import { PRIVATE_API_URL, PUBLIC_APP_URL } from '@/config';

type EventPageProps = {
    event: Event;
};

const EventPage: FC<EventPageProps> = ({ event }) => {
    const [dateTime, setDateTime] = useState<string>('');

    const eventName = event.name;
    const eventDate = event.date;
    const eventTime = event.time;
    const eventImage = event.image;
    const eventPerformers = event.performers;
    const eventDescription = event.description;
    const eventVenue = event.venue;
    const eventAddress = event.address;
    const eventImageUrl = eventImage;

    const imageSrc = eventImageUrl ? eventImageUrl : '/assets/images/event-default.png';

    const handleDelete = (e: React.MouseEvent<HTMLAnchorElement>) => {
        console.log('delete', { e });
    };

    useEffect(() => {
        const date = new Date(eventDate).toLocaleDateString('en-US');
        const time = eventTime;
        setDateTime(`${date} at ${time}`);
    }, [eventDate, eventTime]);

    return (
        <GenericLayout>
            <div className={styles.event}>
                <div className={styles.controls}>
                    <Link href={`/events/edit/${event.id}`}>
                        <FaPencilAlt />
                        Edit Event
                    </Link>
                    <a href="#" role="button" onClick={handleDelete} className={styles.delete}>
                        <FaTimes />
                        Delete Event
                    </a>
                </div>
                <span>{dateTime}</span>
                <h1>{eventName}</h1>
                {imageSrc && (
                    <div className={styles.image}>
                        <Image
                            src={`${PUBLIC_APP_URL}${imageSrc}`}
                            width={960}
                            height={600}
                            alt={eventName}
                            unoptimized
                        />
                    </div>
                )}
                <h3>Performers:</h3>
                <p>{eventPerformers}</p>

                <h3>Description:</h3>
                <p>{eventDescription}</p>

                <h3>Venue: {eventVenue}</h3>
                <p>{eventAddress}</p>

                <Link className={styles.back} href="/events">
                    {'<'} Go Back
                </Link>
            </div>
        </GenericLayout>
    );
};


export default EventPage;

/*
* Notes
* - getStaticPaths is a function that will be called at build time in production
*   - used for static site generation as it fetches data at build time
*
* - getServerSideProps is a function that will be called at request time - every time you fetch a page
*   - used for server-side rendering as it fetches data on each request
*
* - getStaticProps is a function that will be called at build time in production
*   - used for static site generation as it fetches data at build time
*/

export const getServerSideProps = (async ({ query }) => {
    const { slug } = query;

    const res = await fetch(`${PRIVATE_API_URL}/events/${slug}`);
    const event: Event[] = await res.json();

    return {
        props: {
            event: event[0]
        },
    };
}) satisfies GetServerSideProps<{ event: Event }>

/**
 * Type Inference with satisfies vs Explicit Annotation:
 * 
 * satisfies provides better type inference for the props object, ensuring event is typed as Event.
 * Explicit annotation may require additional type assertions or manual typing for props.
 * 
 * satisfies allows the function to have a broader type while still ensuring it conforms to GetServerSideProps.
 * Explicit annotation enforces stricter typing on the function itself.
 */