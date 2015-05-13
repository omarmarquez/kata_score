from django.db import models
from django.forms import ModelForm
from datetime import datetime
from django.utils import timezone
from judokata import settings

from os import path, rename

from django.contrib.auth.models import User

from django.core.urlresolvers import reverse # so we can sent links

class UserData(models.Model):
    user = models.ForeignKey(User, editable=False)
    created = models.DateField(editable=False)
    updated = models.DateTimeField(editable=False)
    class Meta:
        abstract = True
    
    def save(self):
        if not self.id or not self.created:
            self.created = datetime.today()
        self.updated = datetime.today()
        super( UserData, self).save()
            

##############################    
class Kata(models.Model):
    kata_name = models.CharField(max_length=200)
    origin = models.CharField(max_length=100, default='Kodokan')
    rank = models.CharField(max_length=100)
    kata_description  = models.TextField()
    created = models.DateField(editable=False)
    updated = models.DateTimeField(editable=False)
    image = models.ImageField( 'Image',
                                height_field='',
                                width_field='',
                                upload_to='kata_images/',
                                max_length=200,
                                blank=True,
                                null=True
                                )

    def __unicode__(self):
        return self.kata_name

    def save(self):
        if not self.id or not self.created:
            self.created = datetime.today()
        self.updated = datetime.today()
        super( Kata, self).save()

    def kata_image( self ):
	       return '<a href="{0}{1}"><img src="{0}{1}" /></a>'.format( settings.MEDIA_URL, self.image ) 

    kata_image.allow_tags = True

###############################################

            
# Create your models here.
class Event( UserData ):
    event_name = models.CharField(max_length=200)
    event_description =  models.TextField()
    event_location = models.CharField( max_length=600 )
    event_date = models.DateField()
    scoring_ignore_higlow = models.BooleanField( default = False, blank = True   )
    scoring_review = models.BooleanField( default = False, blank = True   )
    image = models.ImageField( 'Image',
                                height_field='',
                                width_field='',
                                upload_to='event_images/',
                                max_length=200,
                                blank=True,
                                null=True
                                )

    def __unicode__(self):
        return self.event_name

    def save(self):
        if not self.id or not self.created:
            self.created = datetime.today()
        self.updated = datetime.today()
        super( Event, self).save()
    
    def event_image( self ):
        return '<a href="{0}{1}"><img src="{0}{1}" /></a>'.format( settings.MEDIA_URL, self.image ) 

    event_image.allow_tags = True
    def event_( self ):
        return '<img src="{0}{1}" />'.format( settings.MEDIA_URL, self.image ) 

    event_.allow_tags = True

###############################################
   
class EventTable( UserData ):
        event = models.ForeignKey( Event )
        table_name = models.CharField( max_length=100 )
        table_location = models.CharField( max_length=300 )
        current_execution =   models.IntegerField( max_length=6, blank=True, null=True ,editable=False)
        current_technique =   models.IntegerField( max_length=6, blank=True, null=True, editable=False )
        
        def event_link(self):
            return '<a href="%s">%s</a>' % (reverse("admin:kata_event_change", args=( self.event.id, )) , self.event.event_name )

        event_link.allow_tags = True
        event_link.short_description = "Event" 

        def __unicode__(self):
            return self.table_name

class EventTableForm( ModelForm ):
    class Meta:
        model = EventTable
        exclude = ('event',)
        
###############################################
class Category( models.Model ):
    event = models.ForeignKey( Event  )
    name = models.CharField( max_length=100 )
    description =  models.TextField()

    def __unicode__(self):
            return self.name
        
    def event_link(self):
        return '<a href="%s">%s</a>' % (reverse("admin:kata_event_change", args=( self.event.id, )) , self.event.event_name )

    event_link.allow_tags = True
    event_link.short_description = "Event" 
    
class CategoryForm( ModelForm ):
    class Meta:
        model = Category
        exclude = ('event',)
           
class KataExecution( models.Model ):
    event_table = models.ForeignKey( EventTable, blank = True, null = True )
    category = models.ForeignKey( Category  )
    kata = models.ForeignKey(Kata)
    tori = models.CharField(max_length=100)
    tori_club = models.CharField(max_length=60)
    uke = models.CharField(max_length=100)
    uke_club = models.CharField(max_length=60)
    total_score = models.DecimalField( decimal_places=2, max_digits=5, blank=True, null=True, default=0.0)
    scores_approved = models.BooleanField( default = False, blank = True   )
    created = models.DateField(editable=False)
    updated = models.DateTimeField(editable=False)
    search =  models.CharField(max_length=160, editable=False, db_index = True, null=True, blank=True )
        
    def __unicode__(self):
        return self.kata.kata_name + ':: Tori:%s Uke:%s @ %s ' %( self.tori, self.uke , self.category.event.event_name )

    def save(self):
        if not self.id or not self.created:
            self.created = datetime.today()
        self.updated = datetime.today()
        self.search = self.__unicode__()
        super( KataExecution, self).save()  
        
    def info(self ):
        return " {0} @ {1}".format( self.kata.kata_name, self.category.event.event_name )  

