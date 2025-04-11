import { type ReactNode, type FC } from 'react';
import Head from 'next/head';
import { useRouter } from 'next/router';
import styles from '@/styles/generic-layout.module.scss';
import { Header, Footer, Showcase } from '@/components';

type GenericLayoutProps = {
    title?: string;
    keywords?: string;
    description?: string;
    children: ReactNode;
};

const GenericLayout: FC<GenericLayoutProps> = ({
    title = 'DJ Events | Find the hottest parties',
    keywords = 'music, dj, events, edm',
    description = 'Find the latest DJ and other musical events',
    children,
}) => {
    const router = useRouter();

    return (
        <div>
            <Head>
                <title>{title}</title>
                <meta name="description" content={description} />
                <meta name="keywords" content={keywords} />
            </Head>
            <Header />
            {router.pathname === '/' && <Showcase />}
            <div className={styles.container}>
                {children}
            </div>
            <Footer />
        </div>
    );
};

export default GenericLayout;
