import type { FC } from 'react';
import Link from 'next/link';
import { FaExclamationTriangle } from 'react-icons/fa';

import GenericLayout from '@/layouts/GenericLayout';
import styles from '@/styles/404.module.scss';

const NotFoundPage: FC = () => {
    return (
        <GenericLayout title="Page Not Found">
            <div className={styles.error}>
                <h1>
                    <FaExclamationTriangle /> 404
                </h1>
                <p>Sorry, there is nothing here!</p>
                <Link href="/">Go back home!</Link>
            </div>
        </GenericLayout>
    );
};

export default NotFoundPage;
