from rest_framework import permissions

class IsAnonymous(permissions.BasePermission):
    message = 'Is login'
    def has_object_permission(self, request, view, obj):
        return (request.user.is_anonymous)