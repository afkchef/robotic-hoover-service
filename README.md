# robotic-hoover-service
## Summary

A docker container with a robotic hoover service that navigates an imaginary room and reports back patches of dirt cleaned.

## Instructions

### How to build docker container

> docker build -t pltsci-sdet-assignment .

#### How to run container

> docker run -d -p 8080:8080 --name pltsci-sdet-assignment pltsci-sdet-assignment

The service is now runnning on http://0.0.0.0:8080

### How to connect to the running service

Once the hoover service is running:

- Open an remote connection to the running docker container and open a terminal inside your new session. There are a few ways to do this:

    - On your terminal:
    > docker exec -it pltsci-sdet-assignment sh 
    
    - Using docker desktop, open running containers, open pltsci-sdet-assignment
    - Using VSCODE >> Open a Remote Window >> Attach to a running container... >> pltsci-sdet-assignment

- Navigate to the working directory '/robotic-hoover-service'

### How to run the test suite

The following commands will help test the hoover service. The BDD framework used is behave (https://behave.readthedocs.io/en/stable/index.html). I also provide features to be tested in Gherkin syntax in the '/features'. To look at the different human readable features tested navigate to '/features/steps' folder. The steps.py file provides the assertions for the features being tested. 

Displays a quick report on all features in terminal:
> behave

Displays and saves a junit style report per feature to a relative folder '/reports':
> behave --junit

My favorite way to export report with behave. This outputs a json readable file on 'reports/json-report.txt':
> behave -f json.pretty -o reports/json-report.txt

### How to tear down the service:

> docker stop pltsci-sdet-assignment

> docker rm pltsci-sdet-assignment


