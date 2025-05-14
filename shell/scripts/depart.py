#!/usr/bin/env python3

import requests
import json
from datetime import datetime, timedelta, timezone
import os
import pandas as pd

# Nationaltheateret tog
# NSR:StopPlace:288 - NSR:Quay:475 (spor 1 retning som jeg reiser), NSR:Quay:478 (spor 2 retning som jeg reiser, enten 1 eller 2 kommer toget mitt på)

# Stokke tog
# NSR:StopPlace:132

# Nationaltheateret T
# NSR:StopPlace:58404 - NSR:Quay:7333 (spor 1 mot sentrum)

# Blindern T
# NSR:StopPlace:6332 - NSR:Quay:11636 (spor 1, retning som jeg reiser)

# Konfigurasjon
CUSTOM_SCRIPTS_LOCATION = os.path.expanduser(
    "/Users/sharu/Documents/hobby/custom_scripts")
ENTUR_API = "https://api.entur.io/journey-planner/v3/graphql"
CLIENT_NAME = "depart-pendler"
ID_MAP = {
    "tog": "National tog til Stokke tog",
    "tbane": "Blindern T til National T"
}
FILENAMES = {
    "tog": "depart_tog.graphql",
    "tbane": "depart_tbane.graphql"
}


def query_entur(query_file):
    with open(query_file, "r") as file:
        query = file.read()

    response = requests.post(
        ENTUR_API,
        headers={"Content-Type": "application/json",
                 "ET-Client-Name": CLIENT_NAME},
        data=json.dumps({"query": query}),
    )

    if response.status_code == 200:
        return response.json()
    else:
        print(
            f"Feil ved henting av data fra Entur API: {response.status_code}")
        return None


def get_time(timestamp):
    return datetime.fromisoformat(timestamp.replace("Z", "+00:00"))


all_train_trips = []
all_tbane_trips = []
for tag, f in FILENAMES.items():
    data = query_entur(os.path.join(CUSTOM_SCRIPTS_LOCATION, f))

    if data:
        trip_patterns = data.get("data", {}).get(
            "trip", {}).get("tripPatterns", [])

        for trip_pattern in trip_patterns:
            leg = trip_pattern["legs"][0]
            # Hent avgangstid, ankomsttid og linje/retning
            departure_time = leg["fromEstimatedCall"]["expectedDepartureTime"]
            arrival_time = leg["toEstimatedCall"]["expectedArrivalTime"]
            departure_time_aimed = leg["fromEstimatedCall"]["aimedDepartureTime"]
            arrival_time_aimed = leg["toEstimatedCall"]["aimedArrivalTime"]

            line_code = leg["line"]["publicCode"]
            line_name = leg["line"]["name"]

            dt = get_time(departure_time)
            dt_arr = get_time(arrival_time)

            dt_aim = get_time(departure_time)
            dt_aim_arr = get_time(arrival_time)

            item = {
                "line_code": line_code,
                "line_name": line_name,
                "time": dt,
                "time_arr": dt_arr,
                "time_aim": dt_aim,
                "time_aim_arr": dt_aim_arr,
                "tag": tag
            }
            if tag == "tog":
                all_train_trips.append(item)
            else:
                all_tbane_trips.append(item)


def print_journey(item):
    time_cols = ["time_aim", "time_aim_arr", "time", "time_arr"]
    item_cpy = item.copy()
    for c in time_cols:
        item_cpy[c] = item_cpy[c].strftime("%H:%M")

    print(
        f"| {item_cpy['line_code']:<5} - {item_cpy['line_name']:<30} | " +
        f"{item_cpy['time_aim']} ({item_cpy['time']}) - {item_cpy['time_aim_arr']} ({item_cpy['time_arr']}) |"
        # (Plan, Expected)
    )


def print_title():
    print("="*74)
    print(
        f"{'| Linje':<40} | " +
        f"{'start - end (and expected)':<29} |"
    )
    print("="*74)


all_trips = all_train_trips + all_tbane_trips
all_trips = sorted(all_trips, key=lambda x: x["time_aim"])

next_train_departure = min(all_train_trips, key=lambda x: x['time_aim'])
if next_train_departure['time_aim'] > datetime.now().astimezone() + timedelta(minutes=30):
    print("No valid train departure within 30 minutes.")
else:
    # Step 2: Find the closest tbane departure with at least a 10-minute buffer
    time_delta = timedelta(minutes=5)
    time_limit = next_train_departure["time_aim"] - time_delta
    closest_tbane_departures = sorted(
        filter(lambda x: x["time_aim"] <= time_limit, all_tbane_trips),
        key=lambda x: x["time_aim"]
    )[:5]

    print(f"\n=== Recommended ===")
    print_title()
    for cl in closest_tbane_departures:
        print_journey(cl)
    print_journey(next_train_departure)

print(f"\n=== Departures ===")
print_title()
for journey in all_trips:
    print_journey(journey)
