import requests
from bs4 import BeautifulSoup
import json
import re



base_url = "https://www.themoviedb.org/movie"
headers = {
    "User-Agent": "Mozilla/5.0"
}

movies_data = []

for page in range(1, 51):
    print(f"Scraping page {page}...")

    url = f"{base_url}?page={page}"
    response = requests.get(url, headers=headers)

    if response.status_code != 200:
        print(f"Failed on page {page}")
        continue

    soup = BeautifulSoup(response.text, "html.parser")
    movies = soup.find_all("div", class_="card style_1")

    for movie in movies:
        title = movie.find("h2").get_text(strip=True)

        release_date = movie.find("p").get_text(strip=True)
        year_match = re.search(r"\d{4}", release_date)
        year = int(year_match.group()) if year_match else None

        rating_div = movie.find("div", class_="user_score_chart")
        rating = rating_div["data-percent"] if rating_div else None

        movie_dict = {
            "title": title,
            "release_date": release_date,
            "year": year,
            "rating": rating
        }

        movies_data.append(movie_dict)

print("Total movies scraped:", len(movies_data))

#print(movies_data[0])

# with open("tmdb_movies.json", "w", encoding="utf-8") as f:
#     json.dump(movies_data, f, ensure_ascii=False, indent=4)
#
# print("JSON file saved successfully!")
