import { JSX } from 'react';

import { FaSignOutAlt } from 'react-icons/fa';
import Link from 'next/link';
import styles from '@/styles/header.module.scss';
import { Search } from '@/components'

const linkList = [
    { href: '/events', label: 'Events', type: 'link' },
    { href: '/events/add', label: 'Add Events', type: 'link' },
    { href: '/account/dashboard', label: 'Dashboard', type: 'link' },
    { href: '/', label: 'Logout', type: 'button', icon: <FaSignOutAlt /> },
];

const renderLink = (link: { href: string; label: string; type: string; icon?: JSX.Element }) => {
    return (
        <li key={link.label}>
            {link.type === 'link' ? (
                <Link className={styles.link} href={link.href}>
                    {link.label}
                </Link>
            ) : (
                <Link className={styles.link} href={link.href}>
                    <button className="btn-secondary btn-icon">
                        {link.icon}
                        {link.label}
                    </button>
                </Link>
            )}
        </li>
    );
}

export const Header = () => {
    return (
        <header className={styles.header}>
            <div className={styles.logo}>
                <Link className={styles.link} href="/">
                    DJ Events
                </Link>
            </div>

            <Search />

            <nav>
                <ul className={styles.list}>
                    {linkList.map((link) => renderLink(link))}
                </ul>
            </nav>
        </header>
    );
};

