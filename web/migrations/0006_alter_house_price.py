# Generated by Django 3.2 on 2023-06-09 18:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0005_house_price'),
    ]

    operations = [
        migrations.AlterField(
            model_name='house',
            name='price',
            field=models.CharField(default='0', max_length=20),
        ),
    ]
