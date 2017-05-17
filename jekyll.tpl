{% extends 'markdown.tpl' %}

{%- block header -%}
---
layout: default
title: "{{resources['metadata']['name']}}"
tags:
    - notebook

permalink: "{{resources['metadata']['name']}}.html"
---
{%- endblock header -%}

{% block in_prompt %}
<br>
<font color ='#00bcd4'> In [{{ cell.execution_count }}]: </font>
{% endblock in_prompt %}

{% block input %}
{{ '{% highlight R %}' }}
{{ cell.source }}
{{ '{% endhighlight %}' }}
{% endblock input %}

{% block data_svg %}
![svg]({{ output.metadata.filenames['image/svg+xml'] | path2support }})
{% endblock data_svg %}

{% block data_png %}
![png]({{ output.metadata.filenames['image/png'] | path2support }})
{% endblock data_png %}

{% block data_jpg %}
![jpeg]({{ output.metadata.filenames['image/jpeg'] | path2support }})
{% endblock data_jpg %}

{% block markdowncell scoped %}
{{ cell.source | wrap_text(80) }}
{% endblock markdowncell %}

{% block headingcell scoped %}
{{ '#' * cell.level }} {{ cell.source | replace('\n', ' ') }}
{% endblock headingcell %}


{% block data_text scoped %}
{{ output.text | indent }}
{% endblock data_text %}


{% block traceback_line %}
{{ line | indent | strip_ansi }}
{% endblock traceback_line %}


{% block data_latex %}
{{ output.latex }}
{% endblock data_latex %}

{% block data_html %}
{{ output.html }}
{% endblock data_html %}