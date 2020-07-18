import config from '../config.js';
import querystring from 'querystring';

export default class APIClient {
  constructor(targetServer = config.apiServer.targetServer) {
    this.apiUrl = `${targetServer}/${config.apiServer.version}`;
  }

  async makeRequest(options) {
    if (!options.endpoint) {
      throw new Error('makeRequest: endpoint is a required options field');
    }

    const defaultOptions = {
      accept: 'application/json',
      contentType: 'application/json',
      method: 'GET',
      body: null,
    };

    options = Object.assign({}, defaultOptions, options);

    let url = `${this.apiUrl}/${options.endpoint}?token=792abd62-eeba-4d2b-b6bf-57692ed3f7eb`;
    let data = {
      headers: {
        'Accept': options.accept,
        'Content-Type': options.contentType,
      },
      method: options.method,
    };

    if (options.body) {
      if (['GET', 'DELETE'].indexOf(options.method) > -1) {
        url = `${url}?${querystring.stringify(options.body)}`;
      }

      if (['POST', 'PUT'].indexOf(options.method) > -1) {
        data.body = JSON.stringify(options.body);
      }
    }

    return (await fetch(url, data)).json();
  }
}
