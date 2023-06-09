# Generated by Django 3.2 on 2023-06-09 17:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0002_alter_image_priority'),
    ]

    operations = [
        migrations.AddField(
            model_name='house',
            name='bedrooms',
            field=models.CharField(default='0', max_length=5),
        ),
        migrations.AddField(
            model_name='house',
            name='buildArea',
            field=models.CharField(default='0', max_length=5),
        ),
        migrations.AddField(
            model_name='house',
            name='constructingTime',
            field=models.CharField(default='0', max_length=5),
        ),
        migrations.AddField(
            model_name='house',
            name='toilets',
            field=models.CharField(default='0', max_length=5),
        ),
    ]
