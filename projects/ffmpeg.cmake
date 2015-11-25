########################################
# ffmpeg
xpProOption(ffmpeg)
set(VER 2.6.2)
set(REPO https://github.com/ndrasmussen/FFmpeg)
set(PRO_FFMPEG
  NAME ffmpeg
  WEB "ffmpeg" https://www.ffmpeg.org/ "ffmpeg website"
  LICENSE "LGPL" https://www.ffmpeg.org/legal.html "Lesser GPL v2.1"
  DESC "complete, cross-platform solution to record, convert and stream audio and video"
  REPO "repo" ${REPO} "forked ffmpeg repo on github"
  VER ${VER}
  GIT_ORIGIN git://github.com/ndrasmussen/FFmpeg.git
  GIT_UPSTREAM git://github.com/FFmpeg/FFmpeg.git
  GIT_TAG xp${VER} # what to 'git checkout'
  GIT_REF n${VER} # create patch from this tag to 'git checkout'
  DLURL http://ffmpeg.org/releases/ffmpeg-${VER}.tar.bz2
  DLMD5 e75d598921285d6775f20164a91936ac
  PATCH ${PATCH_DIR}/ffmpeg.patch
  DIFF ${REPO}/compare/FFmpeg:
  )
########################################
function(mkpatch_ffmpeg)
  xpRepo(${PRO_FFMPEG})
endfunction()
########################################
function(download_ffmpeg)
  xpNewDownload(${PRO_FFMPEG})
endfunction()
########################################
function(patch_ffmpeg)
  xpPatch(${PRO_FFMPEG})
endfunction()
########################################
function(build_ffmpeg)
  if(NOT (XP_DEFAULT OR XP_PRO_FFMPEG))
    return()
  endif()
  #configure_file(${PRO_DIR}/use/usexp-ffmpeg-config.cmake ${STAGE_DIR}/share/cmake/
  #  @ONLY NEWLINE_STYLE LF
  #  )
  #xpCmakeBuild(ffmpeg)
endfunction()
