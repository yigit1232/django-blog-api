from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework.decorators import api_view, permission_classes
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import serializers,status
from .permissions import IsAnonymous
from . import serializers,models
from django.db.models import Q
import secrets
import re

class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = serializers.MyTokenObtainPairSerializer

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_all_post(request):
    if request.method=='GET':
        q = request.GET.get('q')
        if q:
            posts = models.Post.objects.filter(Q(title__icontains=q)|Q(content__icontains=q))
            if not posts:
                return Response({"message":"No post found"},status=status.HTTP_404_NOT_FOUND)
            serializer = serializers.PostSerializer(posts,many=True)
            return Response(serializer.data,status=status.HTTP_200_OK)
        data = models.Post.objects.all().order_by('-created_date')
        serializer = serializers.PostSerializer(data,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_detail_post(request,post_slug):
    if request.method=='GET':
        try:
            data = models.Post.objects.get(slug=post_slug)
            serializer = serializers.PostDetailSerializer(data)
            return Response(serializer.data,status=status.HTTP_200_OK)
        except models.Post.DoesNotExist:
            return Response({'error':'Post not found'},status=status.HTTP_404_NOT_FOUND)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_all_category(request):
    if request.method=='GET':
        data = models.Category.objects.all()
        serializer = serializers.CategorySerializer(data,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_all_tags(request):
    if request.method=='GET':
        data = models.Tag.objects.all()
        serializer = serializers.TagSerializer(data,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_category_post(request,slug):
    if request.method=='GET':
        data = models.Post.objects.filter(categories_id__category_slug=slug)
        if not data:
            return Response({'error':'Not found!'},status=status.HTTP_404_NOT_FOUND)
        serializer = serializers.PostSerializer(data,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_tags_post(request,slug):
    if request.method=='GET':
        data = models.Post.objects.filter(tags__tag_slug=slug)
        if not data:
            return Response({'error': 'Not found!'}, status=status.HTTP_404_NOT_FOUND)
        serializer = serializers.PostSerializer(data,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@api_view(['POST'])
@permission_classes([IsAuthenticated])
def comment_add(request,id):
    if not models.Post.objects.filter(id=id).exists():
        return Response({'error':'Post not found'},status=status.HTTP_404_NOT_FOUND)
    if request.method=='POST':
        serializer = serializers.PostCommentSerializer(data=request.data)
        if serializer.is_valid():
            author_id = serializer.validated_data['author_id']
            content = serializer.validated_data['content']
            post = models.Post.objects.get(id=id)
            comment = models.Comment(author_id=author_id,content=content,post_id=post)
            comment.save()
            return Response(serializer.data,status=status.HTTP_200_OK)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@api_view(['POST'])
@permission_classes([IsAnonymous])
def forgot_password(request):
    if request.method=='POST':
        serializer = serializers.ForgotSerializer(data=request.data)
        if serializer.is_valid():
            email = serializer.validated_data['email']
            if not models.User.objects.filter(email=email).exists():
                return Response({'error':'Not email'})
            user = models.User.objects.get(email=email)
            if models.Recovery.objects.filter(user_id=user).exists():
                models.Recovery.objects.filter(user_id=user).delete()
            token = secrets.token_urlsafe(16)
            new = models.Recovery(user_id=user,token=token)
            new.save()
            return Response({'success':'go to email'})
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@api_view(['POST'])
@permission_classes([IsAnonymous])
def reset_password(request,token):
    if request.method=='POST':
        if not models.Recovery.objects.filter(token=token).exists():
            return Response({'error': 'Invalid token'}, status=status.HTTP_400_BAD_REQUEST)
        serializer = serializers.ResetPasswordSerializer(data=request.data)
        if serializer.is_valid():
            password = serializer.validated_data['password']
            again_password = serializer.validated_data['again_password']
            if password != again_password:
                return Response({'error': 'password do not match'}, status=status.HTTP_400_BAD_REQUEST)
            elif len(password) < 6:
                return Response({'error': 'password must be at least 6 characters'}, status=status.HTTP_400_BAD_REQUEST)
            user_id = models.Recovery.objects.get(token=token)
            user = models.User.objects.filter(id=user_id.user_id.id).first()
            user.set_password(password)
            user.save()
            user_id.delete()
            return Response({'success':'Password changed successfully'},status=status.HTTP_200_OK)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@api_view(['POST'])
@permission_classes([IsAnonymous])
def create_user(request):
    if request.method=='POST':
        serializer = serializers.RegisterSerializer(data=request.data)
        if serializer.is_valid():
            username = serializer.validated_data['username']
            name = serializer.validated_data['name']
            email = serializer.validated_data['email']
            password = serializer.validated_data['password']
            again_password = serializer.validated_data['again_password']

            if models.User.objects.filter(username=username).exists():
                return Response({'error':'username already exists'},status=status.HTTP_400_BAD_REQUEST)
            elif models.User.objects.filter(email=email).exists():
                return Response({'error':'email already exists'},status=status.HTTP_400_BAD_REQUEST)
            elif username == "" or name == "" or email == "" or password == "" or again_password == "":
                return Response({'error':'all fields are required'},status=status.HTTP_400_BAD_REQUEST)
            elif password != again_password:
                return Response({'error':'passwords do not match'},status=status.HTTP_400_BAD_REQUEST)
            elif len(password) < 6:
                return Response({'error':'password must be at least 6 characters'},status=status.HTTP_400_BAD_REQUEST)
            regex_email = re.compile(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
            if not regex_email.match(email):
                return Response({'error':'invalid email'},status=status.HTTP_400_BAD_REQUEST)
            user = models.User(username=username,name=name,email=email)
            user.set_password(password)
            user.save()
            return Response({'success':'user created successfully'},status=status.HTTP_200_OK)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

@api_view(['POST'])
@permission_classes([IsAuthenticated])
def add_post_like(request):
    if request.method=='POST':
        serializer = serializers.LikeSerializer(data=request.data)
        if serializer.is_valid():
            post_id = serializer.validated_data['post_id']
            user_id = serializer.validated_data['user_id']
            try:
                is_user = models.User.objects.get(id=user_id)
            except models.User.DoesNotExist:
                return Response({'error':'User not found'},status=status.HTTP_404_NOT_FOUND)
            try:
                data = models.Post.objects.get(id=post_id)
            except models.Post.DoesNotExist:
                return Response({'error':'Post not found'},status=status.HTTP_404_NOT_FOUND)
            if data.likes.filter(id=user_id).exists():
                data.likes.remove(user_id)
                data.save()
                return Response({'success':f'{data.title} Dislike'})
            data.likes.add(user_id)
            data.save()
            return Response({'success':f'{data.title} Like successfuly'},status=status.HTTP_200_OK)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    else:
        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)