from django.conf.urls import patterns, url
#from django.contrib.staticfiles.urls import staticfiles_urlpatterns

from django.conf import settings
from kata import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^kview/(?P<exec_id>\d+)/$', views.kview, name='kview'),
    url(r'^tech_video/(?P<vid_id>\d+)/$', views.tech_video, name='tech_video'),
    url(r'^critique_video/(?P<vid_id>\d+)/$', views.critique_video, name='critique_video'),
    url(r'^vupload/(?P<exec_id>\d+)/(?P<tec_id>\d+)/$', views.vupload, name='vupload'),
    url(r'^cupload/(?P<vid_id>\d+)/$', views.cupload, name='cupload'),
    url(r'^vcritiques/(?P<vid_id>\d+)/$', views.vcritiques, name='vcritiques'),

    url(r'^event/(?P<id>\d+)/$', views.event, name='event'),

    url(r'^table/(?P<tab_id>\d+)/$', views.table, name='table'),
    url(r'^table_lst/(?P<event_id>\d+)/$', views.table_lst, name='table_lst'),
    url(r'^table_add/(?P<event_id>\d+)/$', views.table_add, name='table_add'),
    url(r'^table_del/(?P<event_id>\d+)/(?P<tab_id>\d+)/$', views.table_del, name='table_del'),
    url(r'^table_mod/(?P<tab_id>\d+)/$', views.table_mod, name='table_mod'),
    url(r'^table_status/(?P<tab_id>\d+)/$', views.table_status, name='table_status'),
    url(r'^table_status/(?P<tab_id>\d+)/(?P<tchg>\S+)/$', views.table_status, name='table_status'),
    url(r'^table_score/(?P<tab_id>\d+)/$', views.table_score, name='table_score'),
    url(r'^table_score/(?P<tab_id>\d+)/(?P<kata_id>\d+)/$', views.table_score, name='table_score'),
    url(r'^table_score/(?P<tab_id>\d+)/(?P<kata_id>\d+)/(?P<tech_id>\d+)/$', views.table_score, name='table_score'),

    url(r'^score_board/(?P<event_id>\d+)/$', views.score_board, name='score_board'),
    
    url(r'^category_lst/(?P<event_id>\d+)/$', views.category_lst, name='category_lst'),
    url(r'^category_add/(?P<event_id>\d+)/$', views.category_add, name='category_add'),
    url(r'^category_del/(?P<event_id>\d+)/(?P<cat_id>\d+)/$', views.category_del, name='category_del'),
    url(r'^category_mod/(?P<cat_id>\d+)/$', views.category_mod, name='category_mod'),
    
    url(r'^kata_lst/(?P<event_id>\d+)/$', views.kata_lst, name='kata_lst'),    
    url(r'^kata_lst/(?P<event_id>\d+)/(?P<tab_id>\d+)/$', views.kata_lst, name='kata_lst'),    
    url(r'^kata_add/(?P<event_id>\d+)/$', views.kata_add, name='kata_add'),
    url(r'^kata_sel/(?P<kat_id>\d+)/$', views.kata_sel, name='kata_sel'),
    url(r'^kata_del/(?P<kat_id>\d+)/$', views.kata_del, name='kata_del'),
    url(r'^kata_mod/(?P<kat_id>\d+)/$', views.kata_mod, name='kata_mod'),
    url(r'^kata_scores/(?P<kat_id>\d+)/$', views.kata_scores, name='kata_scores'),
    url(r'^approve_scores/(?P<kat_id>\d+)/$', views.approve_scores, name='approve_scores'),
    url(r'^category_scores/(?P<cat_id>\d+)/$', views.category_scores, name='category_scores'),
    
    
)