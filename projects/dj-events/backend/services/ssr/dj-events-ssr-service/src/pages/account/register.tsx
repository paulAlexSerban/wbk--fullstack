import React, { FC, useState, useEffect, useContext } from 'react';
import { useRouter } from 'next/router';
import Link from 'next/link';
import { ToastContainer, toast } from 'react-toastify';
import { FaUser } from 'react-icons/fa';
import 'react-toastify/dist/ReactToastify.css';

import GenericLayout from '@/layouts/GenericLayout';
import styles from '@/styles/authForm.module.scss';
import { useAuth } from '@/context/AuthContext';

const RegisterPage: FC = () => {
    const [username, setUsername] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const router = useRouter();

    const { registerUser, user } = useAuth();

    useEffect(() => {
        if(user) {
            router.push('/account/dashboard');
        }
    })

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();

        if (password !== confirmPassword) {
            toast.error('Passwords do not match.');
            return;
        }

        registerUser({ username, email, password })
    };
    return (
        <GenericLayout title='User Registration' description='Register to create an account'>
            <div className={styles.auth}>
                <h1>
                    <FaUser /> Register
                </h1>
                <ToastContainer />
                <form onSubmit={handleSubmit} >
                    <div>
                        <label htmlFor="username">User Name</label>
                        <input
                            type="text"
                            id="username"
                            value={username}
                            onChange={(e) => setUsername(e.target.value)}
                            required
                        />
                    </div>
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
                    <div>
                        <label htmlFor="confirmPassword">Confirm Password</label>
                        <input
                            type="password"
                            id="confirmPassword"
                            value={confirmPassword}
                            onChange={(e) => setConfirmPassword(e.target.value)}
                            required
                        />
                    </div>
                    <button type="submit" className="btn" >
                        Login
                    </button>
                </form>
                <p>
                    You have an account?{' '}
                    <Link href="/account/login" className={styles.link}>
                        Login
                    </Link>
                </p>
            </div>
        </GenericLayout>
    );
}

export default RegisterPage;