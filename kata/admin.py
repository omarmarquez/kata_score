from django.contrib import admin
from kata.models import Kata, KataImage, KataTechnique, Event, Category, EventTable, KataExecution, TechVideo, Critique, Score

############################################################################
from django import forms
###########################################################################
class KataTechniqueInline(admin.TabularInline):
    model = KataTechnique
    extra = 0
###########################################################################
class KataImageInline(admin.TabularInline):
    model = KataImage
    extra = 0
###########################################################################
class KataAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['kata_name','image' ]}),
        ('Other',        {'fields': ['origin', 'rank',  ]}),
        ('Description',        {'fields': ['kata_description' ]}),
    ]
    inlines = [KataTechniqueInline,KataImageInline]
    list_display = ('kata_name' ,'origin', 'rank', 'kata_image'  )
    search_fields = ['kata_name','kata_description',]
    ordering = ('kata_name','rank','origin' )

admin.site.register(Kata, KataAdmin )


###########################################################################
class TechVideoInline(admin.TabularInline):
    model = TechVideo
    extra = 1

    
class KataExecutionAdmin( admin.ModelAdmin ):
    fieldsets = [
        (None,               {'fields': ['tori','uke' ]}),
       ('Kata',               {'fields': ['event_table','kata' ]}),
    ]

    inlines = [TechVideoInline,]
    list_display = ( 'info', 'tori', 'uke' )
    search_fields = ['search'  ]
    ordering = ('updated', )

#admin.site.register(  KataExecution, KataExecutionAdmin  )    

###########################################################################
class KataExecutionInline(admin.TabularInline):
    model = KataExecution
    extra = 1
    
class EventTableInline(admin.TabularInline):
    model = EventTable
    extra = 1

class CategoryInline(admin.TabularInline):
    model = Category
    extra = 1

###########################################################################
    
class EventForm( forms.ModelForm ):
    event_location = forms.CharField( widget=forms.Textarea )
    class Meta:
        model = Event

class EventAdmin( admin.ModelAdmin ):
    form = EventForm
    fieldsets = [
        (None,               {'fields': ['event_name','image' ]}),
        ('Event',        {'fields': ['event_date', 'event_location',  ]}),
        ('Description',        {'fields': ['event_description' ]}),
        ('Scoring',        {'fields': ['scoring_ignore_higlow', 'scoring_review',  ]}),
    ]

    inlines = [CategoryInline,]
    list_display = ('event_' , 'event_name' ,'event_date', 'event_location',  )
    search_fields = ['event_name','event_description',]
    ordering = ('event_date','event_name', )

admin.site.register( Event , EventAdmin )


###########################################################################
class CaptureUserAdmin( admin.ModelAdmin ):

    class Meta:
        abstract = True
    
    def save_model(self, request, new_object, form, Flag  ):
        new_object.user = request.user
        super( CaptureUserAdmin , self ).save_model( request, new_object, form, Flag )
        
###########################################################################
class CritiqueAdmin( CaptureUserAdmin ):
    def save_model(self, request, new_object, form, Flag  ):
        super( CritiqueAdmin, self ).save_model( request, new_object, form, Flag )
    
    search_fields = ['search',]


admin.site.register( Critique, CritiqueAdmin )
###########################################################################
class ScoreAdmin( CaptureUserAdmin ):
    
    def save_model(self, request, new_object, form, Flag  ):
        super( ScoreAdmin, self ).save_model( request, new_object, form, Flag )


#admin.site.register( Score, ScoreAdmin  )
###########################################################################
class EventTableAdmin( CaptureUserAdmin ):
    
    inlines = [KataExecutionInline,]
    list_display = ( 'table_name' , 'table_location', 'event_link' )
    
    def nosave_model(self, request, new_object, form, Flag  ):
        super( EventTableAdmin, self ).save_model( request, new_object, form, Flag )


#admin.site.register( EventTable, EventTableAdmin  )
###########################################################################
class CategoryAdmin( CaptureUserAdmin ):
    
    inlines = [KataExecutionInline,]
    list_display = ( 'name' ,  'event_link' )


#admin.site.register( Category, CategoryAdmin  )
###########################################################################