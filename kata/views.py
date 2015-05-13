# Create your views here.
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
#from django.template import Context, loader
from django.template import RequestContext
from django.conf import settings
from django.core.urlresolvers import reverse
from django.db.models import Q, Avg, Sum

from kata.models import Event, EventTable, EventTableForm,  KataExecution,  KataExecutionForm, Score, ScoreForm
from kata.models import Category, CategoryForm, KataTechnique, TechVideo, Critique
###################################################
def index( request ):
    
    search_exp = request.session.get( 'search_exp', '') # settings.DEFAULT_DEP_SEARCH )
    if request.POST.has_key('search_exp'):
        search_exp = request.POST['search_exp']        
    request.session[ 'search_exp' ] = search_exp
    
        
    rs = KataExecution.objects.filter( )
    for exp in search_exp.split():
        rs = rs.filter( Q( search__icontains=exp ) )
    
    rs = rs.order_by('-updated')[:130]
    
    ers = Event.objects.filter( ).order_by('event_date')[:10]
    
    return render_to_response(
                    'index.html'
                   , { 
                      'search_exp': search_exp,
                      'ke_list':    rs,
                      'event_list':    ers,
                      }
                   , context_instance=RequestContext(request)
     )
 
 
###################################################
def event( request, id ):
    
    search_exp = request.session.get( 'search_exp', '') # settings.DEFAULT_DEP_SEARCH )
    #if request.POST.has_key('search_exp'):
    #    search_exp = request.POST['search_exp']        
    #request.session[ 'search_exp' ] = search_exp
    
    event = Event.objects.get( id = id )  
    

    return render_to_response(
                    'event.html'
                   , { 
                      'event':      event,
                       }
                   , context_instance=RequestContext(request)
     )

###################################################
def table( request, tab_id ):
    
    search_exp = request.session.get( 'search_exp', '') # settings.DEFAULT_DEP_SEARCH )
    #if request.POST.has_key('search_exp'):
    #    search_exp = request.POST['search_exp']        
    #request.session[ 'search_exp' ] = search_exp
    
    tab = EventTable.objects.get( id = tab_id )  
    

    return render_to_response(
                    'table.html'
                   , { 
                      'tab':      tab,
                       }
                   , context_instance=RequestContext(request)
     )

###################################################    
def kata_lst( request, event_id , tab_id = None ):
        
    katalst = KataExecution.objects.filter( category__event_id = event_id ) if not tab_id else  KataExecution.objects.filter( category__event_id = event_id, event_table_id = tab_id  )
    
    return render_to_response(
                    'kata_list.html'
                   , { 
                      'katalst'   :   katalst,
                      'event_id'    : event_id,
                      'tab_id'      : tab_id, 
                      'eventAdmin':   request.user.groups.filter(name='KataEvent_Admins' ),
                      }
                   , context_instance=RequestContext(request)
     )



def kata_add( request, event_id ):
        
    if request.method == 'POST':
        kat = KataExecution( )
        f = KataExecutionForm( request.POST )
        if f.is_valid():
            f.save()
            return kata_lst( request, event_id )

        
    f = KataExecutionForm( )
    f.fields['event_table'].queryset = EventTable.objects.filter( event_id = event_id )
    f.fields['category'].queryset = Category.objects.filter( event_id = event_id )
 
    return render_to_response(
                    'record_mod.html'
                   , { 
                      'title'       : 'Kata Execution',
                      'post_url'    : request.get_full_path(),
                      'form'        : f,
                      'target_id'   : '#kata_window'
                      }
                   , context_instance=RequestContext(request)
                   )
         

def kata_mod( request, kat_id ):
        
    kata = KataExecution.objects.get( id = kat_id )
    if request.method == 'POST':
        
        f = KataExecutionForm( request.POST , instance=kata )
        if f.is_valid():
            f.save()
            return kata_lst( request, kata.event_table.event_id )

        
    f = KataExecutionForm( instance =  kata )
    f.fields['event_table'].queryset = EventTable.objects.filter( event_id = kata.event_table.event_id )
    f.fields['category'].queryset = Category.objects.filter( event_id = kata.category.event_id )
    return render_to_response(
                    'record_mod.html'
                   , { 
                      'title'       : 'Kata Execution',
                      'post_url'    : request.get_full_path(),
                      'form'        : f,
                      'target_id'   : '#kata_window'
                      }
                   , context_instance=RequestContext(request)
                   )
         
    
def kata_sel( request,  kat_id  ):
        
    kat = KataExecution.objects.get( id = kat_id )
    event_id = kat.category.event_id
    mat = EventTable.objects.get( id = kat.event_table.id )
    prev = mat.current_execution
    mat.current_execution=kat_id
    tec = KataTechnique.objects.filter( kata_id = kat.kata_id ).order_by('tech_order')[0]
    mat.current_technique = tec.id
    mat.save()

    return table_status( request,  mat.id )



