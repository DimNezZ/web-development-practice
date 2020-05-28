export const numeric = element => {
    const parsedValue = element.value.replace(/\D/g, '');

    if (parsedValue !== element.value) {
        element.value = parsedValue;
    }
};