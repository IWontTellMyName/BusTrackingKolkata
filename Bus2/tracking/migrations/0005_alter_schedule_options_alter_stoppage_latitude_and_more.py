# Generated by Django 5.0.6 on 2024-06-11 08:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tracking', '0004_alter_schedule_special'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='schedule',
            options={'ordering': ['bus', 'start_time']},
        ),
        migrations.AlterField(
            model_name='stoppage',
            name='latitude',
            field=models.DecimalField(blank=True, decimal_places=8, max_digits=10),
        ),
        migrations.AlterField(
            model_name='stoppage',
            name='longitude',
            field=models.DecimalField(blank=True, decimal_places=8, max_digits=10),
        ),
        migrations.AlterUniqueTogether(
            name='schedule',
            unique_together={('bus', 'reverse_direction', 'start_time')},
        ),
    ]