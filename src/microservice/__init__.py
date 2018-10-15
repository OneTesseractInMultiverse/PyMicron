import logging

from flask import (
    Flask
)
from flask_jwt_extended import (
    JWTManager
)
from microservice.async import (
    init_async_service
)


# ------------------------------------------------------------------------------
# SETUP GENERAL APPLICATION
# ------------------------------------------------------------------------------

__version__ = '1.0.0'
app = Flask('microservice')
app.logger.info("")
app.config.from_object('config')
app.debug = True

# ------------------------------------------------------------------------------
# LOGGING
# ------------------------------------------------------------------------------
"""
    Setup very basic synchronous logging on the API. Possibly this should be 
    replaced later with an implementation that integrates with RSyslog using
    asynchronous logging to prevent blocking flask's main thread
    
    @see http://flask.pocoo.org/docs/dev/logging/
"""
# ------------------------------------------------------------------------------
# SETUP JWT
# ------------------------------------------------------------------------------
"""
    This API uses JWT Tokens to Authenticate call from consumers. In order to be
    able to authenticate the call and verify JWT Tokens, we must setup 
"""

jwt = JWTManager(app)

# ------------------------------------------------------------------------------
# LOAD RESOURCE ENDPOINTS
# ------------------------------------------------------------------------------
"""
    We import all HTTP resource endpoints after initializing all application 
    settings that must exist prior importing the endpoints
"""

from microservice.service_endpoints import *

