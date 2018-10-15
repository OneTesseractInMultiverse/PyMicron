#!/usr/bin/env bash
#!/usr/bin/env bash

export SECRET_KEY=Awsx1Sedc2Drfv34
export LOG_FILE=ml_authorization_xs.log

export JWT_SECRET_KEY=GnRDqw6EYXsqYfXp
export JWT_PUBLIC_KEY=$(cat ../local/ec256-public.pem)
export JWT_PRIVATE_KEY=$(cat ../local/ec256-private.pem)
export JWT_ALGORITHM=ES256

export CELERY_BROKER_URL=amqp://dqfdfigw:Ps3vBK7GdDWHxXz1YqR7f7R4tTSlJfhS@white-swan.rmq.cloudamqp.com/dqfdfigw
export CELERY_RESULT_BACKEND=amqp://dqfdfigw:Ps3vBK7GdDWHxXz1YqR7f7R4tTSlJfhS@white-swan.rmq.cloudamqp.com/dqfdfigw
export MESSAGING_QUEUE=amqp://dqfdfigw:Ps3vBK7GdDWHxXz1YqR7f7R4tTSlJfhS@white-swan.rmq.cloudamqp.com/dqfdfigw
