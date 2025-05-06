import { createContext, useState, useEffect, FC, useCallback, ReactNode, useContext } from 'react';
import { useRouter } from 'next/router';
import { toast } from 'react-toastify';

import { PUBLIC_API_URL } from '@/config';

type UserData = { email: string, username: string, id: number }

type RegisterUser = (userData: { email: string; password: string, username:string }) => Promise<void>;
type LoginUser = (userData: { email: string; password: string }) => Promise<void>;
type LogoutUser = () => Promise<void>;
type CheckUserLoggedIn = () => Promise<void>;

type AuthContextType = {
    user: UserData | null;
    registerUser: RegisterUser;
    loginUser: LoginUser;
    logoutUser: LogoutUser
    checkUserLoggedIn: CheckUserLoggedIn;
}

const AuthContext = createContext({} as AuthContextType);

export const AuthProvider: FC<{ children: ReactNode }> = ({ children }) => {
    const router = useRouter();
    const [user, setUser] = useState<UserData| null>(null);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        const checkAuth = async () => {
            await checkUserLoggedIn();
        };
        checkAuth();
    }, []);


    // register user
    const registerUser = useCallback<RegisterUser>(async (userData) => {
        const { username, email, password } = userData;

        const hasEmptyFields = !username || !email || !password;
        if (hasEmptyFields) {
            setError('Please fill in all fields');
            toast.error('Please fill in all fields');
            return;
        }

        try {
            const response = await fetch(`${PUBLIC_API_URL}/register`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(userData),
            });
            if (!response.ok) {
                setError('Registration failed');
                toast.error('Registration failed');
                return;
            }
            const data = await response.json();
            if (data.jwt && data.user) {
                setUser({
                    email: data.user.email,
                    username: data.user.username,
                    id: data.user.id,
                });
                toast.success('Registration successful');
                // redirect to dashboard
                router.push('/account/dashboard');
            } else {
                setError('Registration failed');
                toast.error('Registration failed');
            }
        } catch (error) {
            setError('Registration failed');
            toast.error('Registration failed');
        }
    }, []);
    // login user
    const loginUser = useCallback<LoginUser>(async (userData) => {
        const { email, password } = userData;
        const hasEmptyFields = !email || !password;

        if (hasEmptyFields) {
            setError('Please fill in all fields');
            toast.error('Please fill in all fields');
            return;
        }

        try {
            const response = await fetch(`${PUBLIC_API_URL}/login`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(userData),
            });
            if (!response.ok) {
                setError('Login failed');
                toast.error('Login failed');
                return;
            }
            const data = await response.json();

            if (data.jwt && data.user) {
                setUser({
                    email: data.user.email,
                    username: data.user.username,
                    id: data.user.id,
                });
                toast.success('Login successful');
                // redirect to dashboard
                router.push('/account/dashboard');
            } else {
                setError('Login failed');
                toast.error('Login failed');
            }
        } catch (error) {
            setError('Login failed');
            toast.error('Login failed');
        }

    }, []);

    // logout user
    const logoutUser = useCallback<LogoutUser>(async () => {
        try {
            const response = await fetch(`${PUBLIC_API_URL}/logout`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
            });
            if (!response.ok) {
                setError('Logout failed');
                toast.error('Logout failed');
                return;
            }
            setUser(null);
            toast.success('Logout successful');
            // redirect to home
            router.push('/');
        } catch (error) {
            setError('Logout failed');
            toast.error('Logout failed');
        }
    }, []);
    // check ig user is logged in
    const checkUserLoggedIn = useCallback<CheckUserLoggedIn>(async () => {
        try {
            const response = await fetch(`${PUBLIC_API_URL}/check-auth`, {
                method: 'GET'
            });

            if (!response.ok) {
                setUser(null);
                return;
            }
            const data = await response.json();
            if (data) {
                setUser({
                    email: data.email,
                    username: data.username,
                    id: data.id,
                });
            } else {
                setUser(null);
            }
        } catch (error) {
            setUser(null);
        }
    }, []);

    return (
        <AuthContext.Provider value={{ user, registerUser, loginUser, logoutUser, checkUserLoggedIn }}>
            {children}
        </AuthContext.Provider>
    )
}
type UseAuth<T = UserData> = () => AuthContextType;

export const useAuth: UseAuth = () => {
    const context = useContext(AuthContext);

    if (!context) {
        throw new Error('useAuth must be used within an AuthProvider');
    }
    return context;
}