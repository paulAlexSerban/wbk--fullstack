import type { FC } from 'react';

import GenericLayout from '@/layouts/GenericLayout';
import type { Event } from '@/types';

type HomePageProps = {
    events: Event[];
};

const HomePage: FC<HomePageProps> = () => {
    return (
        <GenericLayout>
            <h1>Upcoming Events</h1>
        </GenericLayout>
    );
};

export default HomePage;
