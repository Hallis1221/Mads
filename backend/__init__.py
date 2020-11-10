from flask_sqlalchemy import SQLAlchemy
from flask import Flask, jsonify
from flask_cors import CORS

db = SQLAlchemy()


def create_app():
    app = Flask(__name__)
