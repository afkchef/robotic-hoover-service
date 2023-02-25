import requests
import json
from behave import given, when, then, step


@given("I have the following JSON payload")
def step_impl(context):
    context.payload = json.loads(context.text)


@when("I send a POST request to the API with the payload")
def step_impl(context):
    url = "http://0.0.0.0:8080/start_hoover"
    headers = {'Content-type': 'application/json'}
    response = requests.post(url, data=json.dumps(context.payload), headers=headers)
    context.status_code = response.status_code
    context.response_body = response.json()


@then("the response should have status code {status_code:d}")
def step_impl(context, status_code):
    assert context.status_code == status_code


@then("the response should have JSON body")
def step_impl(context):
    expected_json = json.loads(context.text)
    assert context.response_body == expected_json
