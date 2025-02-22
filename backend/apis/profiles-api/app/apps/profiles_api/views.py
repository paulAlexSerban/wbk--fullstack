from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework import viewsets
from apps.profiles_api import serializers

"""
APIView
- describe the logic to make API endpoint
- gives you the most control over the logic
- perfect for implementing complex logic such as working with APIs, working with files, etc.
- mapped manually to URLs

When to use APIView?
- when you need full control over the logic
- when you are calling other APIs/services
- processing files and rendering a synchronous response
- when accessing local data
- when you need to use a session
"""
class HelloApiView(APIView):
    """Test API View"""
    serializer_class = serializers.HelloSerializer

    def get(self, request, format=None):
        """Returns a list of APIView features"""
        an_apiview = [
            'Uses HTTP methods as function (get, post, patch, put, delete)',
            'Is similar to a traditional Django View',
            'Gives you the most control over your application logic',
            'Is mapped manually to URLs',
        ]

        return Response({'message': 'Hello!', 'an_apiview': an_apiview})
    
    def post(self, request):
        """Create a hello message with our name"""
        serializer = self.serializer_class(data=request.data)
        
        if serializer.is_valid():
            name = serializer.validated_data.get('name')
            message = f'Hello {name}'
            return Response({'message': message})
        else:
            return Response(
                serializer.errors,
                status=status.HTTP_400_BAD_REQUEST
            )
            
    def put(self, request, pk=None):
        """Handle updating an object"""
        return Response({'method': 'PUT'})
    
    def patch(self, request, pk=None):
        """Handle a partial update of an object"""
        return Response({'method': 'PATCH'})
    
    def delete(self, request, pk=None):
        """Delete an object"""
        return Response({'method': 'DELETE'})
        
"""
ViewSets
- allows you to organize the logic for your API around related resources
- uses model operations for functions
- takes care of a lot of typical logic for you
- perfect for standard database operations
- mapped automatically to URLs
- fastest way to build an API which interfaces with a database

When to use ViewSets?
- when you are working with standard database operations
- as simple CRUD interface to your database
- a quick and simple API
- little to no customization on the logic
- when you are working with standard data structures
"""

class HelloViewSet(viewsets.ViewSet):
    """Test API ViewSet"""
    serializer_class = serializers.HelloSerializer
    
    def list(self, request):
        """Return a hello message"""
        
        a_viewset = [
            'Uses actions (list, create, retrieve, update, partial_update)',
            'Automatically maps to URLs using Routers',
            'Provides more functionality with less code',
        ]
        
        return Response({'message': 'Hello!', 'a_viewset': a_viewset})
    
    def create(self, request):
        """Create a new hello message"""
        serializer = self.serializer_class(data=request.data)
        
        if serializer.is_valid():
            name = serializer.validated_data.get('name')
            message = f'Hello {name}'
            return Response({'message': message})
        else:
            return Response(
                serializer.errors,
                status=status.HTTP_400_BAD_REQUEST
            )
        
    def retrieve(self, request, pk=None):
        """Handle getting an object by its ID"""
        return Response({'http_method': 'GET'})
    
    def update(self, request, pk=None):
        """Handle updating an object"""
        return Response({'http_method': 'PUT'})
    
    def partial_update(self, request, pk=None):
        """Handle updating part of an object"""
        return Response({'http_method': 'PATCH'})
    
    def destroy(self, request, pk=None):
        """Handle removing an object"""
        return Response({'http_method': 'DELETE'})