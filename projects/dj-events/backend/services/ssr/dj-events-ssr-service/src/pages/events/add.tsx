import { FC, useEffect, useState } from 'react';
import { useRouter } from 'next/router';
import Link from 'next/link';

import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

import GenericLayout from '@/layouts/GenericLayout';
import styles from '@/styles/form.module.scss';

import { PUBLIC_API_URL } from '@/config/index';
import { useAuth } from '@/context/AuthContext';


type AddEventPageProps = {
    token: string;
};

type EventFormValues = {
    name: string;
    performers: string;
    address: string;
    venue: string;
    date: string;
    time: string;
    description: string;
}

const AddEventPage: FC = () => {
    const router = useRouter();
    const { user } = useAuth();
    const [values, setValues] = useState<EventFormValues>({
        name: '',
        performers: '',
        address: '',
        venue: '',
        date: '',
        time: '',
        description: '',
    });

    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();

        // Basic validation
        const hasEmptyFields = Object.values(values).some((element) => element === '');

        if (hasEmptyFields) {
            toast.error('Please fill in all fields');
            return;
        }

        const res = await fetch(`${PUBLIC_API_URL}/events`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ data: values }),
        });

        if (!res.ok) {
            if (res.status === 403 || res.status === 401) {
                toast.error('No token included');
                return;
            }
            toast.error('Something Went Wrong');
        } else {
            const responseEvent = await res.json();
            const slug = responseEvent.data.slug;
            router.push(`/events/${slug}`);
        }
    };

    const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
        const { name, value } = e.target;
        setValues({ ...values, [name]: value });
    };

    useEffect(() => {
        if (!user) {
            router.push('/account/login');
        }
    }, [user, router]);

    return (
        <GenericLayout title="Add New Event">
            {user && <>
                <Link href="/events" className="btn btn-primary">
                    Back to Events
                </Link>
                <h1>Add Event</h1>
                <ToastContainer />
                <form onSubmit={handleSubmit} className={styles.form}>
                    <div className={styles.grid}>
                        <div>
                            <label htmlFor="name">Event Name</label>
                            <input type="text" id="name" name="name" value={values.name} onChange={handleInputChange} />
                        </div>
                        <div>
                            <label htmlFor="performers">Performers</label>
                            <input
                                type="text"
                                name="performers"
                                id="performers"
                                value={values.performers}
                                onChange={handleInputChange}
                            />
                        </div>
                        <div>
                            <label htmlFor="venue">Venue</label>
                            <input type="text" name="venue" id="venue" value={values.venue} onChange={handleInputChange} />
                        </div>
                        <div>
                            <label htmlFor="address">Address</label>
                            <input
                                type="text"
                                name="address"
                                id="address"
                                value={values.address}
                                onChange={handleInputChange}
                            />
                        </div>
                        <div>
                            <label htmlFor="date">Date</label>
                            <input type="date" name="date" id="date" value={values.date} onChange={handleInputChange} />
                        </div>
                        <div>
                            <label htmlFor="time">Time</label>
                            <input type="text" name="time" id="time" value={values.time} onChange={handleInputChange} />
                        </div>
                    </div>

                    <div>
                        <label htmlFor="description">Event Description</label>
                        <textarea
                            name="description"
                            id="description"
                            value={values.description}
                            onChange={handleInputChange}
                        ></textarea>
                    </div>

                    <input type="submit" value="Add Event" className="btn" />
                </form>
            </>}
        </GenericLayout>
    );
};


export default AddEventPage;
