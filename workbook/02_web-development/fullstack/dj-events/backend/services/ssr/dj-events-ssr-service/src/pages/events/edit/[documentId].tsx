import { FC, useState, useEffect } from 'react';
import type { GetServerSideProps } from 'next'
import { useRouter } from 'next/router';
import Link from 'next/link';
import Image from 'next/image';
import { FaImage } from 'react-icons/fa';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

import GenericLayout from '@/layouts/GenericLayout';
import { Modal, ImageUpload } from '@/components/index';
import styles from '@/styles/form.module.scss';

import { PUBLIC_API_URL, PRIVATE_CMS_API_URL } from '@/config/index';
import type { Event } from '@/types';
import { useAuth } from '@/context/AuthContext';


type EditEventPageProps = {
    event: Event;
};

type EventFormValues = {
    name: string;
    performers: string;
    address: string;
    venue: string;
    date: string
    time: string;
    description: string;
}

const EditEventPage: FC<EditEventPageProps> = ({ event }) => {
    const router = useRouter();
    const { user } = useAuth();
    const [values, setValues] = useState<EventFormValues>({
        name: event.name,
        performers: event.performers,
        address: event.address,
        venue: event.venue,
        date: new Date(event.date).toISOString().split('T')[0], // Format date to YYYY-MM-DD
        time: event.time,
        description: event.description[0]?.children[0]?.text || '',
    });
    const [imagePreview, setImagePreview] = useState<string | null>(event.image?.formats?.thumbnail?.url || null);
    const [showModal, setShowModal] = useState(false);

    const eventDocumentId = event.documentId;

    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();

        // Basic validation
        const hasEmptyFields = Object.values(values).some((element) => element === '');

        if (hasEmptyFields) {
            toast.error('Please fill in all fields');
            return;
        }

        const res = await fetch(`${PUBLIC_API_URL}/events/edit/${eventDocumentId}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ data: { ...values, slug: event.slug } }),
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

    const imageUploaded = async () => {
        const response = await fetch(`${PUBLIC_API_URL}/events/${eventDocumentId}`);
        const eventResponse = await response.json();
        console.log('imageUploaded > eventResponse', eventResponse);
        const eventData = eventResponse.data;
        if (eventData && eventData.image) {
            setImagePreview(eventData.image.formats.thumbnail.url);
            setShowModal(false);
            toast.success('Image uploaded successfully');
        }
    }

    useEffect(() => {
        if (!user) {
            router.push('/events');
        }
    }, [user, router]);

    return (
        <GenericLayout title="Edit Event" description="Edit Event">
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

                    <h2>Event image </h2>
                    {imagePreview ? (
                        <Image
                            src={imagePreview}
                            alt="Event Image"
                            width={170}
                            height={100}
                            unoptimized
                            className={styles.imagePreview}
                            onError={() => {
                                setImagePreview(null);
                            }}
                        />
                    ) : (
                        <p>No image uploaded.</p>
                    )}
                    <div>
                        <button className="btn-secondary" onClick={(e) => {
                            e.preventDefault();
                            setShowModal(true);
                        }
                        }>
                            <FaImage /> Set Image
                        </button>
                    </div>
                    <input type="submit" value="Save Event Changes" className="btn" />
                </form>

                <Modal show={showModal} onClose={() => setShowModal(false)} title="Set Image">
                    <ImageUpload eventId={eventDocumentId} imageUploaded={imageUploaded} />
                    <button
                        className="btn-secondary"
                        onClick={() => {
                            setImagePreview(null);
                            setShowModal(false);
                        }}
                    >
                        Close
                    </button>
                </Modal></>}
        </GenericLayout>
    );
};

export const getServerSideProps = (async ({ params }) => {
    const { documentId } = params as { documentId: string };

    const response = await fetch(`${PRIVATE_CMS_API_URL}/events/${documentId}?populate=image`);
    const event: { data: Event } = await response.json();
    const { data } = event;

    // Handle case when event is not found
    if (!data || !data.id || !data.documentId) {
        return {
            notFound: true, // This will render the 404 page
        };
    }

    return {
        props: {
            event: data
        },
    };
}) satisfies GetServerSideProps<{ event: Event }>;


export default EditEventPage;
