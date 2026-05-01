import React, { FC, useState } from 'react';
import Link from 'next/link';

import { ToastContainer } from 'react-toastify';
import { FaUser } from 'react-icons/fa';
import 'react-toastify/dist/ReactToastify.css';

import GenericLayout from '@/layouts/GenericLayout';
import styles from '@/styles/authForm.module.scss';
import { useAuth } from '@/context/AuthContext';

const LoginPage: FC = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [isLoading, setIsLoading] = useState(false);

    const { loginUser } = useAuth();

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setIsLoading(true);
        loginUser({ email, password });
    };
    return (
        <GenericLayout title='User Login'>
            <div className={styles.auth}>
                <h1>
                    <FaUser /> Login
                </h1>
                <ToastContainer />
                <form onSubmit={handleSubmit} >
                    <div>
                        <label htmlFor="email">Email</label>
                        <input
                            type="email"
                            id="email"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            required
                        />
                    </div>
                    <div>
                        <label htmlFor="password">Password</label>
                        <input
                            type="password"
                            id="password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            required
                        />
                    </div>
                    <button type="submit" className="btn" disabled={isLoading}>
                        {isLoading ? 'Loading...' : 'Login'}
                    </button>
                </form>
                <p>
                    Don't have an account?{' '}
                    <Link href="/account/register" className={styles.link}>
                        Register
                    </Link>
                </p>
            </div>
        </GenericLayout>
    );
}

export default LoginPage;