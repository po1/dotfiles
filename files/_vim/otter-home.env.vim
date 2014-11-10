call javacomplete#SetClassPath(''
            \ .':'.$HOME.'/dev/adt/sdk/platforms/android-19/android.jar'
            \ .':'.$HOME.'/dev/adt/sdk/add-ons/addon-tablet_internal_sdk_addon-amazon-19/libs/tabletwidgets.jar'
            \ .':'.$HOME.'/dev/otter-home/libs/TabletSAU.jar'
            \ )

" \ .':'.$HOME.'/dev/adt/sdk/add-ons/addon-tablet_internal_sdk_addon-amazon-19-1/*'
call javacomplete#AddSourcePath($HOME.'/dev/otter-home/src')

let mcp  = "~/dev/adt/sdk/platforms/android-19/android.jar"
let mcp .= ":~/dev/adt/sdk/add-ons/addon-tablet_internal_sdk_addon-amazon-19-1/libs/*"
let mcp .= ":~/dev/otter-home/libs/*"
let mcp .= ":~/dev/otter-home/bin/classes/"

let g:syntastic_java_javac_classpath=mcp

set tags+=~/.vim/otter-home.tags
