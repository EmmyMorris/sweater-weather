# Sweater Weather
## About
Project Description
You are a back-end developer working on a team that is building an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API that satisfies the front-end team’s requirements

## Initial Setup
1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`
5. Install the Figaro gem: `bundle exec figaro install`
6. Create an account with [Open Weather Map](https://home.openweathermap.org/users/sign_up) and request an API key
7. Create an account with [Map Quest API](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register)
8. Create an account with [Unsplash API](https://unsplash.com/join)
9. Add your API key to the `application.yml` created by Figaro:
  ```rb
  mapquest_key: your_api_key
  openweather_key: your_api_key
  unsplash_key: your_api_key
  ```
  
  ## Versions

- Ruby 2.7.2

- Rails 5.2.6


## Important Gems
Testing
* [rspec-rails](https://github.com/rspec/rspec-rails)
* [capybara](https://github.com/teamcapybara/capybara)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [simplecov](https://github.com/simplecov-ruby/simplecov)
* [webmock](https://github.com/bblimke/webmock)
* [vcr](https://github.com/vcr/vcr)

API Consumption
* [faraday](https://github.com/lostisland/faraday)
* [figaro](https://github.com/laserlemon/figaro)

## Running the tests
Run `bundle exec rspec` to run the test suite

## End Points
**Forecast**
- GET /api/v1/forecast
> Get forcast for location
> PATH PARAMETERS- :location(string)- REQUIRED
> Example request:
```rb
http://localhost:3000/api/v1/forecast?location=denver,co
```
> Example response:
```rb
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "id": null,
            "current_weather": {
                "datetime": "2021-08-10 21:12:15 -0600",
                "sunrise": "06:07",
                "sunset": "20:02",
                "temperature": 79.07,
                "feels_like": 79.07,
                "humidity": 24,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "scattered clouds",
                "icon": "03n"
            },
            "daily_weather": [
                {
                    "date": "2021-08-10",
                    "sunrise": "06:07",
                    "sunset": "20:02",
                    "max_temp": 94.71,
                    "min_temp": 71.51,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-08-11",
                    "sunrise": "06:08",
                    "sunset": "20:01",
                    "max_temp": 97.09,
                    "min_temp": 72.73,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-08-12",
                    "sunrise": "06:09",
                    "sunset": "20:00",
                    "max_temp": 87.73,
                    "min_temp": 75.13,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-08-13",
                    "sunrise": "06:10",
                    "sunset": "19:59",
                    "max_temp": 93.45,
                    "min_temp": 70.39,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "2021-08-14",
                    "sunrise": "06:11",
                    "sunset": "19:57",
                    "max_temp": 94.26,
                    "min_temp": 69.94,
                    "conditions": "few clouds",
                    "icon": "02d"
                }
            ],
            "hourly_weather": [
                {
                    "datetime": "2021-08-10",
                    "temp": 79.07,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "datetime": "2021-08-10",
                    "temp": 79.92,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "datetime": "2021-08-10",
                    "temp": 80.24,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                { ... same format for other hours  ... }
                }
            ]
        }
    }
}
```
**Backgrounds**
- GET /api/v1/backgrounds
> Get a background
> PATH PARAMETERS- :location(string)- REQUIRED
> Example request:
```rb
http://localhost:3000/api/v1/backgrounds?location=denver,co
```
> Example response:
```rb
{
    "data": {
        "id": null,
        "type": "background",
        "attributes": {
            "id": null,
            "location": "denver,co",
            "image_url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1ODV8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwxfHx8fDE2Mjg2NTE2MTg&ixlib=rb-1.2.1&q=80&w=1080",
            "credit": {
                "source": "unsplash.com",
                "author": "rdehamer",
                "logo": "https://images.unsplash.com/profile-1577912636161-6a3ada136470image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64"
            }
        }
    }
}
```
**Users**
- POST /api/v1/users
> Create a user
> Example request:
```rb
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
> Example response:
```rb
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```
**Sessions**
- POST /api/v1/sessions
> Create a session
> Example request:
```rb
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
```
> Example response:
```rb
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

**Road Trips**
- POST /api/v1/road_trip
> Get a route given two locations
> > PATH PARAMETERS- :origin(string)- REQUIRED, :destination(string)- REQUIRED
> Example request:
```rb
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
> Example response:
```rb
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```

## Contact
Created by

* Emmy Morris [GitHub](https://github.com/EmmyMorris) • [LinkedIn](https://www.linkedin.com/in/EmmyMorris/)
