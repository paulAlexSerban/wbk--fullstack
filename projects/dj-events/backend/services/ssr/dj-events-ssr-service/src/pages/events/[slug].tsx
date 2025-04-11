import { FC } from 'react';
import GenericLayout from '@/layouts/GenericLayout';
import type { Event } from '@/types';

type EventPageProps = {
    event: Event;
};

const EventPage: FC<EventPageProps> = () => {
    return (
        <GenericLayout>
            <h1>Slug Event</h1>
        </GenericLayout>
    );
};

export default EventPage;

