import os
from dotenv import load_dotenv
load_dotenv()

TIMEOUT = os.getenv("TIMEOUT", "30")

# Host
API_HOST = os.getenv('API_HOST', "https://pda.weather.gov.hk")
