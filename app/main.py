from flask import Flask, jsonify, send_file


app = Flask(__name__)

@app.route("/hello")
def hello():
   return "Hello World from Flask API!\n"

@app.route("/")
def main():
    return send_file('./static/index.html')


@app.route("/healthcheck", methods=['POST'])
def healthcheck():
        return "200"

if __name__ == "__main__":
   app.run(host='0.0.0.0', debug=True, port=8887)

