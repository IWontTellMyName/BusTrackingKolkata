# Generated by Django 5.0.6 on 2024-06-11 10:41

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tracking', '0012_rename_special_note_schedule_special'),
    ]

    operations = [
        migrations.RenameField(
            model_name='schedule',
            old_name='special',
            new_name='special_note',
        ),
    ]
