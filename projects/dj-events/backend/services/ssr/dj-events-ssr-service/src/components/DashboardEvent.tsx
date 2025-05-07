import { FC } from 'react';
import Link from 'next/link';
import { FaPencilAlt, FaTimes } from 'react-icons/fa';
import type { Event } from '@/types';
import styles from '@/styles/dashboardEvent.module.scss';

type DashboardEventProps = {
    event: Event;
    deleteEvent: (e: React.MouseEvent<HTMLAnchorElement>, eventDocumentId: string) => void;
};

export const DashboardEvent: FC<DashboardEventProps> = ({ event, deleteEvent }) => {
    const eventDocumentId = event.documentId;

    return (
        <div className={styles.event}>
            <h4>
                <Link href={`/events/${event.slug}`}>
                    {event.name}
                </Link>

            </h4>
            <Link href={`/events/edit/${event.documentId}`} className={styles.edit}>
                <FaPencilAlt /> <span> Edit Event</span>
            </Link>
            <a href="#" role="button" onClick={(e) => deleteEvent(e, eventDocumentId)} className={styles.delete}>
                <FaTimes /> 
                <span> Delete Event</span>
            </a>
        </div>
    );
};

