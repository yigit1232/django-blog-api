from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User,Post,Category,Tag,Comment,Recovery,Profile


@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ['user_id','profile_image','bio']
    class Meta:
        model = Profile

@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ('title','categories_id','slug')
    list_filter = ('created_date',)
    class Meta:
        model = Post

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('category','category_slug')
    class Meta:
        model = Category

@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ('tag','tag_slug')
    class Meta:
        model = Tag

@admin.register(Comment)
class ComnmentAdmin(admin.ModelAdmin):
    list_display = ('author_id','post_id')
    list_filter = ('created_date',)
    class Meta:
        model = Comment

@admin.register(Recovery)
class RecoveryAdmin(admin.ModelAdmin):
    list_display = ('user_id','token')
    list_filter = ('created_date',)
    class Meta:
        model = Recovery

@admin.register(User)
class Admin(UserAdmin):
    list_display = ('username','email','name','is_active')
    class Meta:
        model = User



