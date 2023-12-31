from django.urls import re_path

from . import consumers

websocket_urlpatterns = [
    re_path(r'dashboard/game/round_3/$', consumers.MonopolyEvent.as_asgi()),
]