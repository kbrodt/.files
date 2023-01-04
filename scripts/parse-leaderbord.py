import sys
import os
import json
import datetime

import requests
from bs4 import BeautifulSoup

TOPK = 10
WIDTH_USER = 16
WIDTH_SCORE = 13
WIDTH_TIME = 13
DATE_FORMAT = "%d %b %H:%M"
ME = "kbrodt"
LB_PATH = fr"/tmp/competitions_lb.txt"


def shorten(text, width):
    if len(text) > width - 2:
        text = text[:width - 4] + ".."

    return text


def create_lb_table(result, url):
    user, score, date = result[0]
    body = rf"<b>   {user:<{WIDTH_USER}}{score:<{WIDTH_SCORE}}{date:<{WIDTH_TIME}}</b>\n"
    for i, res in enumerate(result[1:], start=1):
        user, score, date = res
        _body = fr"{i:>2} {user:<{WIDTH_USER}}{score:<{WIDTH_SCORE}}{date:<{WIDTH_TIME}}"
        if user == ME:
            _body = fr"<b>{_body}</b>"

        body += fr"{_body}\n"

    result = {
        "url": url,
        "body": body,
    }

    return result


def parse_aicrowd(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.content, "html.parser")

    table = soup.find(name="table", attrs={"class": "table"})

    header = table.find(name="thead")
    _, _, user, score, _, _, date, *_ = header.find_all(name="th")
    user = user.text.strip()
    user = shorten(user, WIDTH_USER)
    score = score.text.strip()
    date = date.text.strip()
    result = []
    result.append((user, score, date))

    tbody_element = table.find(name="tbody")
    row_elements = tbody_element.find_all(name="tr")
    for row_element in row_elements[:TOPK]:
        _, _, user, score, _, _, date, *_ = row_element.find_all(name="td")
        team = user.find(name="span", attrs={"class": "reputation-score truncate"})
        if team is None:
            user = user.find(name="span", attrs={"class": "text-link"})
        else:
            user = team

        user = user.text.strip()
        user = shorten(user, WIDTH_USER)
        score = float(score.text.strip())
        date = date.find(name="time")
        date = datetime.datetime.strptime(date.text, "%a, %d %b %Y %H:%M")
        date = date.strftime(DATE_FORMAT)

        result.append((user, score, date))

    return result


def parse_drivendata(url):
    page = requests.get(url.rstrip("/") + "_partial")
    soup = BeautifulSoup(page.content, "html.parser")

    table = soup.find(name="table", attrs={"id": "leaderTable"})

    header = table.find(name="thead")
    _, user, score, date, *_ = header.find_all(name="th")
    user = user.text.strip()
    user = shorten(user, WIDTH_USER)
    _, score = [s.strip() for s in score.text.splitlines() if len(s.strip()) > 0]
    date = date.text.strip()

    result = []
    result.append((user, score, date))

    tbody_element = table.find(name="tbody")
    row_elements = tbody_element.find_all(name="tr")
    for row_element in row_elements[:TOPK]:
        _, user, score, date, *_ = row_element.find_all(name="td")
        team = user.find(name="span", attrs={"class": "team-item"})
        if team is None:
            user = user.find(name="a")
        else:
            user = team

        user = user.text.strip()
        user = shorten(user, WIDTH_USER)
        score = float(score.text.strip())
        date = date.text.strip()
        date = datetime.datetime.strptime(date, "%Y-%m-%d %H:%M:%S")
        date = date.strftime(DATE_FORMAT)

        result.append((user, score, date))

    return result


def parse_codalab(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.content, "html.parser")

    table = soup.find(name="table", attrs={"class": "resultsTable dataTable"})
    _, header, _, *row_elements = table.find_all(name="tr")
    _, user, _, date, score, *_ = header.find_all(name="th")
    user = user.text.strip()
    user = shorten(user, WIDTH_USER)
    score = score.text.strip()
    date = date.text.strip()
    date = shorten(date, WIDTH_TIME)

    result = []
    result.append((user, score, date))

    for row_element in row_elements[:TOPK]:
        _, user, _, date, score, *_ = row_element.find_all(name="td")

        user = user.text.strip()
        user = shorten(user, WIDTH_USER)
        score = float(score.text.strip().split()[0])
        date = date.text.strip()
        date = datetime.datetime.strptime(date, "%m/%d/%y")
        date = date.strftime(DATE_FORMAT[:-6])

        result.append((user, score, date))

    return result


def main():
    url = sys.argv[1]
    if "aicrowd" in url:
        result = parse_aicrowd(url)
    elif "drivendata" in url:
        result = parse_drivendata(url)
    elif "codalab" in url:
        result = parse_codalab(url)
    else:
        return 1

    result = create_lb_table(result, url)

    ret = 1
    if not os.path.exists(LB_PATH):
        ret = 0
        with open(LB_PATH, "w") as f:
            json.dump(result, f)
            f.write("\n")

    with open(LB_PATH, "r") as f:
        results = [
            json.loads(line)
            for line in f
        ]

    for result_old in results:
        if result["url"] == result_old["url"]:
            break
    else:
        with open(LB_PATH, "a") as f:
            json.dump(result, f)
            f.write("\n")
        ret = 0

    for result_old in results:
        if result["url"] != result_old["url"]:
            continue

        if result["body"] == result_old["body"]:
            continue

        result_old["body"] = result["body"]
        ret = 0
        with open(LB_PATH, "w") as f:
            for result in results:
                json.dump(result, f)
                f.write("\n")

        break

    return ret


if __name__ == "__main__":
    raise SystemExit(main())
