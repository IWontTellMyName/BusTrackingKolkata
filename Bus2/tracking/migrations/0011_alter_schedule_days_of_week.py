# Generated by Django 5.0.6 on 2024-06-11 10:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tracking', '0010_alter_schedule_special_note'),
    ]

    operations = [
        migrations.AlterField(
            model_name='schedule',
            name='days_of_week',
            field=models.PositiveSmallIntegerField(default=6),
        ),
    ]
