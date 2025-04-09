from rest_framework import serializers
from authentication.models import User
from django.contrib.auth.models import Group

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'

    def create(self, validated_data):
        password = validated_data.pop('password')
        user = User(**validated_data)
        user.set_password(password)  # Hash password
        user.save()

        # Assign default group (e.g. "user")
        default_group = Group.objects.get(name='user')
        user.groups.add(default_group)

        return user