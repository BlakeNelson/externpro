########################################
# boost iostreams
set(VER 1.57.0)
set(REPO https://github.com/smanders/iostreams)
set(PRO_BOOSTIOSTREAMS
  NAME boostiostreams
  SUPERPRO boost
  SUBDIR libs/iostreams # patches to headers should be in boostiostreamshpp
  WEB "iostreams" http://boost.org/libs/iostreams "boost iostreams website"
  LICENSE "open" http://www.boost.org/users/license.html "Boost Software License"
  DESC "iostreams provides a framework for defining streams, stream buffers and i/o filters"
  REPO "repo" ${REPO} "forked iostreams repo on github"
  VER ${VER}
  GIT_ORIGIN git://github.com/smanders/iostreams.git
  GIT_UPSTREAM git://github.com/boostorg/iostreams.git
  GIT_TRACKING_BRANCH develop
  GIT_TAG xp${VER}
  GIT_REF boost-${VER}
  PATCH ${PATCH_DIR}/boost.iostreams.patch
  DIFF ${REPO}/compare/boostorg:
  )
########################################
function(mkpatch_boostiostreams)
  xpRepo(${PRO_BOOSTIOSTREAMS})
endfunction()
