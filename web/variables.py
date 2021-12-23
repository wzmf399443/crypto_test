import os
from dotenv import load_dotenv
load_dotenv()

TIMEOUT = os.getenv("TIMEOUT", "300")

# Browser
BROWSER_PORT = os.getenv('BROWSER_PORT', "4444")
DEFAULT_BROWSER = os.getenv("DEFAULT_BROWSER", "chrome")
WINDOW_HEIGHT = os.getenv("WINDOW_HEIGHT", "1080")
WINDOW_WEIGHT = os.getenv("WINDOW_WEIGHT", "1920")
