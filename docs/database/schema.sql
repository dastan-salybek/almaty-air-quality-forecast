CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role VARCHAR(30) NOT NULL
);

CREATE TABLE districts (
    district_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE health_conditions (
    condition_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE user_health_conditions (
    user_id INT NOT NULL,
    condition_id INT NOT NULL,
    PRIMARY KEY (user_id, condition_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (condition_id) REFERENCES health_conditions(condition_id)
);

CREATE TABLE ml_models (
    model_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    version VARCHAR(20) NOT NULL,
    accuracy NUMERIC(5,2) NOT NULL,
    trained_at TIMESTAMP NOT NULL
);

CREATE TABLE measurements (
    measurement_id SERIAL PRIMARY KEY,
    district_id INT NOT NULL,
    measured_at TIMESTAMP NOT NULL,
    pm25 NUMERIC(6,2) NOT NULL,
    aqi INT NOT NULL,
    FOREIGN KEY (district_id) REFERENCES districts(district_id)
);

CREATE TABLE forecasts (
    forecast_id SERIAL PRIMARY KEY,
    district_id INT NOT NULL,
    model_id INT NOT NULL,
    forecast_time TIMESTAMP NOT NULL,
    pm25_value NUMERIC(6,2) NOT NULL,
    risk_level VARCHAR(20) NOT NULL,
    FOREIGN KEY (district_id) REFERENCES districts(district_id),
    FOREIGN KEY (model_id) REFERENCES ml_models(model_id)
);

INSERT INTO users (full_name, email, role) VALUES
('Айгүл Серікова', 'aigul@example.kz', 'resident'),
('Данияр Омаров', 'daniyar@example.kz', 'risk_group'),
('Мадина Жақсылықова', 'madina@example.kz', 'analyst'),
('Ерлан Нұрмағамбетов', 'erlan@example.kz', 'admin');

INSERT INTO districts (name) VALUES
('Алатау'), ('Бостандық'), ('Медеу'), ('Әуезов');

INSERT INTO health_conditions (name) VALUES
('Астма'), ('Жүрек аурулары'), ('Аллергия');

INSERT INTO user_health_conditions (user_id, condition_id) VALUES
(2, 1), (2, 2), (1, 3);

INSERT INTO ml_models (name, version, accuracy, trained_at) VALUES
('PM25-Forecast', '1.0', 78.50, '2026-09-01 10:00:00'),
('PM25-Forecast', '1.1', 82.30, '2026-10-01 10:00:00'),
('PM25-Forecast', '2.0', 86.70, '2026-11-01 10:00:00');

INSERT INTO measurements (district_id, measured_at, pm25, aqi) VALUES
(1, '2026-11-20 08:00:00', 45.20, 120),
(1, '2026-11-20 14:00:00', 38.10, 105),
(2, '2026-11-20 08:00:00', 62.40, 155),
(3, '2026-11-20 08:00:00', 30.00, 90),
(4, '2026-11-20 08:00:00', 75.80, 165);

INSERT INTO forecasts (district_id, model_id, forecast_time, pm25_value, risk_level) VALUES
(1, 3, '2026-11-21 08:00:00', 48.00, 'орташа'),
(2, 3, '2026-11-21 08:00:00', 70.50, 'жоғары'),
(3, 3, '2026-11-21 08:00:00', 28.30, 'төмен'),
(4, 3, '2026-11-22 08:00:00', 80.10, 'жоғары'),
(2, 2, '2026-11-22 08:00:00', 55.00, 'орташа');

-- Сұраныс 1: 3 кестені JOIN
SELECT d.name AS district, f.forecast_time, f.pm25_value, f.risk_level,
       m.version AS model_version, m.accuracy
FROM forecasts f
JOIN districts d ON d.district_id = f.district_id
JOIN ml_models m ON m.model_id = f.model_id
ORDER BY f.forecast_time, d.name;

-- Сұраныс 2: GROUP BY
SELECT d.name AS district, COUNT(ms.measurement_id) AS measurements_count,
       ROUND(AVG(ms.pm25), 2) AS avg_pm25
FROM districts d
JOIN measurements ms ON ms.district_id = d.district_id
GROUP BY d.name
ORDER BY avg_pm25 DESC;
