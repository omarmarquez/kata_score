from django import template
from django.utils.datastructures import SortedDict
register = template.Library()

@register.filter
def getitem ( item, string ):
  return item.get(string,'')

@register.filter
def getitem2 ( item, string ):
    k1,k2 = string.split(',')
    return item.get(( int(k1),int(k2)), '')
  
@register.filter(name='sort')
def listsort(value):
  if isinstance(value,dict):
    new_dict = SortedDict()
    key_list = value.keys()
    key_list.sort()
    for key in key_list:
      new_dict[key] = value[key]
    return new_dict
  elif isinstance(value, list):
    new_list = list(value)
    new_list.sort()
    return new_list
  else:
    return value
listsort.is_safe = True
