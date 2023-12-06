import datetime
import json
import os
import sys
import shutil
from pathlib import Path

import requests
from bs4 import BeautifulSoup

TOPK = 10
WIDTH_USER = 16
WIDTH_SCORE = 13
WIDTH_TIME = 13
DATE_FORMAT = "%d %b %H:%M"
ME = ["kbrodt", "Kirill"]
LB_PATH = fr"/tmp/competitions_lb.txt"
OK = 0
ERROR = -1
DONT_REFRESH = 1
NO_COOKIES = 2


def shorten(text, width):
    if len(text) > width - 2:
        text = text[:width - 4] + ".."

    return text


def format_lb(result, url):
    user, score, date = result[0]
    user = shorten(user, WIDTH_USER)
    score = shorten(score, WIDTH_SCORE)
    date = shorten(date, WIDTH_TIME + 4)
    body = rf"<b>   {user:<{WIDTH_USER}}{score:<{WIDTH_SCORE}}{date:<{WIDTH_TIME}}</b>\n"
    for i, res in enumerate(result[1:], start=1):
        user, score, date = res
        user = shorten(user, WIDTH_USER)
        _body = fr"{i:>2} {user:<{WIDTH_USER}}{score:<{WIDTH_SCORE}}{date:<{WIDTH_TIME}}"
        if user in ME:
            _body = fr"<b>{_body}</b>"

        body += fr"{_body}\n"

    result = {
        "url": url,
        "body": body,
    }

    return result


def parse_cookies(cookies_s):
    cookies = {}
    for kv in cookies_s.split():
        k, *v = kv.split("=", 1)
        v = "".join(v)
        v = v.rstrip(";")
        cookies[k] = v

    return cookies


def parse_aicrowd(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.content, "html.parser")

    table = soup.find(name="table", attrs={"class": "table"})

    header = table.find(name="thead")
    ths = header.find_all(name="th")
    if len(ths) == 9:
        _, _, user, score, _, _, date, *_ = ths
    elif len(ths) == 8:
        _, _, user, score, _, date, *_ = ths
    else:
        raise SystemExit(1)

    user = user.text.strip()
    score = score.text.strip()
    date = date.text.strip()
    result = []
    result.append((user, score, date))

    tbody_element = table.find(name="tbody")
    row_elements = tbody_element.find_all(name="tr")
    for row_element in row_elements[:TOPK]:
        tds = row_element.find_all(name="td")
        if len(tds) == 9:
            _, _, user, score, _, _, date, *_ = tds
        else:
            _, _, user, score, _, date, *_ = tds

        team = user.find(name="span", attrs={"class": "reputation-score truncate"})
        if team is None:
            _user = user.find(name="span", attrs={"class": "text-link"})
            if _user is None:
                user = user.find(name="mark")
            else:
                user = _user
        else:
            user = team

        user = user.text.strip()
        score = float(score.text.strip())
        date = date.find(name="time")
        if date is None:
            date = ""
        else:
            date = datetime.datetime.strptime(date.text, "%a, %d %b %Y %H:%M")
            date = date.strftime(DATE_FORMAT)

        result.append((user, score, date))

    return result


def parse_drivendata(url):
    page = requests.get(url.rstrip("/") + "_partial")
    soup = BeautifulSoup(page.content, "html.parser")

    table = soup.find(name="table", attrs={"id": "leaderTable"})

    header = table.find(name="thead")
    _, _, user, score, *_ = header.find_all(name="th")
    user = user.text.strip()
    score = score.find(name="span", attrs={"class": "popover-metric tooltip-underline"})
    score = " ".join(s.strip() for s in score.text.split())
    date = "Timestamp"

    result = []
    result.append((user, score, date))

    tbody_element = table.find(name="tbody")
    row_elements = tbody_element.find_all(name="tr")
    for row_element in row_elements[:TOPK]:
        _, _, user_date, score, *_ = row_element.find_all(name="td")
        date = user_date.find(name="div", attrs={"class": "d-inline-flex"})
        if date is  None:
            date = ""
        else:
            date = date.get("title")
        team = user_date.find(name="span", attrs={"title": "This is a team"})
        if team is None:
            user = user_date.find(name="a")
            if user is None:
                user = user_date
        else:
            user = team

        user = user.text.strip()
        score = float(score.text.strip())
        if len(date) > 0:
            date = datetime.datetime.strptime(date, "%Y-%m-%d %H:%M:%S %Z")
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
    score = score.text.strip()
    date = date.text.strip()

    result = []
    result.append((user, score, date))

    for row_element in row_elements[:TOPK]:
        _, user, _, date, score, *_ = row_element.find_all(name="td")

        user = user.text.strip()
        score = float(score.text.strip().split()[0])
        date = date.text.strip()
        date = datetime.datetime.strptime(date, "%m/%d/%y")
        date = date.strftime(DATE_FORMAT[:-6])

        result.append((user, score, date))

    return result


