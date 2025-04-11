import GenericLayout from '@/layouts/GenericLayout';
import { FC } from 'react';
import 'react-toastify/dist/ReactToastify.css';

type AddEventPageProps = {
    token: string;
};

const AddEventPage: FC = () => {

    return (
        <GenericLayout title="Add New Event">
            <h1>Add Event</h1>
        </GenericLayout>
    );
};


export default AddEventPage;
