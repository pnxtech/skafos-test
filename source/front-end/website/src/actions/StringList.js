import APIClient from '../lib/APIClient';

export function getStringHistory() {
  return async function(dispatch) {
    dispatch({type: 'SL_REQUEST'});

    let client = new APIClient();
    let result;
    try {
      result = await client.makeRequest({
        endpoint: 'string/history',
        method: 'GET'
      });
      dispatch({type: 'SL_SUCCESS', payload: result});
    } catch (e) {
      dispatch({type: 'SL_FAILURE'});
    }
  }
}

export function submitString(string) {
  return async function(dispatch) {
    let client = new APIClient();
    let result;
    try {
      result = await client.makeRequest({
        endpoint: 'string/reverse',
        method: 'POST',
        body: {
          string
        }
      });

      dispatch({type: 'SL_ADD', payload: {
        original: string,
        processed: result.string,
        length: result.length
      }});
    } catch (e) {
      dispatch({type: 'SL_FAILURE'});
    }
  }
}
