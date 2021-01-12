# Smart zsh folders
#
# Based on: https://michael-prokop.at/blog/2009/05/30/directory-specific-shell-configuration-with-zsh/

# define profiles based on directories:
zstyle ':chpwd:profiles:$HOME/Projects/Python(|/|/*)' profile python
zstyle ':chpwd:profiles:/etc(|/|/*)'     profile debian
zstyle ':chpwd:profiles:/home/mika/Customers(|/|/*)' profile customers

# configuration for profile 'grml':
chpwd_profile_python()
{
  [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
  print "chpwd(): Switching to profile: $profile"

  export DEBEMAIL=mika@grml.org
  export GIT_AUTHOR_EMAIL="mika@grml.org"
  export GIT_COMMITTER_EMAIL="mika@grml.org"
}

# configuration for profile 'debian':
chpwd_profile_debian()
{
  [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
  print "chpwd(): Switching to profile: $profile"

  export DEBEMAIL=mika@debian.org
  export GIT_AUTHOR_EMAIL="mika@debian.org"
  export GIT_COMMITTER_EMAIL="mika@debian.org"
}

# configuration for profile 'customers':
chpwd_profile_customers()
{
  [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
  print "chpwd(): Switching to profile: $profile"

  export TELEPHONE=[...]
  export MAIL=[...]
}

# chpwd_profiles(): Directory Profiles, Quickstart:
#
# In .zshrc.local:
#
#   zstyle ':chpwd:profiles:/usr/src/grml(|/|/*)'   profile grml
#   zstyle ':chpwd:profiles:/usr/src/debian(|/|/*)' profile debian
#   chpwd_profiles
#
# For details see the `grmlzshrc.5' manual page.
function chpwd_profiles () {
    local profile context
    local -i reexecute

    context=":chpwd:profiles:$PWD"
    zstyle -s "$context" profile profile || profile='default'
    zstyle -T "$context" re-execute && reexecute=1 || reexecute=0

    if (( ${+parameters[CHPWD_PROFILE]} == 0 )); then
        typeset -g CHPWD_PROFILE
        local CHPWD_PROFILES_INIT=1
        (( ${+functions[chpwd_profiles_init]} )) && chpwd_profiles_init
    elif [[ $profile != $CHPWD_PROFILE ]]; then
        (( ${+functions[chpwd_leave_profile_$CHPWD_PROFILE]} )) \
            && chpwd_leave_profile_${CHPWD_PROFILE}
    fi
    if (( reexecute )) || [[ $profile != $CHPWD_PROFILE ]]; then
        (( ${+functions[chpwd_profile_$profile]} )) && chpwd_profile_${profile}
    fi

    CHPWD_PROFILE="${profile}"
    return 0
}

chpwd_functions=( ${chpwd_functions} chpwd_profiles )
