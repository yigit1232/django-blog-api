from rest_framework_simplejwt.views import (
    TokenRefreshView,
)
from django.urls import path
from . import views

urlpatterns = [
    path('api/post/list/',views.get_all_post),
    path('api/post/detail/<slug:post_slug>/',views.get_detail_post),
    path('api/post/like/',views.add_post_like),
    path('api/categories/',views.get_all_category),
    path('api/category/<slug:slug>/',views.get_category_post),
    path('api/tags/',views.get_all_tags),
    path('api/tag/<slug:slug>/',views.get_tags_post),
    path('api/comment/add/<int:id>/',views.comment_add),

    path('api/auth/password/reset/',views.forgot_password),
    path('api/auth/password/reset/<token>/',views.reset_password),
    path('api/auth/register/',views.create_user),
    path('api/token/', views.MyTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]