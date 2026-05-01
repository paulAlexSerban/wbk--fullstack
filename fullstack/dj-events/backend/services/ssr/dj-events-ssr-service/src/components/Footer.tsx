import Link from 'next/link';
import styles from '@/styles/footer.module.scss';

export const Footer = () => {
    const date = new Date();
    const year = date.getFullYear();

    return (
        <footer className={styles.footer}>
            <p>Copyright &copy; DJ Events {year}</p>
            <p>
                <Link href="/about">About this project ;)</Link>
            </p>
        </footer>
    );
};


