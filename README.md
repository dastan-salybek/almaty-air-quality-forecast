# \## Интерфейс

# 

# \- \[Навигация диаграммасы (PNG)](docs/ui/navigation.png)

# \- \[Навигация диаграммасы (Draw.io)](docs/ui/navigation.drawio)

# \- \[Интерфейсті бағалау](docs/ui/evaluation.md)

# 

# \### Экран макеттері

# \- \[01 — Кіру (Login)](docs/ui/screens/01-login.png)

# \- \[02 — Басты бет (Home)](docs/ui/screens/02-home.png)

# \- \[03 — Өлшемдер тізімі (List)](docs/ui/screens/03-list.png)

# \- \[04 — Өлшем қосу формасы (Form)](docs/ui/screens/04-form.png)

# \- \[05 — Қате хабарламалары (Form Error)](docs/ui/screens/05-form-error.png)

# \- \[06 — Болжам және қауіп деңгейі (Forecast)](docs/ui/screens/06-forecast.png)

# \- \[07 — Денсаулық профилі (Profile)](docs/ui/screens/07-profile.png)

# 

# \### Түстер кестесі (`forecasts.risk\_level`)

# 

# Жүйеде 4 негізгі түс қолданылады (негізгі интерфейс үшін көк/сұр және қауіп деңгейлерін көрсетуге арналған 3 индикатор түсі):

# 

# | Мән (`risk\_level`) | Түс атауы | HEX коды | Мағынасы |

# | :--- | :--- | :--- | :--- |

# | `төмен` | Жасыл | `#28A745` | Ауа сапасы қауіпсіз, шектеу жоқ |

# | `орташа` | Сары | `#FFC107` | Сезімтал топтарға сақтық шаралары қажет |

# | `жоғары` | Қызыл | `#DC3545` | Денсаулыққа қауіпті, далада болуды шектеу керек |

# 

# \### Сәйкестік кестесі

# 

# | Экран | Талап | Кесте (`schema.sql`) | Бағандар |

# | :--- | :--- | :--- | :--- |

# | 01 — Кіру | Жүйеге кіру | `users` | `email` |

# | 02 — Басты бет | 1, 8 | `districts`, `measurements` | `name`, `aqi`, `pm25` |

# | 03 — Өлшемдер тізімі | 5 | `measurements`, `districts` | `district\_id`, `measured\_at`, `pm25`, `aqi` |

# | 04 — Өлшем қосу формасы | 6 | `measurements` | `district\_id`, `measured\_at`, `pm25`, `aqi` |

# | 05 — Қате хабарламалары | 6 | `measurements` | `pm25` (бос өріс), `aqi` (қате формат) |

# | 06 — Болжам және қауіп | 2, 3 | `forecasts`, `districts` | `district\_id`, `forecast\_date`, `predicted\_pm25`, `risk\_level` |

# | 07 — Денсаулық профилі | 4 | `users`, `health\_profiles` | `user\_id`, `condition\_type`, `recommendations` |


## Интерфейс

- [Навигация диаграммасы (PNG)](docs/ui/navigation.png)
- [Навигация диаграммасы (Draw.io)](docs/ui/navigation.drawio)
- [Интерфейсті бағалау](docs/ui/evaluation.md)

### Экран макеттері
- [01 — Кіру (Login)](docs/ui/screens/01-login.png)
- [02 — Басты бет (Home)](docs/ui/screens/02-home.png)
- [03 — Өлшемдер тізімі (List)](docs/ui/screens/03-list.png)
- [04 — Өлшем қосу формасы (Form)](docs/ui/screens/04-form.png)
- [05 — Қате хабарламалары (Form Error)](docs/ui/screens/05-form-error.png)
- [06 — Болжам және қауіп деңгейі (Forecast)](docs/ui/screens/06-forecast.png)
- [07 — Денсаулық профилі (Profile)](docs/ui/screens/07-profile.png)

### Түстер кестесі (`forecasts.risk_level`)

| Мән (`risk_level`) | Түс атауы | HEX коды | Мағынасы |
| :--- | :--- | :--- | :--- |
| `төмен` | Жасыл | `#28A745` | Ауа сапасы қауіпсіз, шектеу жоқ |
| `орташа` | Сары | `#FFC107` | Сезімтал топтарға сақтық шаралары қажет |
| `жоғары` | Қызыл | `#DC3545` | Денсаулыққа қауіпті, далада болуды шектеу керек |

### Сәйкестік кестесі

| Экран | Талап | Кесте (`schema.sql`) | Бағандар |
| :--- | :--- | :--- | :--- |
| 01 — Кіру | Жүйеге кіру | `users` | `email` |
| 02 — Басты бет | 1, 8 | `districts`, `measurements` | `name`, `aqi`, `pm25` |
| 03 — Өлшемдер тізімі | 5 | `measurements`, `districts` | `district_id`, `measured_at`, `pm25`, `aqi` |
| 04 — Өлшем қосу формасы | 6 | `measurements` | `district_id`, `measured_at`, `pm25`, `aqi` |
| 05 — Қате хабарламалары | 6 | `measurements` | `pm25` (бос өріс), `aqi` (қате формат) |
| 06 — Болжам және қауіп | 2, 3 | `forecasts`, `districts` | `district_id`, `forecast_date`, `predicted_pm25`, `risk_level` |
| 07 — Денсаулық профилі | 4 | `users`, `health_profiles` | `user_id`, `condition_type`, `recommendations` |
## Құжаттама
- [Activity: ауа сапасының болжамын көру](docs/analysis/activity-view-air-forecast.png)
- [Sequence: ауа сапасының болжамын көру](docs/analysis/sequence-view-air-forecast.png)
- [Context DFD](docs/analysis/dfd-context.png)
- [DFD 0-деңгей](docs/analysis/dfd-level0.png)
- [DFD 1-деңгей](docs/analysis/dfd-level1.png)
- [ERD](docs/database/erd.png)
- [SQL схема](docs/database/schema.sql)
- [Сұраныс нәтижесі](docs/database/query-results.png)
