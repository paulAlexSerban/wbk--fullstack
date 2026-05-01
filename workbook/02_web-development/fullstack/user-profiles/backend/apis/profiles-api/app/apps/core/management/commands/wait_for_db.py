"""
Django command to wait for the database to be availabe
"""
import time
from psycopg2 import OperationalError as Psycopg2Error
from django.db.utils import OperationalError
from django.core.management.base import BaseCommand

SLEEP_TIME = 1


class Command(BaseCommand):
    """Django command to wait for the database to be availabe"""

    def handle(self, *args, **options):
        """Entry point for the command"""
        self.stdout.write('Waiting for database...')
        db_up = False
        while db_up is False:
            try:
                self.check(databases=['default'])
                db_up = True
            except (Psycopg2Error, OperationalError):
                self.stdout.write('Database unavailable, waiting 1 second...')
                time.sleep(SLEEP_TIME)
        self.stdout.write(self.style.SUCCESS('Database available!'))
