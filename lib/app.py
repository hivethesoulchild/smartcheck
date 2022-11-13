

from crypt import methods
import sys
from urllib import response
from flask import Flask, jsonify, request
import pymongo
from pymongo import MongoClient
import json
from bson import json_util
import uuid
from datetime import datetime

cluster = MongoClient("mongodb+srv://NUSMartCheck:7xwAiYXG9MiEPahb@cluster0.uletfdh.mongodb.net/NUSmartApp?retryWrites=true&w=majority")
db = cluster["NUSmartApp"]
account = db["account"]
answerKeyCollection = db["answerkey"]
applicantlist = db["applicantlist"]

app = Flask(__name__)


@app.route('/test/', methods = ['GET'])
def test():

    result = nullResponse = {'_id': 'null', 'username': 'null', 'password': 'null'}
    return jsonify(nullResponse)

@app.route('/user/', methods = ['GET', 'POST'])
def index():
    username = "admin"
    password = "pass"
    result = account.find_one({"username": username, "password": password})
    return json.loads(json_util.dumps(result))

@app.route('/checkUser/', methods = ['POST'])
def checkUser():

    global response

    if(request.method == 'POST'):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        username = request_data['username']
        password = request_data['password']
        response = account.count_documents({"username": username, "password": password})
        if(response == 1):
            response = account.find_one({"username": username, "password": password})
            return jsonify(response)
        else:
            nullResponse = {'_id': 0, 'username': 'null', 'password': 'null'}
            print(response, file=sys.stderr)
            return jsonify(nullResponse)

@app.route('/checkUsername/', methods = ['POST'])
def checkUsername():
    global response

    if(request.method == 'POST'):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        username = request_data['username']
        response = account.find_one({"username": username})
        print(response, file=sys.stderr)
        return jsonify(response)

@app.route('/createUser/', methods = ['POST'])
def createUser():
    global response

    if(request.method == 'POST'):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        username = request_data['username']
        password = request_data['password']
        id = account.find({})
        response = account.insert_one({"_id": id.length, "username": username, "password": password})
        print(response, file=sys.stderr)
        if(response == null):
            print(false, file=sys.stderr)
        else:
            print(true, file=sys.stderr)
        
        return jsonify(response)

@app.route('/getAllUser/', methods = ['GET'])
def getUser():
    global response

    if(request.method == 'GET'):
        response = list(account.find({}))
        print(response, file=sys.stderr)
        return jsonify(response)

@app.route('/getAnswerKey/', methods = ['GET'])
def getAnswerKey():
    global response

    if(request.method == 'GET'):
        response = answerKeyCollection.find_one()
        return jsonify(response)

@app.route('/updateAnswerKey/', methods = ['PATCH'])
def updateKey():
    global response

    if(request.method == "PATCH"):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        id = request_data["id"]
        english = request_data['english']
        science = request_data['science']
        mathematics = request_data['mathematics']
        aptitude = request_data['aptitude']
        
        print(id, file=sys.stderr)
        print(english, file=sys.stderr)
        print(science, file=sys.stderr)
        print(mathematics, file=sys.stderr)
        print(aptitude, file=sys.stderr)

        response = answerKeyCollection.update_one({'_id': id},
        {'$set': {
            "english": {
                "1": english[0],
                "2": english[1],
                "3": english[2],
                "4": english[3],
                "5": english[4],
                "6": english[5],
                "7": english[6],
                "8": english[7],
                "9": english[8],
                "10": english[9],
                "11": english[10],
                "12": english[11],
                "13": english[12],
                "14": english[13],
                "15": english[14],
                "16": english[15],
                "17": english[16],
                "18": english[17],
                "19": english[18],
                "20": english[19],
                "21": english[20],
                "22": english[21],
                "23": english[22],
                "24": english[23],
                "25": english[24],
                "26": english[25],
                "27": english[26],
                "28": english[27],
                "29": english[28],
                "30": english[29],
                "31": english[30],
                "32": english[31],
                "33": english[32],
                "34": english[33],
                "35": english[34],
                "36": english[35],
                "37": english[36],
                "38": english[37],
                "39": english[38],
                "40": english[39]
            },
           "science": {
                "1": science[0],
                "2": science[1],
                "3": science[2],
                "4": science[3],
                "5": science[4],
                "6": science[5],
                "7": science[6],
                "8": science[7],
                "9": science[8],
                "11": science[10],
                "10": science[9],
                "12": science[11],
                "13": science[12],
                "14": science[13],
                "15": science[14],
                "16": science[15],
                "17": science[16],
                "18": science[17],
                "19": science[18],
                "20": science[19],
                "21": science[20],
                "22": science[21],
                "23": science[22],
                "24": science[23],
                "25": science[24],
                "26": science[25],
                "27": science[26],
                "28": science[27],
                "29": science[28],
                "30": science[29],
                "31": science[30],
                "32": science[31],
                "33": science[32],
                "34": science[33],
                "35": science[34],
                "36": science[35],
                "37": science[36],
                "38": science[37],
                "39": science[38],
                "40": science[39]
            },
           "mathematics": {
                "1": mathematics[0],
                "2": mathematics[1],
                "3": mathematics[2],
                "4": mathematics[3],
                "5": mathematics[4],
                "6": mathematics[5],
                "7": mathematics[6],
                "8": mathematics[7],
                "9": mathematics[8],
                "10": mathematics[9],
                "11": mathematics[10],
                "12": mathematics[11],
                "13": mathematics[12],
                "14": mathematics[13],
                "15": mathematics[14],
                "16": mathematics[15],
                "17": mathematics[16],
                "18": mathematics[17],
                "19": mathematics[18],
                "20": mathematics[19],
                "21": mathematics[20],
                "22": mathematics[21],
                "23": mathematics[22],
                "24": mathematics[23],
                "25": mathematics[24],
                "26": mathematics[25],
                "27": mathematics[26],
                "28": mathematics[27],
                "29": mathematics[28],
                "30": mathematics[29],
                "31": mathematics[30],
                "32": mathematics[31],
                "33": mathematics[32],
                "34": mathematics[33],
                "35": mathematics[34],
                "36": mathematics[35],
                "37": mathematics[36],
                "38": mathematics[37],
                "39": mathematics[38],
                "40": mathematics[39]
            },
             "aptitude": {
                "1": aptitude[0],
                "2": aptitude[1],
                "3": aptitude[2],
                "4": aptitude[3],
                "5": aptitude[4],
                "6": aptitude[5],
                "7": aptitude[6],
                "8": aptitude[7],
                "9": aptitude[8],
                "10": aptitude[9],
                "11": aptitude[10],
                "12": aptitude[11],
                "13": aptitude[12],
                "14": aptitude[13],
                "15": aptitude[14],
             }
            
        }})


        data = {"status": "success"}
        return data ,200

