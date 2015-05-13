from django import template
register = template.Library()

@register.filter
def getitem2 ( item, string ):
    k1,k2 = string.split(',')
    return item.get(( int(k1),int(k2)), '')