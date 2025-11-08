import os
from re import template
import MySQLdb
from flask import Flask, session, url_for, redirect, render_template, request, abort, flash
from database import db_connect, user_reg, user_loginact, user_upload, user_viewimages
from database import db_connect, image_info, view_pred
from database import db_connect
from werkzeug.utils import secure_filename


app = Flask(__name__)
app.secret_key = os.urandom(24)


@app.route("/")
def FUN_root():
    return render_template("index.html")


@app.route("/index.html")
def logout():
    return render_template("index.html")


@app.route("/register.html")
def reg():
    return render_template("register.html")


@app.route("/login.html")
def login():
    return render_template("login.html")


@app.route("/upload.html")
def up():
    return render_template("upload.html")


@app.route("/viewdata.html")
def up1():
    return render_template("viewdata.html")


@app.route("/regact", methods=['GET', 'POST'])
def registeract():
    if request.method == 'POST':
        id = "0"
        status = user_reg(id, request.form['username'], request.form['password'],
                          request.form['email'], request.form['mobile'], request.form['address'])
        if status == 1:
            return render_template("login.html", m1="sucess")
        else:
            return render_template("register.html", m1="failed")


@app.route("/loginact", methods=['GET', 'POST'])
def useract():
    if request.method == 'POST':
        status = user_loginact(
            request.form['username'], request.form['password'])
        print(status)
        if status == 1:
            session['username'] = request.form['username']
            return render_template("userhome.html", m1="sucess")
        else:
            return render_template("login.html", m1="Login Failed")


@app.route("/upload", methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        id = "0"
        status = user_upload(id, request.form['name'], request.form['image'])
        if status == 1:
            return render_template("upload.html", m1="sucess")
        else:
            return render_template("upload.html", m2="failed")


@app.route("/viewimage.html")
def viewimages():
    data = user_viewimages(session['username'])

    print(data)
    return render_template("viewimage.html", user=data)


@app.route("/track")
def track():
    name = request.args.get('name')
    iname = request.args.get('iname')

    data = image_info(iname)
    print("dddddddddddddddddddddddddddd")
    print(data)
    # data = v_image(data)
    # print("dddddddddddddddddddddddddddd")
    # print(data)
    return render_template("viewdata.html", m1="sucess", data=data)


@app.route("/predict", methods=['GET', 'POST'])
def predict1():
    if request.method == 'POST':
        Soiltype = request.form['Soiltype']
        n = int(request.form['n'])
        p = int(request.form['p'])
        k = int(request.form['k'])
        ph = float(request.form['ph'])
        temp = int(request.form['temp'])
        import pandas as pd
        import numpy as np
        optimum = pd.read_excel("optimum2.xlsx", 'newData')
        # price = pd.read_excel("optimum2.xlsx", 'pricePerhr')
        optimum['N'] = optimum.N.astype(float)
        optimum['P'] = optimum.P.astype(float)
        optimum['K'] = optimum.K.astype(float)
        optimum['TEMPERATURE'] = optimum.TEMPERATURE.astype(float)
        X = optimum.drop("CLASS", axis=1)
        y = optimum.CLASS
        from sklearn.neighbors import KNeighborsClassifier
        clf = KNeighborsClassifier(n_neighbors=3)
        clf.fit(X, y)
        columns = ['N', 'P', 'K', 'pH', 'TEMPERATURE']
        values = np.array([n, p, k, ph, temp])
        pred = pd.DataFrame(values.reshape(-1, len(values)), columns=columns)
        # print(pred.dtype)
        print(pred)
        prediction = clf.predict(pred)
        print(prediction)

        # prediction=1
        data = view_pred(prediction[0])
        return render_template('crops.html', data=data)


if __name__ == "__main__":
    app.run(debug=True, host='127.0.0.1', port=5000)
