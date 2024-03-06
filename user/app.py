from flask import Flask, request, render_template, redirect, url_for, jsonify
from flask_bootstrap import Bootstrap  # Import Flask-Bootstrap
from werkzeug.utils import secure_filename
import os

app = Flask(__name__)
bootstrap = Bootstrap(app)  # Initialize Flask-Bootstrap
app.config['MAX_CONTENT_LENGTH'] = 64 * 1024 * 1024  # for 16 MB limit

assignments = [("Assignment 1", 0), ("Assignment 2", 1), ("Assignment 3", 3), ("Assignment 4", 4), ("Assignment 5", 2)]

@app.route("/")
def index():
    return render_template("index.html", nav="Index", assignments=sorted(assignments, key=lambda x: x[1]))

@app.route('/submit', methods=['GET', 'POST'])
def submit():
    if request.method == 'POST':
        # Check if the post request has the file part
        if 'file' not in request.files:
            print('No file part')
            return redirect(request.url)
        file = request.files['file']
        # If the user does not select a file, the browser submits an
        # empty file without a filename.
        if file.filename == '':
            print('No selected file')
            return redirect(request.url)
        if file:
            # Save the file to the server's filesystem or handle it as needed
            filename = secure_filename(file.filename)
            file.save(os.path.join('/path_to_save_files', filename))
            return 'File successfully uploaded'
    return render_template('submit.html', nav="Submit")

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400
    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        file.save(os.path.join('/user/uploaded', filename))
        return jsonify({'message': 'File successfully uploaded'}), 200
    else:
        return jsonify({'error': 'Invalid file type'}), 400

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() == 'zip'

if __name__ == "__main__":
    app.run(debug=True)
