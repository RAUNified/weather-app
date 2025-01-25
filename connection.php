<?php
$servername = "localhost";
$username = "root";
$password = "";
$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$createDatabase = "CREATE DATABASE IF NOT EXISTS prototype2";
$conn->query($createDatabase);
$conn->select_db("prototype2");
$createTable = "CREATE TABLE IF NOT EXISTS weather (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(255) NOT NULL, 
    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    main_weather VARCHAR(255),
    `condition` TEXT, 
    temperature FLOAT,
    pressure FLOAT,
    humidity FLOAT,
    wind FLOAT,
    wind_direction INT
);";
$conn->query($createTable);
$cityName = isset($_GET['q']) ? $conn->real_escape_string($_GET['q']) : "Biratnagar";
$conn->query("DELETE FROM weather WHERE TIMESTAMPDIFF(HOUR, date_time, NOW()) > 2");
$checkRecentData = "SELECT * FROM weather WHERE city_name = '$cityName' AND TIMESTAMPDIFF(HOUR, date_time, NOW()) <= 2";
$result = $conn->query($checkRecentData);
if ($result->num_rows == 0) {
    $apiKey = "eba8b464439410c5bc116058cb6cefd8";
    $url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";

    $response = @file_get_contents($url);
    if ($response === FALSE) {
        die(json_encode(["error" => "Failed to fetch data from API."]));
    }
    $data = json_decode($response, true);
    if (!isset($data['main'])) {
        die(json_encode(["error" => "City not found."]));
    }
    $humidity = $data['main']['humidity'];
    $wind = $data['wind']['speed'];
    $pressure = $data['main']['pressure'];
    $temperature = $data['main']['temp'];
    $mainWeather = $data['weather'][0]['main'];
    $condition = $data['weather'][0]['description'];
    $windDirection = $data['wind']['deg'];
 $insertData = "INSERT INTO weather (city_name, main_weather, `condition`, temperature, pressure, humidity, wind, wind_direction) 
                   VALUES ('$cityName', '$mainWeather', '$condition', '$temperature', '$pressure', '$humidity', '$wind', '$windDirection')";
    $conn->query($insertData);

    echo json_encode($data);
    exit;
}
$row = $result->fetch_assoc();
$data = [
    "name" => $row['city_name'],
    "main" => [
        "temp" => $row['temperature'],
        "pressure" => $row['pressure'],
        "humidity" => $row['humidity']
    ],
    "wind" => [
        "speed" => $row['wind'],
        "deg" => $row['wind_direction']
    ],
    "weather" => [
        [
            "main" => $row['main_weather'],
            "description" => $row['condition'],
            "icon" => "01d" 
        ]
    ]
];
header('Content-Type: application/json');
echo json_encode($data);
$conn->close();
?>


