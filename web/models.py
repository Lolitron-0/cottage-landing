from django.db import models


class House(models.Model):
    xSize = models.CharField(max_length=5,default='0')
    ySize = models.CharField(max_length=5,default='0')
    area = models.CharField(max_length=5, default='0')
    constructingTime = models.CharField(max_length=5, default='0')
    bedrooms = models.CharField(max_length=5, default='0')
    toilets = models.CharField(max_length=5, default='0')
    price = models.CharField(max_length=20, default='0')

    def get_preview_image(self):
        return self.image_set.filter(isPreview=True)[0]

    def __str__(self):
        return str(self.xSize) + 'x' + str(self.ySize)

class Image(models.Model):
    house = models.ForeignKey(House, on_delete=models.CASCADE)
    image = models.ImageField(null=True, blank=True, upload_to='images/')
    isPreview = models.BooleanField(default=False)
    priority = models.IntegerField(default=0)

    def __str__(self):
        return ("PREV   " if self.isPreview else "") +str(self.house.xSize)+"X"+str(self.house.ySize) + "  ---  " + str(self.image)
