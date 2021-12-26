# crypto_test

It's a simple demo for web UI testing and app API testing

- [crypto_test](#crypto_test)
  - [Setup the environment](#setup-the-environment)
  - [Excuting the auto test](#excuting-the-auto-test)
  - [Test Suite](#test-suite)

## Setup the environment

1. Install Docker Engine

   - <https://docs.docker.com/engine/install/>

2. Install  pipenv

   - Brew

       ```bash
       brew install pipenv
       ```

   - pip

       ```bash
       pip install pipenv
       ```

3. Run the vurtual environment

    ```bash
    pipenv shell
    pipenv install
    ```

4. Run the docker container

    Using Docker images for the Selenium Grid Server, FYI: <https://github.com/SeleniumHQ/docker-selenium>

   - For running the Selenium Grid Server by docker

     ```bash
     $ docker run -d -p 4444:4444 --shm-size="2g" selenium/standalone-chrome:4.1.1-20211217
     ```

   - For using Mac M1 Chip

       ```bash
       $ docker run -d -p 4444:4444 -v /dev/shm:/dev/shm seleniarm/standalone-chromium
       ```

## Excuting the auto test

After the test finished, can open `report/web/log.html` to see the results by browser

- Web
  
  ```bash
  $ robot -d report/web web/test
  ```

- API

  ```bash
  $ robot -d report/api api/test
  ```

## Test Suite

Programming with Robot Framework and Python, it can program the function name like a sentence, and make the test case to be created by test scenarios (sentences)

- API

  - test point

    For api testing, it's focus on the response object and using json schema to help verify the type of the response, and then test the response code and the relation of date time is expected

  - Structure

    ```text
    api
     ┣- lib
     ┃ ┣- <library file>
     ┣- res
     ┃ ┗- schema
     ┃ ┃ ┗- <file for verify jsoonschema>
     ┣- test
     ┃ ┗- <test suite file>
     ┣- init.robot -> library management file
     ┗- variables.py -> Global variables
     ```

- Web

  - test point

    For web testing, it's focus on each part of the page, such as elements, the function of the part, the popup and dropdown, And the redirect url is follow the description.

  - Structure

    ```text
    web
    ┣- lib
    ┃ ┣- <library file>
    ┣- res
    ┃ ┣- content
    ┃ ┃ ┗- <map file for long description>
    ┃ ┗- location
    ┃ ┃ ┗- <map file for element xpath location>
    ┣ test
    ┃ ┗- <test suite file>
    ┣- init.robot -> library management file
    ┗- variables.py -> Global variables
    ```