def kata_del( request,  kat_id  ):
        
    kat = KataExecution.objects.get( id = kat_id )
    event_id = kat.category.event_id
    kat.delete()
    return kata_lst( request, event_id )


def kata_scores( request,  kat_id  ):
    from django.contrib.auth.models import User
    
    kata = KataExecution.objects.get( id = kat_id )
    scores_set = Score.objects.filter( execution_id = kat_id )
    
    scores = dict( [ (( s.user_id, s.technique_id ), (s.tori,s.uke, s.score )) for s in scores_set ])
    
    techs= KataTechnique.objects.filter( kata_id = kata.kata_id ).order_by('tech_order')
    
    totals = {}
    count={}
    ud={}
    for u,t in scores.keys():
        ud[ u ] = t
        totals[ u ] = totals.get( u, 0 ) + scores[ (u,t) ][2]
        count[ u ] = count.get( u, 0 ) +1
     
    for u in ud.keys():
            totals[ u ] =  totals[ u ] / count[ u ]
            
    judges = User.objects.filter( id__in =ud.keys() ).order_by('first_name')
      

    event = Event.objects.get( id=kata.category.event_id  )

    kelst =  [ {
                                        'kata':        kata,
                                        'scores'   :   scores,
                                        'techniques':   techs,
                                        'totals':       totals,
                                        'judges'      : judges,
                      } ]
 

    return render_to_response(
                    'kata_scores.html'
                   , { 
                     'event_id'    : event.id,
                     'event'    : event,
                      'ke_lst'     : kelst,
                      'eventAdmin':   request.user.groups.filter(name='KataEvent_Admins' ),
                      }
                   , context_instance=RequestContext(request)
     )

def approve_scores( request,  kat_id  ):
        
    #import pdb; pdb.set_trace()
    #from pprint import pprint
    katae = KataExecution.objects.get( id = kat_id )
    katae.scores_approved = True
    katae.save()
    return kata_scores( request, katae.id )


def category_scores( request,  cat_id  ):
    from django.contrib.auth.models import User
    
    cat = Category.objects.get( id = cat_id )
    event_id = cat.event_id

    kelst = []
    for ke in KataExecution.objects.filter( category_id = cat_id ).order_by(  "-total_score" ):
        scores_set = Score.objects.filter( execution_id = ke.id )
        
        scores = dict( [ (( s.user_id, s.technique_id ), (s.tori,s.uke, s.score )) for s in scores_set ])
        
        techs= KataTechnique.objects.filter( kata_id = ke.kata_id ).order_by('tech_order')
        
        totals = {}
        count={}
        ud={}
        for u,t in scores.keys():
            ud[ u ] = t
            totals[ u ] = totals.get( u, 0 ) + scores[ (u,t) ][2]
            count[ u ] = count.get( u, 0 ) +1
         
        for u in ud.keys():
                totals[ u ] =  totals[ u ] / count[ u ]
                
        judges = User.objects.filter( id__in =ud.keys() ).order_by('first_name')
        
        kelst.append(  {
                            'kata':        ke,
                            'scores'   :   scores,
                            'techniques':   techs,
                            'totals':       totals,
                            'judges'      : judges,
                          } )
     

    return render_to_response(
                    'kata_scores.html'
                   , { 
                     'event_id'    : event_id,

                      'ke_lst'     : kelst,
                      'eventAdmin':   request.user.groups.filter(name='KataEvent_Admins' ),
                      }
                   , context_instance=RequestContext(request)
     )

   
def table_lst( request, event_id ):
        
    tablelst = EventTable.objects.filter( event_id = event_id )
    
    return render_to_response(
                    'table_list.html'
                   , { 
                     'event_id'    : event_id,
                      'tablelst'   :   tablelst,
                      'eventAdmin':   request.user.groups.filter(name='KataEvent_Admins' ),
                      'eventJudge':   request.user.groups.filter(name='Kata_Judges' ),
                      }
                   , context_instance=RequestContext(request)
     )

def table_add( request, event_id ):
        
    if request.method == 'POST':
        tab = EventTable( event_id = event_id , user = request.user )
        f = EventTableForm( request.POST , instance=tab )
        if f.is_valid():
            f.save()
            return table_lst( request, event_id )

        
    f = EventTableForm( )
    return render_to_response(
                    'record_mod.html'
                   , { 
                      'title'       : 'Event Mats',
                      'post_url'    : request.get_full_path(),
                      'form'        : f,
                      'target_id'   : '#kata_window'
                      }
                   , context_instance=RequestContext(request)
                   )
         

