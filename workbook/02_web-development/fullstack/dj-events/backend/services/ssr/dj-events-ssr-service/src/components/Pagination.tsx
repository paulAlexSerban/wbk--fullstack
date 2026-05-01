import { FC } from 'react';
import Link from 'next/link';

type PaginationProps = {
    page: number;
    pageCount: number;
    pageSize: number;
    total: number;
};

export const Pagination: FC<PaginationProps> = ({ page, pageCount, pageSize, total }) => {
    return (
        <>
            <div>
                {page > 1 ? <Link
                    href={`/events?page=${page - 1}`}
                    className={`btn-secondary ${page === 1 ? 'hidden' : ''}`}
                >
                    Previous
                </Link> : null}
                <span>
                    Page {page} of {pageCount}
                </span>
                {page < pageCount ? <Link
                    href={`/events?page=${page + 1}`}
                    className={`btn-secondary ${page === pageCount ? 'hidden' : ''}`}
                >
                    Next
                </Link> : null}
            </div>
        </>
    );
};