from django.db.models.signals import post_save
from django.contrib.auth.models import AbstractUser
from django.utils.text import slugify
from django.db import models
import datetime

class User(AbstractUser):
    first_name = None
    last_name = None
    name = models.CharField(max_length=255)

    class Meta:
        db_table='users'
        verbose_name='User'
        verbose_name_plural='Users'

    def __str__(self):
        return self.username

class Category(models.Model):
    category = models.CharField(max_length=255)
    category_slug = models.SlugField(db_index=True,null=True,blank=True,max_length=255,unique=True)

    class Meta:
        db_table='categorys'
        verbose_name='Category'
        verbose_name_plural='Categorys'

    def __str__(self):
        return self.category

    def save(self,*args,**kwargs):
        if not self.category_slug:
            self.category_slug = slugify(self.category.replace('ı','i'))
            super(Category,self).save(*args,**kwargs)

class Tag(models.Model):
    tag = models.CharField(max_length=255)
    tag_slug = models.SlugField(db_index=True,null=True,blank=True,max_length=255,unique=True)

    class Meta:
        db_table='tags'
        verbose_name='Tag'
        verbose_name_plural='Tags'

    def __str__(self):
        return self.tag

    def save(self, *args, **kwargs):
        if not self.tag_slug:
            self.tag_slug = slugify(self.tag.replace('ı', 'i'))
            super(Tag, self).save(*args, **kwargs)

class Post(models.Model):
    author_id = models.ForeignKey(User,on_delete=models.CASCADE,db_column='author_id')
    title = models.CharField(max_length=255)
    content = models.TextField()
    created_date = models.DateTimeField(auto_now_add=True)
    edit_date = models.DateTimeField(auto_now=True)
    slug = models.SlugField(db_index=True,null=True,blank=True,max_length=255,unique=True)
    likes = models.ManyToManyField(User,blank=True,related_name='like')
    categories_id = models.ForeignKey(Category,on_delete=models.CASCADE,db_column='categories_id')
    tags = models.ManyToManyField(Tag,blank=True)
    post_image = models.ImageField(upload_to='media/post_image')

    class Meta:
        db_table='posts'
        verbose_name='Post'
        verbose_name_plural='Posts'

    def __str__(self):
        return self.title

    def total_likes(self):
        return self.likes.count()

    def get_comments(self):
        return Comment.objects.filter(post_id=self.id)

    def get_slug(self):
        slug = slugify(self.title.replace('ı','i'))
        unique = slug
        number = 1
        if Post.objects.filter(slug=unique).exists():
            unique = f'{unique}-{number}'

        return unique
    
    def save(self,*args,**kwargs):
        if not self.slug:
            self.slug = self.get_slug()
            super(Post, self).save(*args,**kwargs)

class Comment(models.Model):
    author_id = models.ForeignKey(User,on_delete=models.CASCADE,db_column='author_id')
    post_id = models.ForeignKey(Post,on_delete=models.CASCADE,db_column='post_id')
    created_date = models.DateTimeField(auto_now_add=True)
    content = models.TextField(max_length=500)

    class Meta:
        db_table='comments'
        verbose_name='Comment'
        verbose_name_plural='Comments'

    def __str__(self):
        return self.author_id.username

class Recovery(models.Model):
    user_id = models.ForeignKey(User,on_delete=models.CASCADE,db_column='user_id')
    token = models.CharField(max_length=255)
    created_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table='recoveries'
        verbose_name='Recovery'
        verbose_name_plural='Recoveries'

    def __str__(self):
        return self.user_id.username

class Profile(models.Model):
    user_id = models.ForeignKey(User,on_delete=models.CASCADE,db_column='user_id')
    profile_image = models.ImageField(upload_to='media/profile_image',blank=True)
    bio = models.TextField(max_length=500,blank=True)

    class Meta:
        db_table='profiles'
        verbose_name='Profile'
        verbose_name_plural='Profiles'

    def __str__(self):
        return self.user_id.username


def create_profile(sender,instance,created,*args,**kwargs):
    if created:
        try:
            Profile.objects.create(user_id=instance)
        except:
            pass
post_save.connect(create_profile,sender=User)