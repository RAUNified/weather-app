const API_KEY = 'your api key here';
const DEFAULT_CITY = 'Biratnagar';

async function fetchWeather(city) {
    try {
        const response = await fetch(`http://localhost/Prototype2/connection.php?q=${city}`);
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        document.getElementById('city').textContent = data.name || "Unknown city";
        document.getElementById('date').textContent = new Date().toLocaleDateString('en-US', {
            weekday: 'long',
            year: 'numeric',
            month: 'long',
            day: 'numeric',
        });
        document.getElementById('main-weather').textContent = data.weather[0]?.main || "N/A";
        document.getElementById('condition').textContent = data.weather[0]?.description || "N/A";
        document.getElementById('icon').src = `http://openweathermap.org/img/wn/${data.weather[0]?.icon || "01d"}.png`;
        document.getElementById('temperature').textContent = data.main.temp || "N/A";
        document.getElementById('pressure').textContent = data.main.pressure || "N/A";
        document.getElementById('humidity').textContent = data.main.humidity || "N/A";
        document.getElementById('wind-speed').textContent = data.wind.speed || "N/A";
        document.getElementById('wind-direction').textContent = data.wind.deg || "N/A";
    } catch (error) {
        console.error('Error fetching weather data:', error);
        alert(`Error fetching weather data for "${city}". Please ensure the city name is valid and your server is running.`);
    }
}
document.getElementById('search-button').addEventListener('click', () => {
    const city = document.getElementById('city-input').value.trim();
    if (city) {
        fetchWeather(city);
    } else {
        alert('Please enter a city name.');
    }
});
fetchWeather(DEFAULT_CITY);
