
import { useState, useEffect, FC } from 'react';
import ReactDOM from 'react-dom';
import { FaTimes } from 'react-icons/fa';
import styles from '@/styles/modal.module.scss';

type ModalProps = {
    show: boolean;
    onClose: () => void;
    children: React.ReactNode;
    title: string;
}

export const Modal: FC<ModalProps> = ({ show, onClose, children, title }) => {
    const [isBrowser, setIsBrowser] = useState(false);

    useEffect(() => {
        setIsBrowser(true);
    }, []);

    const handleClose = (e: React.MouseEvent<HTMLAnchorElement>) => {
        e.preventDefault();
        onClose();
    };

    const modalContent = show ? (
        <div className={styles.overlay}>
            <div className={styles.modal}>
                <div className={styles.header}>
                    <h2>{title}</h2>
                    <a className={styles.close} onClick={handleClose} href='#' role='button'>
                        <FaTimes />
                    </a>
                </div>
                {title && <div >{title}</div>}
                <div className={styles.body}>
                    {children}
                </div>
            </div>
        </div>
    ) : null;

    if (isBrowser) {
        return ReactDOM.createPortal(
            modalContent,
            document.getElementById('modal-root') as HTMLElement
        );
    } else {
        return null;
    }
};

