
## TeX
export TEXDOCVIEW_dvi='xdvi %s'
export TEXDOCVIEW_pdf='gv %s'
if [ -n "$BROWSER" ]; then
    export TEXDOCVIEW_html="$BROWSER %s"
fi

export TEXEDIT="$EDITOR +%d %s"
