from api.Tags_Content.tag_content_table import tag_content
from datetime import datetime
from api import db

class Content(db.Model):
    id = db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(50), nullable=False)