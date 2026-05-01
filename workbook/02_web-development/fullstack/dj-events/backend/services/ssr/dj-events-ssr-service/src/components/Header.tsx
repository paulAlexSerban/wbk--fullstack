import { JSX, FC } from 'react';

import { FaSignOutAlt, FaSignInAlt } from 'react-icons/fa';
import Link from 'next/link';
import styles from '@/styles/header.module.scss';
import { Search } from '@/components'
import { useAuth } from '@/context/AuthContext';



export const Header: FC = () => {
    const { user, logoutUser } = useAuth();


    const commonLinkList = [
        { href: '/events', label: 'Events', type: 'link' },
    ];

    const loggedInLinkList = [
        { href: '/events/add', label: 'Add Events', type: 'link' },
        { href: '/account/dashboard', label: 'Dashboard', type: 'link' },
        { label: 'Logout', type: 'button', icon: <FaSignOutAlt />, handler: logoutUser },
    ];

    const loggedOutLinkList = [
        { href: '/account/login', label: 'Login', type: 'button', icon: <FaSignInAlt /> },
    ];

    const linkList = user ? [...commonLinkList, ...loggedInLinkList] : [...commonLinkList, ...loggedOutLinkList];

    type RenderLink = (link: {
        href?: string; label: string; type: string; icon?: JSX.Element, handler?: () => void
    }) => JSX.Element;

    const renderLink: RenderLink = (link) => {
        return (
            <li key={link.label}>
                {link.type === 'link' && link.href && (
                    <Link className={styles.link} href={link.href}>
                        {link.label}
                    </Link>)}
                {link.type === 'button' && link.href && (
                    <Link className={styles.link} href={link.href}>
                        <button className="btn-secondary btn-icon">
                            {link.icon}
                            {link.label}
                        </button>
                    </Link>
                )}
                {link.type === 'button' && !link.href && (
                    <button className="btn-secondary btn-icon" onClick={link.handler}>
                        {link.icon}
                        {link.label}
                    </button>
                )}
            </li>
        );
    }

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

