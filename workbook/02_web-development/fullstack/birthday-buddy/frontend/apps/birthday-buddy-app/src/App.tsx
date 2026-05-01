import { useEffect, useState } from 'react';
import { Person } from '@/types';
import List from '@/components/List';
import { mockData } from '@/data';
import { BIRTHDAYS_API_ENDPOINT } from '@/config';

const fetchPeople = async (): Promise<Person[] | undefined> => {
    try {
        const response = await fetch(BIRTHDAYS_API_ENDPOINT);
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('Error fetching data:', error);
    }

    return mockData
};

const App = () => {
    const [people, setPeople] = useState<Person[]>([]);

    const handleClearList = () => {
        setPeople([]);
    };

    const getPeople = async () => {
        const data = await fetchPeople();
        if (data) {
            setPeople(data);
        }
    };

    useEffect(() => {
        getPeople();
    }, []);

    return (
        <main>
            <section className="container">
                {people.length === 0 && <h3>No birthdays today</h3>}
                {people.length > 0 && (
                    <>
                        <h3>{people.length} birthdays today</h3>
                        <List people={people} />
                    </>
                )}
                <button type="button" className="btn btn-block" onClick={handleClearList}>
                    clear all
                </button>
            </section>
        </main>
    );
};

export default App;
