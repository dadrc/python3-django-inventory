from django.urls import path, re_path, include
from . import views

urlpatterns = [
    re_path(r'^$', views.index, name='index'),
    re_path(r'^bucket/(?P<bucket_id>[0-9]+)/$', views.bucket, name='bucket'),
    re_path(r'^item/(?P<item_id>[0-9]+)/move/(?P<bucket_id>[0-9]+)/$',
        views.move, name='move'),
    re_path(r'^item/(?P<item_id>[0-9]+)/$', views.item, name='item'),
    re_path(r'^add/', views.add, name='add'),
    re_path(r'^bucket/(?P<bucket_id>[0-9]+)/add/$', views.add, name='addtobucket'),
    re_path(r'^search/$', views.search, name='search'),
    re_path(r'^accounts/', include('django.contrib.auth.urls'))
]
