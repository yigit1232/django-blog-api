from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework import serializers
from .models import User,Post,Category,Tag,Comment,Recovery,Profile

class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        profile = Profile.objects.get(user_id=user.id)
        token = super().get_token(user)
        token['username'] = user.username
        token['email'] = user.email
        token['profile_image'] = profile.profile_image.url
        return token

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id','category','category_slug']

class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ['tag','tag_slug']

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id','username','name']

class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ['id','content','author_id']

class PostSerializer(serializers.ModelSerializer):
    categories_id = CategorySerializer()
    tags = TagSerializer(many=True)
    class Meta:
        model = Post
        fields = ['id','title','content','categories_id','created_date','edit_date','slug','post_image','total_likes','tags']

class PostDetailSerializer(serializers.ModelSerializer):
    categories_id = CategorySerializer()
    tags = TagSerializer(many=True)
    likes = UserSerializer(many=True)
    get_comments = CommentSerializer(many=True)

    class Meta:
        model = Post
        fields = ['id','title','content','categories_id','created_date','edit_date','slug','post_image','total_likes','tags','likes','get_comments']

class RegisterSerializer(serializers.Serializer):
    name = serializers.CharField(required=False)
    username = serializers.CharField(required=False)
    email = serializers.CharField(required=False)
    password = serializers.CharField(required=False)
    again_password = serializers.CharField(required=False)

class ForgotSerializer(serializers.Serializer):
    email = serializers.CharField()

class ResetPasswordSerializer(serializers.Serializer):
    password = serializers.CharField()
    again_password = serializers.CharField()

class LikeSerializer(serializers.Serializer):
    post_id = serializers.CharField()
    user_id = serializers.CharField()

class PostCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ['author_id','content','post_id']