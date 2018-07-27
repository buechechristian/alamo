import datetime
import json
import requests

SF_ID = "0801"
BASE_URL = 'https://feeds.drafthouse.com/adcService/showtimes.svc/calendar/'


def get_cinema_date_object(response):
    """parse this crazy nested dictionary and return list of films"""
    today = datetime.datetime.now().isoformat()
    # Get the substring of the date from before the T
    today_date = today.split('T')[0]

    cinema = response['Calendar']['Cinemas'][0]
    
    films = None
    for month in cinema['Months']:
        for week in month['Weeks']:
            for day in week['Days']:
                if today_date in day['Date']:
                    films = day['Films']

    # couldn't find today's date in the list of days for this calendar
    if films == None:
        print("The cinema_id {} isn't playing any movies today wtf".format(films))
        exit()

    return films


def main():
    url = BASE_URL + SF_ID
    r = requests.get(url)
    json_response = r.text
    response = json.loads(json_response)
    movies = get_cinema_date_object(response)
    print(movies)


if __name__ == '__main__':
    main()
