"""TestRail API binding for Python 3.x.

(API v2, available since TestRail 3.0)

Compatible with TestRail 3.0 and later.

Learn more:

http://docs.gurock.com/testrail-api2/start
http://docs.gurock.com/testrail-api2/accessing

Copyright Gurock Software GmbH. See license.md for details.
"""

import base64
import json
import logging
import requests


class APIClient:
    connected_client = None
    current_test_run_id = None
    current_testcase_name = None
    current_testcase_status = None
    current_testcase_status_comment = None

    def __init__(self, base_url):
        self.user = ''
        self.password = ''
        if not base_url.endswith('/'):
            base_url += '/'
        self.__url = base_url + 'index.php?/api/v2/'

    def send_get(self, uri, filepath=None):
        """Issue a GET request (read) against the API.

        Args:
            uri: The API method to call including parameters, e.g. get_case/1.
            filepath: The path and file name for attachment download; used only
                for 'get_attachment/:attachment_id'.

        Returns:
            A dict containing the result of the request.
        """
        return self.__send_request('GET', uri, filepath)

    def send_post(self, uri, data):
        """Issue a POST request (write) against the API.

        Args:
            uri: The API method to call, including parameters, e.g. add_case/1.
            data: The data to submit as part of the request as a dict; strings
                must be UTF-8 encoded. If adding an attachment, must be the
                path to the file.

        Returns:
            A dict containing the result of the request.
        """
        return self.__send_request('POST', uri, data)

    def __send_request(self, method, uri, data):
        url = self.__url + uri

        auth = str(
            base64.b64encode(
                bytes('%s:%s' % (self.user, self.password), 'utf-8')
            ),
            'ascii'
        ).strip()
        headers = {'Authorization': 'Basic ' + auth}

        if method == 'POST':
            if uri[:14] == 'add_attachment':    # add_attachment API method
                files = {'attachment': (open(data, 'rb'))}
                response = requests.post(url, headers=headers, files=files)
                files['attachment'].close()
            else:
                headers['Content-Type'] = 'application/json'
                payload = bytes(json.dumps(data), 'utf-8')
                response = requests.post(url, headers=headers, data=payload)
        else:
            headers['Content-Type'] = 'application/json'
            response = requests.get(url, headers=headers)

        if response.status_code > 201:
            try:
                error = response.json()
            except:     # response.content not formatted as JSON
                error = str(response.content)
            raise APIError('TestRail API returned HTTP %s (%s)' % (response.status_code, error))
        else:
            if uri[:15] == 'get_attachment/':   # Expecting file, not JSON
                try:
                    open(data, 'wb').write(response.content)
                    return (data)
                except:
                    return ("Error saving attachment.")
            else:
                try:
                    return response.json()
                except: # Nothing to return
                    return {}


class APIError(Exception):
    pass


def login_to_testrail_server(url, username, password):

    client = APIClient(url)
    client.user = username
    client.password = password
    APIClient.connected_client = client


def set_testcase_inputs(testrun_id=APIClient.current_test_run_id,
                        testcase_id=APIClient.current_testcase_name,
                        testcase_status= APIClient.current_testcase_status,
                        testcase_comment= APIClient.current_testcase_status_comment
                        ):
    APIClient.current_test_run_id = testrun_id
    APIClient.current_testcase_name = testcase_id
    APIClient.current_testcase_status = testcase_status
    APIClient.current_testcase_status_comment = testcase_comment


def get_testcase_by_id(testcase_id):
    testcase_spec = APIClient.connected_client.send_get('get_case/' + testcase_id)
    print(testcase_spec)
    return testcase_spec


def set_testcase_result_by_id():
    # pass = 1 , failed = 5 , retest = 4 , retest = 3 , blocked = 2
    if APIClient.current_testcase_status == 'FAIL' :
        test_status = 5
    else:
        test_status = 1

    result = APIClient.connected_client.send_post(
        'add_result_for_case/' + APIClient.current_test_run_id + '/' +
        APIClient.current_testcase_name.split('_')[0],
        {'status_id': test_status,
         'comment': APIClient.current_testcase_status_comment}
    )
    logging.info('Testrail testcase  wih id ' + APIClient.current_testcase_name.split('_')[0] +
                 ' with state ' + APIClient.current_testcase_status +
                 ' with message ' + APIClient.current_testcase_status_comment + ' is updated.')

    return result
