import { render, screen } from '@testing-library/react';
import App from '@/App';

describe('App', () => {
    it('App contains correct heading', () => {
        render(<App />);
        const headingElement = screen.getByRole('heading', { name: /birthdays today/i });
        expect(headingElement).toBeInTheDocument();
    });
});
