from flask import Flask, request, jsonify, make_response

app = Flask(__name__)
server_version = '0.1.0'

@app.route('/', methods=['GET'])
def home():
  return 'AI Server version ' + server_version

@app.route('/v1/server/version', methods=['GET'])
def version():
  return make_response(jsonify({"version": server_version}), 200)

@app.route('/v1/string/reverse', methods=['POST'])
def reverse():
  if request.is_json:
    req = request.get_json()
    response = {
      "string": reverse_string(req.get('string'))
    }
    res = make_response(jsonify(response), 200)
    return res
  else:
    response = {
      "error": "missing string field"
    }
    res = make_response(jsonify(response), 400)

def reverse_string(s):
  return s[::-1]

if __name__ == '__main__':
  app.run(debug=False, host='0.0.0.0')
