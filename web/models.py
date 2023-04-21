from django.db import models


class House(models.Model):
    name = models.CharField(max_length=100)
    price = models.FloatField()

    def __str__(self):
        return self.name

class Image(models.Model):
    house = models.ForeignKey(House, on_delete=models.CASCADE)
    image = models.ImageField(null=True, blank=True, upload_to='images/')