def table_mod( request, tab_id ):
        
    tab = EventTable.objects.get( id = tab_id )
    if request.method == 'POST':
        
        f = EventTableForm( request.POST , instance= tab )
        if f.is_valid():
            f.save()
            return table_lst( request, tab.event_id )

        
    f = EventTableForm( instance =  tab )
    return render_to_response(
                    'record_mod.html'
                   , { 
                      'title'       : 'Event Mats',
                      'post_url'    : request.get_full_path(),
                      'form'        : f,
                      'target_id'   : '#kata_window'
                      }
                   , context_instance=RequestContext(request)
                   )
         
    


def table_del( request, event_id, tab_id  ):
        
    tab = EventTable.objects.get( id = tab_id )
    tab.delete()
    return table_lst( request, event_id )


def table_status( request, tab_id, tchg=0  ):
        
    tab = EventTable.objects.get( id = tab_id )
    kata = KataExecution.objects.get( id = tab.current_execution )
    tech = KataTechnique.objects.get( id = tab.current_technique )
    prev = next = None
    tchg=int(tchg)
    try:
        prev = KataTechnique.objects.filter( kata_id = tech.kata_id , tech_order__lt = tech.tech_order ).order_by('-tech_order')[0]
    except:
        pass
    try:
        next = KataTechnique.objects.filter( kata_id = tech.kata_id , tech_order__gt = tech.tech_order ).order_by('tech_order')[0]
    except:
        pass
    
    if tchg > 0:
        prev = tech
        tech = next
        next = KataTechnique.objects.filter( kata_id = tech.kata_id , tech_order__gt = tech.tech_order ).order_by('tech_order')[0]
        
    if tchg < 0:
        next = tech
        tech = prev
        prev = KataTechnique.objects.filter( kata_id = tech.kata_id , tech_order__lt = tech.tech_order ).order_by('-tech_order')[0]
    
    if tchg != 0:
        tab.current_technique = tech.id
        tab.save()
           
    return render_to_response(
                    'table_status.html'
                   , { 
                      'mat'    : tab,
                      'kata'    : kata,
                      'technique': tech,
                      'prev':   prev,
                      'next':   next,
                      'eventAdmin':   request.user.groups.filter(name='KataEvent_Admins' ),
                      }
                   , context_instance=RequestContext(request)
     )

def table_score( request, tab_id, kata_id=None, tech_id = None  ):
        
    tab = EventTable.objects.get( id = tab_id )
    if not kata_id:
        kata_id = tab.current_execution
    if not tech_id:
        tech_id = tab.current_technique
    kata = KataExecution.objects.get( id = kata_id  )
    techlst  = KataTechnique.objects.filter( kata_id = kata.kata_id ).order_by( 'tech_order')
    tech = None
    
    if request.method == 'POST':
        score = Score( execution_id = tab.current_execution , user = request.user, technique_id = request.POST['technique_id'] )
        form = ScoreForm( request.POST , instance=score )
        if form.is_valid():
            Score.objects.filter(execution_id = tab.current_execution , user = request.user, technique_id = request.POST['technique_id'] ).delete()   
            form.save()
            ct = KataTechnique.objects.get( id =request.POST['technique_id']  )
            # Get Next technique or calculate total score
            try:
                tech = KataTechnique.objects.filter( kata_id = ct.kata_id , tech_order__gt=ct.tech_order ).order_by('tech_order')[0]
            except:

                try:
                    kata.total_score = "%.15g" % Score.objects.filter( execution_id = kata.id ).aggregate( Avg('score') )['score__avg']
                    kata.save()
                except:
                    pass

                return render_to_response(
                    'msg_complete.html'
                   , { 
                      'msg'     : 'Scoring Completed',
                      'mat'    : tab,
                      'kata'    : kata,
                      'technique': tech,
                      }
                   , context_instance=RequestContext(request)
                )
    else:    
        tech = KataTechnique.objects.get( id= tech_id )
        form = ScoreForm()        
    
    video = None
    try:   
        video = TechVideo.objects.get( execution_id = kata_id, technique_id=tech.id )
    except:
        pass
    
    
    return render_to_response(
                    'mat_score_ajax.html'
                   , { 
                      'mat'    : tab,
                      'kata'    : kata,
                      'technique': tech,
                      'techlst' : techlst,
                      'form'    : form,
                      'pscores' : [ s/10.0 for s in range( 50, -5, -5 ) ],
                      'video'   : video,
                      'post_url'    : request.get_full_path(),
                       'eventAdmin':   request.user.groups.filter(name='KataEvent_Admins' ),
                      }
                   , context_instance=RequestContext(request)
     )

