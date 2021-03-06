function(recurseDirs base)
  if(EXISTS ${base} AND IS_DIRECTORY ${base})
    file(GLOB dircontents ${base}/*)
    foreach(subdir ${dircontents})
      recurseDirs(${subdir}/node_modules)
      list(APPEND dirList "${subdir}")
      set(dirList ${dirList} PARENT_SCOPE)
    endforeach()
  endif()
endfunction()

macro(recurseRemoveDirs base rmdir)
  if(EXISTS ${base} AND IS_DIRECTORY ${base})
    file(GLOB dircontents ${base}/*)
    foreach(item ${dircontents})
      if(IS_DIRECTORY ${item})
        get_filename_component(dir ${item} NAME)
        if(${dir} STREQUAL ${rmdir})
          list(APPEND rmList "${item}")
        else()
          recurseRemoveDirs(${item} ${rmdir})
        endif()
      endif()
    endforeach()
  endif()
endmacro()

separate_arguments(rmdirs)
foreach(rmd ${rmdirs})
  set(rmList)
  recurseRemoveDirs(${rmroot} ${rmd})
  foreach(d ${rmList})
    if(EXISTS ${d} AND IS_DIRECTORY ${d})
      file(REMOVE_RECURSE ${d})
    endif()
  endforeach()
endforeach()

separate_arguments(dirs)
foreach(rootdir ${dirs})
  set(dirList)
  recurseDirs(${rootdir})
  foreach(d ${dirList})
    get_filename_component(l ${d} NAME)
    if(NOT EXISTS "${rootdir}/${l}")
      file(RENAME "${d}" "${rootdir}/${l}")
    endif()
  endforeach()
endforeach()
