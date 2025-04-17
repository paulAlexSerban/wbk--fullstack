import { FC, useEffect, useState } from 'react';
import Link from 'next/link';
import Image from 'next/image';

import type { Event } from '@/types';
import styles from '@/styles/eventItem.module.scss';
import { PUBLIC_APP_URL } from '@/config';

type EventItemProps = {
    event: Event;
};

export const EventItem: FC<EventItemProps> = ({ event }) => {
    const [dateTime, setDateTime] = useState<string>('');

    const eventName = event.name;
    const eventDate = event.date;
    const eventTime = event.time;
    const eventSlug = event.slug;
    const imageThumbnail = event.image?.formats?.thumbnail?.url ??  `${PUBLIC_APP_URL}/assets/images/event-default.png`

    useEffect(() => {
        const date = new Date(eventDate).toLocaleDateString('en-US');
        const time = eventTime;
        setDateTime(`${date} at ${time}`);
    }, [eventDate, eventTime]);

    return (
        <div className={styles.event}>
            <div className={styles.img}>
                <Image
                    src={imageThumbnail}
                    width={170}
                    height={100}
                    alt={eventName}
                    unoptimized
                />
            </div>

            <div className={styles.info}>
                <span>{dateTime}</span>
                <h3>{eventName}</h3>
            </div>

            <div className={styles.link}>
                <Link className="btn" href={`/events/${eventSlug}`}>
                    Details
                </Link>
            </div>
        </div>
    );
};

