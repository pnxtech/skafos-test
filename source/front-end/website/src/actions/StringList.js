import APIClient from '../lib/APIClient';

export function getStringHistory() {
  return async function(dispatch) {
    dispatch({type: 'SL_REQUEST'});

    let client = new APIClient();
    let result;
    try {
      result = await client.makeRequest({
        authorize: true,
        endpoint: 'string/history',
        method: 'GET'
      });
      dispatch({type: 'SL_SUCCESS', payload: result});
    } catch (e) {
      dispatch({type: 'SL_FAILURE'});
    }
  }
}
