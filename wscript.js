const API_KEY = 'eba8b464439410c5bc116058cb6cefd8'; 


async function fetchWeather(city) {
    try {
        const response = await fetch(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${API_KEY}&units=metric`);
        if (!response.ok) {
       
        }
        const data = await response.json();

        document.getElementById('city').textContent = data.name;
        document.getElementById('date').textContent = new Date().toLocaleDateString('en-US', {
            weekday: 'long',
            year: 'numeric',
            month: 'long',
            day: 'numeric',
        });
        document.getElementById('main-weather').textContent = data.weather[0].main;
        document.getElementById('condition').textContent = data.weather[0].description;
        document.getElementById('icon').src = `http://openweathermap.org/img/wn/${data.weather[0].icon}.png`;
        document.getElementById('temperature').textContent = data.main.temp;
        document.getElementById('pressure').textContent = data.main.pressure;
        document.getElementById('humidity').textContent = data.main.humidity;
        document.getElementById('wind-speed').textContent = data.wind.speed;
        document.getElementById('wind-direction').textContent = data.wind.deg;
    } catch (error) {
        console.error('Error fetching weather data:', error);
        alert(` Error fetching weather data for "${city}". Please enter a valid city name.`);
    }
}

document.getElementById('search-button').addEventListener('click', () => {
    const city = document.getElementById('city-input').value;
    if (city) {
        fetchWeather(city);
    } else {
      alert('Please enter a city name.');
    }
});

fetchWeather('Biratnagar');

