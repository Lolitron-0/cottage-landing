from django.db import models


class House(models.Model):
    xSize = models.CharField(max_length=5,default='0')
    ySize = models.CharField(max_length=5,default='0')

    def __str__(self):
        return str(self.xSize) + 'x' + str(self.ySize)

class Image(models.Model):
    house = models.ForeignKey(House, on_delete=models.CASCADE)
    image = models.ImageField(null=True, blank=True, upload_to='images/')
