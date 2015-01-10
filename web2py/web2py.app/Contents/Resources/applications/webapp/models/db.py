db = DAL('sqlite://storage.sqlite')

from gluon.tools import *
from datetime import datetime
import os

auth = Auth(db)
auth.settings.extra_fields['auth_user']= [Field('age', 'integer'), Field('sex', 'string'), Field('height', 'integer'), Field('weight', 'integer'), Field('dailyColoricGoal', 'integer'), Field('currentCaloricCount', 'integer')]
auth.define_tables()

db.define_table('userTeam',
                Field('name', 'string'),
                Field('score', 'integer'),
                Field('users', 'list:reference auth_user'))

db.define_table('innerTeamConnection',
                Field('origin', 'reference auth_user'),
                Field('destination', 'reference auth_user'))
