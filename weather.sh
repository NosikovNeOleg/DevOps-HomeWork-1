#!/usr/bin/bash

CITY=$1

echo "<html>"
echo "<br/>"

WEATHER_JSON=$(curl -s "wttr.in/${CITY}?format=j1")
TEMP=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].temp_C')
HUMIDITY=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].humidity')
DATE=$(date)

echo "<body>"
echo "  <div>"
echo "    <h1>Current city - ${CITY}</h1>"
echo "    <div>"
echo "      <strong>Date: </strong> ${DATE}<br/>"
echo "      <strong>Temperature: </strong> ${TEMP} 'C<br/>"
echo "      <strong>Humidity: </strong> ${HUMIDITY}%<br/>"
echo "    </div>"
echo "  </div>"
echo "</body>"

echo "</html>"
