" :help new-filetype
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile .gitattributes setf gitattributes
    au! BufRead,BufNewFile SConstruct setf python
    au! BufRead,BufNewFile SConscript setf python
    au! BufRead,BufNewFile Vagrantfile setf ruby
    au! BufRead,BufNewFile Podfile,*.podspec setf ruby
    au! BufRead,BufNewFile wscript setf python
    au! BufRead,BufNewFile Fastfile setf ruby
    au! BufRead,BufNewFile Appfile setf ruby
    au! BufRead,BufNewFile Deliverfile setf ruby
    au! BufRead,BufNewFile .mrconfig setf ini
    au! BufRead,BufNewFile .yamllint setf yaml
    au! BufRead,BufNewFile .env,.env.* setf sh

    au! BufRead,BufNewFile *.js,*.jsx set filetype=javascript.jsx

    " mako and jinja2 have bad detection
    " we'll just treat them as html for most purposes
    " ideally we'd use b:mako_outer_lang here and some equivalent that doesn't
    " exist right now for jina2 to set the filetype as:
    "   <b:mako_outer_lang>.mako
    au! BufRead,BufNewFile *.jinja2 set filetype=html.jinja
    au! BufRead,BufNewFile *.mako,*.dbtmako set filetype=html.mako
augroup END
