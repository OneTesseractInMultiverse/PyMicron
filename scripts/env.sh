#!/usr/bin/env bash
#!/usr/bin/env bash

export SECRET_KEY=[your_secret_key]
export LOG_FILE=micron.log

export JWT_SECRET_KEY=[your_jwt_signing_key]
export JWT_PUBLIC_KEY=$(cat ../local/ec256-public.pem)
export JWT_PRIVATE_KEY=$(cat ../local/ec256-private.pem)
export JWT_ALGORITHM=ES256

export CELERY_BROKER_URL=[rabbit_or_redis_connection_string]
export CELERY_RESULT_BACKEND=[rabbit_or_redis_connection_string]
export MESSAGING_QUEUE=[rabbit_or_redis_connection_string]
