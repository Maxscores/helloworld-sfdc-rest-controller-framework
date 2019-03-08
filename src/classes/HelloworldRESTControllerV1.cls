/**
 * Created by mstackhouse on 3/7/2019.
 * Description: 
 * Test: 
 */

@RestResource(UrlMapping='/v1/helloworld')
global with sharing class HelloworldRESTControllerV1 extends RESTController {
    private static HelloworldRESTControllerV1 controller = new HelloworldRESTControllerV1();

    @HttpGet
    global static void getRequest() {
        controller.getRecords();
    }

    @HttpPost
    global static void postRequest() {
        controller.postRecords();
    }

    protected override void getRecords() {
        envelope.setData('hello world');

        response.responseBody = envelope.asBlob();
        response.addHeader('Content-Type', 'application/json');
    }

    protected override void postRecords() {
        Blob requestBody = request.requestBody;

        RequestEnvelope requestEnvelope = new RequestEnvelope(requestBody.toString());

        if (requestEnvelope.data.firstName != null && requestEnvelope.data.lastName != null) {
            String responseString = 'hello, ' + requestEnvelope.data.firstName + ' ' + requestEnvelope.data.lastName;
            envelope.setData(responseString);
        } else {
            envelope.addError('first or last name not sent');
            response.statuscode = StatusCode.badRequest;
        }
        response.responseBody = envelope.asBlob();
        response.addHeader('Content-Type', 'application/json');

    }

    public class RequestEnvelope {
        public Person data;

        public RequestEnvelope(String jsonRequest) {
            // we're deserializing into the class
            RequestEnvelope request = (RequestEnvelope) JSON.deserialize(jsonRequest, RequestEnvelope.class);
            // we're using deserialixed class to set the class we're creating
            data = request.data;
        }
    }

    public class Person {
        public String firstName;
        public String lastName;
    }
}
