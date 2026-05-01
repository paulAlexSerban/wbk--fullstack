import { FC, useState } from 'react';
import { PUBLIC_API_URL } from '@/config';
import styles from '@/styles/form.module.scss';

type ImageUploadProps = {
    eventId: string;
    imageUploaded: () => void;
}

export const ImageUpload: FC<ImageUploadProps> = ({ eventId, imageUploaded }) => {
    const [image, setImage] = useState<File | null>(null);
    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        if (!image) {
            alert('Please select an image');
            return;
        }
        const formData = new FormData();
        formData.append('files', image);
        formData.append('ref', 'event');
        formData.append('refId', eventId);
        formData.append('field', 'image');
        formData.append('pluralRef', 'events');

        try {
            const res = await fetch(`${PUBLIC_API_URL}/upload`, {
                method: 'POST',
                body: formData,
            });
            if (!res.ok) {
                throw new Error('Failed to upload image');
            }
            await imageUploaded();
            alert('Image uploaded successfully');
        } catch (error) {
            console.error('Error uploading image:', error);
            alert('Error uploading image');
        }
    };
    const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setImage(e.target.files ? e.target.files[0] : null);
        if (e.target.files && e.target.files[0]) {
            const file = e.target.files[0];
            const reader = new FileReader();
            reader.onloadend = () => {
                console.log('File preview:', reader.result);
            };
            reader.readAsDataURL(file);
        }

    };

    return (
        <div className={styles.form}>
            <h2>Upload event image</h2>
            <form onSubmit={handleSubmit}>
                <div className={styles.file}>
                    <input type="file" onChange={handleFileChange} />
                </div>
                <input type="submit" value="Upload" className='btn' />
            </form>
        </div>
    );
}