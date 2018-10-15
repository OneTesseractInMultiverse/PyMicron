from celery import (
    Celery
)


# ---------------------------------------------------------------------------------------
# METHOD INIT ASYNC SERVICE
# ---------------------------------------------------------------------------------------
def init_async_service(app):
    """
        The function creates a new Celery object, configures it with the broker from the
        application config, updates the rest of the Celery config from the Flask config
        and then creates a subclass of the task that wraps the task execution in an
        application context.

        :param app: The Flask application where the instance of Celery will be added.

        :return: an instance of Celery class.
    """

    celery = Celery(
        app.import_name,
        backend=app.config['CELERY_RESULT_BACKEND'],
        broker=app.config['CELERY_BROKER_URL']
    )

    celery.conf.update(app.config)

    return celery


# ---------------------------------------------------------------------------------------
# CLASS TASK RESULT
# ---------------------------------------------------------------------------------------
class TaskResult(object):

    def __init__(self, celery_task):
        """

            :param celery_task:
        """
        self.task = celery_task
        self.state = celery_task.state
        self.result = None

    @property
    def result(self):
        """

            :return:
        """
        if self.state == 'PENDING':
            return None
        elif self.state != 'SUCCESS':
            return self.task.info