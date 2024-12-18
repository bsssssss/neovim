" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Entités (en MAJUSCULES suivies de :)
syntax match mcdEntity '\v[a-zA-Z][a-zA-Z0-9_']*\ze:'

" Attributs (après :, séparés par des virgules)
syntax match mcdAttribute '\v[^:,]+\ze(,|$)'

" Cardinalités (01, 0N, 1N, etc.)
syntax match mcdCardinality '\v[01][01N]'

" Relations 
syntax match mcdRelation '\v[a-zA-Z][a-zA-Z0-9_ ]*\ze,'

" Séparateurs  
syntax match mcdSeparator ':'
syntax match mcdComma ','

" Les liens invisibles (lignes de :)
syntax match mcdInvisible '\v:{2,}'

" Highlight links
highlight default link mcdEntity Type
highlight default link mcdAttribute String
highlight default link mcdCardinality Number  
highlight default link mcdRelation Function
highlight default link mcdSeparator Operator
highlight default link mcdComma Delimiter
highlight default link mcdInvisible Comment