def score_board( request, event_id ):
    
    event = Event.objects.get( id = event_id )
    catlst = Category.objects.filter( event_id = event_id )
    
    if event.scoring_review == True:
        for i,c in enumerate( catlst):
            catlst[ i ].katalst = KataExecution.objects.filter( category_id = c.id, scores_approved = True ).order_by(  "-total_score" )[:4]
    else:
        for i,c in enumerate( catlst):
            catlst[ i ].katalst = KataExecution.objects.filter( category_id = c.id ).order_by(  "-total_score" )[:4]
    
    return render_to_response(
                    'score_board.html'
                   , { 
                      'event_id'    : event_id,
                      'event'       : event,
                      'catlst'   :   catlst,                      
                      'eventAdmin':   request.user.groups.filter(name='KataEvent_Admins' ),
                      }
                   , context_instance=RequestContext(request)
     )
    

   
def category_lst( request, event_id ):
    
    catlst = Category.objects.filter( event_id = event_id )
    
    return render_to_response(
                    'category_list.html'
                   , { 
                      'event_id'    : event_id,
                      'catlst'   :   catlst,
                      'eventAdmin':   request.user.groups.filter(name='KataEvent_Admins' ),
                      }
                   , context_instance=RequestContext(request)
     )
    


def category_add( request, event_id ):
        
    if request.method == 'POST':
        cat = Category( event_id = event_id )
        f = CategoryForm( request.POST , instance=cat )
        if f.is_valid():
            f.save()
            return category_lst( request, cat.event_id )

        
    f = CategoryForm( )
    
    return render_to_response(
                    'record_mod.html'
                   , { 
                      'title'       : 'Category',
                      'post_url'    : request.get_full_path(),
                      'form'        : f,
                      'target_id'   : '#kata_window'
                      }
                   , context_instance=RequestContext(request)
                   )
         

def category_mod( request, cat_id ):
        
    cat = Category.objects.get( id = cat_id )
    if request.method == 'POST':
        
        f = CategoryForm( request.POST , instance=cat )
        if f.is_valid():
            f.save()
            return category_lst( request, cat.event_id )

        
    f = CategoryForm( instance =  cat )
    return render_to_response(
                    'record_mod.html'
                   , { 
                      'title'       : 'Category',
                      'post_url'    : request.get_full_path(),
                      'form'        : f,
                      'target_id'   : '#kata_window'
                      }
                   , context_instance=RequestContext(request)
                   )
         
    


def category_del( request, event_id, cat_id  ):
        
    cat = Category.objects.get( id = cat_id )
    cat.delete()
    return category_lst( request, event_id )


   
###################################################    
def kview( request, exec_id ):
    
    kexecution = KataExecution.objects.get( id = exec_id )
    
    techlst = KataTechnique.objects.filter( kata_id = kexecution.kata.id ).order_by('tech_order')
    
    videolst = TechVideo.objects.filter( execution_id = exec_id )
    vlst = dict( [ ( v.technique_id, v )  for v in videolst ])
    
    return render_to_response(
                    'kview.html'
                   , { 
                      
                      'kexec'   :   kexecution,
                      'techlst' :   techlst,
                      'vidlst'  :   vlst, 
                   
                      }
                   , context_instance=RequestContext(request)
     )
    
###################################################   

def tech_video( request, vid_id  ):

    vid = TechVideo.objects.get( id = vid_id )
    
    return render_to_response(
                    'tec_video.html'
                   , { 
                      'vid'   :   vid,
                      }
                   , context_instance=RequestContext(request)
     )    
    
def critique_video( request, vid_id  ):

    vid = Critique.objects.get( id = vid_id )
    
    return render_to_response(
                    'video_small.html'
                   , { 
                      'vid'   :   vid,
                      }
                   , context_instance=RequestContext(request)
     )    
###################################################   

def vupload( request, exec_id, tec_id  ):
    from django.core.files import File
    
    vf = request.FILES['video']
    vid = TechVideo( execution_id = exec_id, technique_id = tec_id , video = vf )
    vid.save()  
        
    kexecution = KataExecution.objects.get( id = exec_id )
    
    return render_to_response(
                    'tec_video.html'
                   , { 
                      'vid'   :   vid,
                      }
                   , context_instance=RequestContext(request)
     )
    
def cupload( request, vid_id  ):
    from django.core.files import File
    
    vf = request.FILES['video']
    vid = Critique( tech_video_id = vid_id , media = vf , user_id = request.user.id , language = request.POST['language'])
    vid.save()  
    
    return vcritiques( request, vid_id )
###################################################   

def vcritiques(request , vid_id ):
    "Ajax Method loads up the list of critiques for a video"
    
    critiquelst = Critique.objects.filter( tech_video_id = vid_id )
    
    return render_to_response(
                    'critiques.html'
                   , { 
                      'critiques'   :   critiquelst,
                      }
                   , context_instance=RequestContext(request)
     )        
    