def parse_vkcup(url):
    page = requests.get(url)
    lb = json.loads(page.content)
    lb = lb["results"]

    result = []
    result.append(("User", "Score", ""))
    for row_element in lb[:TOPK]:
        user = row_element["user"]["login"]
        score = float(row_element["score"])
        score = f"{score:.5f}"
        date = ""
        result.append((user, score, date))

    return result


def parse_yandex(url, cookies):
    cookies = parse_cookies(cookies)
    page = requests.get(url, cookies=cookies)
    soup = BeautifulSoup(page.content, "html.parser")
    table = soup.find(
        name="table",
        attrs={"class": "table"},
    )
    if table is None:
        return NO_COOKIES

    header = table.find(name="thead")

    ths = header.find_all(name="th")
    _, user, score = ths
    user = user.text.strip()
    score = score.text.strip()
    date = ""
    result = []
    result.append((user, score, date))

    tbody_element = table.find(name="tbody")
    row_elements = tbody_element.find_all(name="tr")
    for row_element in row_elements[:TOPK]:
        tds = row_element.find_all(name="td")
        _, user, score = tds
        user = user.find(name="div")
        user = user.text
        score = float(score.text.strip().replace(",", ".").replace("-", "-1"))

        result.append((user, score, date))

    return result


def parse_leaderbord(url, cookies):
    if "aicrowd" in url:
        result = parse_aicrowd(url)
    elif "drivendata" in url or "prizechallenge.aisingapore" in url:
        result = parse_drivendata(url)
    elif "codalab" in url:
        result = parse_codalab(url)
    elif "cups" in url:
        result = parse_vkcup(url)
    elif "yandex" in url:
        result = parse_yandex(url, cookies)
    else:
        return []

    return result


def save_lb(result, lb_path):
    errno = DONT_REFRESH
    if not os.path.exists(lb_path):
        errno = OK
        with open(lb_path, "w") as f:
            json.dump(result, f)
            f.write("\n")

    with open(lb_path, "r") as f:
        results = [
            json.loads(line)
            for line in f
        ]

    for result_old in results:
        if result["url"] == result_old["url"]:
            break
    else:
        lb_path_out = Path(lb_path)
        shutil.copyfile(lb_path, str(lb_path_out.with_stem(f"{lb_path_out.stem}_old")))

        with open(lb_path, "a") as f:
            json.dump(result, f)
            f.write("\n")
        errno = OK

    for result_old in results:
        if result["url"] != result_old["url"]:
            continue

        if result["body"] == result_old["body"]:
            continue

        result_old["body"] = result["body"]
        errno = OK

        lb_path_out = Path(lb_path)
        shutil.copyfile(lb_path, str(lb_path_out.with_stem(f"{lb_path_out.stem}_old")))

        with open(lb_path, "w") as f:
            for result in results:
                json.dump(result, f)
                f.write("\n")

        break

    return errno


def main():
    url = sys.argv[1]
    cookies = sys.argv[2]
    try:
        result = parse_leaderbord(url, cookies)
    except:
        return ERROR

    if isinstance(result, int):
        return result

    errno = DONT_REFRESH
    if len(result) == 0:
        return errno

    if len(sys.argv) < 4:
        for u, l, d in result:
            print(f"{u:<{WIDTH_USER}}\t{l:<{WIDTH_SCORE}}\t{d:<{WIDTH_TIME}}")

        errno = OK

        return errno

    result = format_lb(result, url)
    lb_path = sys.argv[3]
    errno = save_lb(result, lb_path)

    return errno


if __name__ == "__main__":
    raise SystemExit(main())
