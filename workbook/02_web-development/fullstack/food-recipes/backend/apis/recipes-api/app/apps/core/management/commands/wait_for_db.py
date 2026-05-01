"""
Django command to wait for the database to be availabe
"""

import time
from psycopg2 import OperationalError as Psycopg2Error
from django.db.utils import OperationalError
from django.core.management.base import BaseCommand

SLEEP_TIME = 1


class Command(BaseCommand):
    """
    Django command to wait for the database to be availabe
    This is a solution to the problem of Django trying to connect to the database
    before it is ready. This command will wait for the database to be available
    before continuing with the rest of the commands.
    Useful to avoid race conditions when using Docker and Postgres.
    """

    def handle(self, *args, **options):
        """Entry point for the command"""
        self.stdout.write("Waiting for database...")
        db_up = False
        while db_up is False:
            try:
                self.check(databases=["default"])
                db_up = True
            except (Psycopg2Error, OperationalError):
                self.stdout.write("Database unavailable, waiting 1 second...")
                time.sleep(SLEEP_TIME)
        self.stdout.write(self.style.SUCCESS("Database available!"))
