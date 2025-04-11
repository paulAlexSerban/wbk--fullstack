// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const getTotals = (cart: any) => {
    let totalAmount = 0;
    let totalCost = 0;

    for (const { amount, price } of cart.values()) {
        totalAmount += amount;
        totalCost += amount * price;
    }
    return { totalAmount, totalCost };
};
