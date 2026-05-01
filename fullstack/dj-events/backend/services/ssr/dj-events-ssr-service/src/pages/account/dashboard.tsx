import type { FC } from 'react';
import { GetServerSideProps } from 'next';

import { DashboardEvent, Pagination } from '@/components';
import GenericLayout from '@/layouts/GenericLayout';
import type { Event, DashboardPageProps } from '@/types';
import { parseCookies } from '@/helpers';
import { PRIVATE_CMS_API_URL } from '@/config';
import styles from '@/styles/dashboard.module.scss';
import { PUBLIC_API_URL } from '@/config';

const DashboardPage: FC<DashboardPageProps> = ({ events, page, total, pageCount, pageSize }) => {
    const handleDelete = (e: React.MouseEvent<HTMLAnchorElement>, docId: string) => {
        const confirmDelete = confirm('Are you sure you want to delete this event?');
        if (confirmDelete) {
            fetch(`${PUBLIC_API_URL}/events/${docId}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                },
            })
                .then(() => {
                    window.location.href = '/account/dashboard';
                })
                .catch((err) => {
                    console.error('Error deleting event:', err);
                });
        }
    };
    return (
        <GenericLayout>
            <div className={styles.dash}>
                <h1>Dashboard</h1>
                <h3>My Events</h3>
                {events.length === 0 && <h3>No events to show</h3>}
                {events.map((evt, index) => (
                    <DashboardEvent key={index} event={evt} deleteEvent={handleDelete} />
                ))}
                {pageCount > 1 && <Pagination
                    page={page}
                    pageCount={pageCount}
                    pageSize={pageSize}
                    total={total}
                />}
            </div>
        </GenericLayout>
    );
};

export default DashboardPage;

export const getServerSideProps = (async ({ req }) => {

    const { token } = parseCookies(req);

    const url = new URL(`${PRIVATE_CMS_API_URL}/events/my-events`);
    const res = await fetch(`${url}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${token}`,
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
    const events: { results: any, pagination: any } = await res.json();
    const { results, pagination } = events;

    return {
        props: {
            events: results,
            total: pagination.total,
            pageCount: pagination.pageCount,
            pageSize: pagination.pageSize,
        },
    };
}
) satisfies GetServerSideProps<{ events: Event[] }>;