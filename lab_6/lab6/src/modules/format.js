const formatter = new Intl.DateTimeFormat(navigator.language, {
    year: 'numeric',
    month: 'short',
    day: '2-digit'
});

/**
 * Форматирует дату по шаблону. Если шаблон не задан, то возвращает Intl.DateTimeFormat форматирование.
 *
 * Например: `format(..., '[year]-[month]')` вернет `2020-04`
 *
 * @param {Date} date Дата
 * @param {string} placeholder Шаблон
 */
const format = (date, placeholder = null) => {
    if (placeholder !== null) {
        const parts = new Map(
            formatter.formatToParts(date).map(entry => [entry.type, entry.value])
        );
        const formatted = placeholder.replace(/\[(\w+)\]/g, (match, key) => {
            if (parts.has(key)) {
                return parts.get(key);
            } else {
                return key;
            }
        });

        return formatted;
    } else {
        return formatter.format(date);
    }
};

export default format;