import type { FC } from 'react';

import GenericLayout from '@/layouts/GenericLayout';

const AboutPage: FC = () => {
    return (
        <GenericLayout>
            <h1>About</h1>
            <p>This is an app to fond the latest DJ and other musical events.</p>
            <p>Version 1.0.0</p>
        </GenericLayout>
    );
};

export default AboutPage;