@app.route('/addApplicantList/', methods = ['POST'])
def addApplicantList():
    global response

    if(request.method == 'POST'):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        id = request_data["_id"]
        schoolName = request_data["schoolName"]
        applicants = request_data["applicants"]
        proctor = request_data["proctor"]
        date = request_data["date"]
        archive = request_data["archive"]

        print(schoolName, file=sys.stderr)
        print(applicants, file=sys.stderr)

        applicantlist.insert_one({
            "_id" : id,
            "name" : schoolName,
            "applicants" : applicants,
            "date" : date,
            "proctor": proctor,
            "archive": archive
        })

        data = {"status": "success"}
        return data ,200
    
@app.route('/editApplicantList/', methods = ['PATCH'])
def editApplicantList():
    global response 
    
    if(request.method == 'PATCH'):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        id = request_data['_id']
        archive = request_data['archive']
        
        filter = {'_id': id}
 
        newvalues = { "$set": { 'archive': archive } }
        
        applicantlist.update_one(filter, newvalues)
        
        data = {"status": "success"}
        return data ,200
        
@app.route('/deleteApplicantList/', methods = ['DELETE'])
def deleteApplicantList():
    global response
    
    if(request.method == "DELETE"):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        id = request_data['_id']
        
        filter = {'_id': id}
        
        applicantlist.delete_one(filter)
        
        data = {"status": "success"}
        return data ,200

@app.route('/addUser/', methods = ['POST'])
def addUser():
     global response
     
     if(request.method == 'POST'):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        id = request_data['_id']
        username = request_data['username']
        password = request_data['password']
        isActive = request_data['isActive']
        role = request_data['role']
        
 
        newvalues = {'_id': id, 'username': username, 'password': password, 'isActive': isActive, 'role': role  } 
        
        account.insert_one(newvalues)
        
        data = {"status": "success"}
        return data ,200

@app.route('/editUser/', methods = ['PATCH'])
def editUser():
     global response
     
     if(request.method == 'PATCH'):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        id = request_data['_id']
        password = request_data['password']
        isActive = request_data['isActive']
        role = request_data['role']
        
        filter = {'_id': id}
 
        newvalues = { "$set": { 'password': password, 'isActive': isActive, 'role': role  } }
        
        account.update_one(filter, newvalues)
        
        data = {"status": "success"}
        return data ,200

@app.route('/deleteUser/', methods = ['DELETE'])
def deleteUser():
     global response
     
     if(request.method == 'DELETE'):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        id = request_data['_id']
        
        filter = {'_id': id}
 
        
        account.delete_one(filter)
        
        data = {"status": "success"}
        return data ,200
    
@app.route('/getAllApplicantList/', methods = ['GET'])
def getApplicantList():
    global response

    if(request.method == 'GET'):
        response = list(applicantlist.find({}))
        return jsonify(response)

if __name__=="__main__":
    app.run(host='0.0.0.0', debug=True, port=9922)

