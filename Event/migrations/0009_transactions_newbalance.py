# Generated by Django 3.2 on 2021-04-15 11:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Event', '0008_propertycard_desc'),
    ]

    operations = [
        migrations.AddField(
            model_name='transactions',
            name='newBalance',
            field=models.IntegerField(default=0),
        ),
    ]