class KataExecutionForm( ModelForm ):
    class Meta:
        model = KataExecution
        exclude = ('event',)
            
#######################################   
class KataImage( models.Model ):
    kata = models.ForeignKey(Kata)
    image = models.ImageField( 'Image',
                                height_field='',
                                width_field='',
                                upload_to='kata_images/',
                                max_length=200
                                )
    
    def image_img(self):
        if self.image:
            return u'<img src="%s" />' % self.image.url_125x125 
        else:
            return '(No imagen)'

    image_img.short_description = 'Thumb'
    image_img.allow_tags = True

##########################################################################        
class KataTechnique( models.Model ):
    kata = models.ForeignKey(Kata)
    tech_order = models.PositiveSmallIntegerField( default = 1 )
    tech_name = models.CharField(max_length=200)
    tech_description = models.TextField()

    def __unicode__(self):
        return "{0} {1} {2}".format( self.kata.kata_name, self.tech_order, self.tech_name) 

###########################################################################        

class TechVideo( models.Model ):
    execution = models.ForeignKey(KataExecution)
    technique = models.ForeignKey(KataTechnique ) #, limit_choices_to={'kata': execution.kata } )
    video = models.FileField( 'Video',
                                upload_to='tech_videos/',
                                max_length=2000
                                )
    
    created = models.DateField(editable=False)
    updated = models.DateTimeField(editable=False)
        
    def __unicode__(self):
        return "{0} {1} {2}".format( self.execution.category.event.event_name, self.execution.kata.kata_name, self.technique.tech_name, ) 

    def save(self):
        if not self.id or not self.created:
            self.created = datetime.today()
        self.updated = datetime.today()
        super( TechVideo, self).save()

        new_n  = path.join( path.dirname( self.video.name ), "{0}_{1}".format( self.id , path.basename( self.video.name  )))
        rename(  path.join( settings.MEDIA_ROOT, self.video.name ) , path.join( settings.MEDIA_ROOT, new_n) )
        self.video = new_n
        return super( TechVideo, self ).save(  ) 

###########################################################################        

class Critique( UserData ):
    tech_video = models.ForeignKey(TechVideo)
    language = models.CharField(max_length=20, blank=True, null=True )
    search =  models.CharField(max_length=160, editable=False, db_index = True, null=True, blank=True )

    media = models.FileField( 'Video',
                                upload_to='critiques/',
                                max_length=2000
                                )
    
    def save(self ):  
        
        super( Critique, self ).save( ) 
        new_n  = path.join( path.dirname( self.media.name ), "{0}_{1}".format( self.id , path.basename( self.media.name  )))
        rename(  path.join( settings.MEDIA_ROOT, self.media.name ) , path.join( settings.MEDIA_ROOT, new_n) )
        self.media = new_n
        self.search = self.__unicode__()
        return super( Critique, self ).save(  ) 
        
         
    def __unicode__(self):
        return "{0} {1} {2} {3}".format( self.user.first_name + ' ' + self.user.last_name , self.tech_video.execution, self.language + ' ' + self.tech_video.execution.kata.kata_name, self.tech_video.technique.tech_name, ) 


        
###############################################
        
class Score( UserData ):
    execution = models.ForeignKey(KataExecution)
    technique = models.ForeignKey(KataTechnique ) #, limit_choices_to={'kata': execution.kata } )
    tori = models.DecimalField( null=True , decimal_places=2, max_digits=5, default=5)
    uke = models.DecimalField( null=True , decimal_places=2, max_digits=5, default=5)
    score = models.DecimalField( null=True , decimal_places=2, max_digits=5)

    def __unicode__(self):
        return "{0} {1} {2} {3} {4}".format( self.user.first_name + ' ' + self.user.last_name , self.execution.event.event_name, self.execution.kata.kata_name, self.technique.tech_name, self.score ) 

    def save(self ):  
    
        if not self.score:
            self.score = self.tori + self.uke
                
        super( Score, self ).save( ) 
  
class ScoreForm( ModelForm ):
    class Meta:
        model = Score
        exclude = ('execution','technique','score')    