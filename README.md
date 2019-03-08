# helloworld-sfdc-rest-controller-framework
a helloworld example for the REST controller framework: https://github.com/Maxscores/sfdc-rest-controller-framework


Here are the challenges:
REST Endpoint Challenges

Goal: 
1) Build a GET endpoint at `/v1/helloworld`
request Body: none
response:
```
{
"errors":[],
"messages":[],
"data": "hello world"
}
```

2) Build a POST endpoint at '/v1/helloworld'
request Body:
```
{
"data": {
	"firstName": "string",
	"lastName": "string"
	}
}
```
response Body:
```
{
"errors":[],
"messages":[],
"data": "hello, {!firstName} {!lastName}"
}
```

2b) validate the inputs, make sure that both firstName and lastName are sent in the body. If not, return an error message using the error list and return a 400 status code.


3) Build a POST endpoint at '/v1/blogs' (using the BlueWave_Blog__c object) 
You'll need to insert a Blog object into the database and return the Id of the object
request Body:
```
{
"data": {
	"body": "string",
	"description": "string",
	"title": "string"
	}
}
```
response Body:
```
{
"errors":[],
"messages":[],
"data": {
	"id" : "string", <- salesforce Id
	"body": "string",
	"description": "string",
	"title": "string"
	}
}
```

3b) Setup validations so that you have all of the fields necessary.


4) Build a GET endpoint at '/v1/blogs/{id}' <- you'll need to get the id from the URL
You'll need to return a Blog object with the Id that is passed in.

request Body: none
response Body:
```
{
"errors":[],
"messages":[],
"data": {
	"id" : "string", <- salesforce Id
	"body": "string",
	"description": "string",
	"title": "string"
	}
}
```

4b) Send a 404 status code back if there was no Id that matched.
