# Show git branch name
parse_git_branch ()
{
        git branch 2>/dev/null | grep "^*" | sed 's#* \(.*\)#\1#'
}

# Show SVN revision number
parse_svn_revision ()
{
        svn info 2>/dev/null | grep "^Revision" | cut -f2 -d" " | sed 's#\(.*\)#r\1#'
}

# Show CVS name
parse_cvs_name ()
{
        test ! -d CVS || echo "cvs"
}

# Show git-svn release
parse_git_svn_revision ()
{
        git svn find-rev HEAD 2>/dev/null |  sed "s#\(.*\)#r\1#"
}

# Show info about VCS
parse_vcs ()
{
        echo -n $(parse_git_branch && parse_git_svn_revision && parse_svn_revision && parse_cvs_name) | sed 's#\(.*\)#{\1}#'
}

if [ -n "$DOCKER_NAME" ]; then
	chroot_name=$DOCKER_NAME
fi

if [ -n "$SCHROOT_CHROOT_NAME" ]; then
	chroot_name=$SCHROOT_CHROOT_NAME
fi

if [ -n "$UNDER_JHBUILD" ]; then
	env_name="jhbuild"
fi

if [ -n "$chroot_name" ]; then
        PS1='\[\033[01;37m\]($chroot_name${env_name:+\[\033[00;32m\]#${env_name}})\[\033[01;30m\]\u@\h\[\033[00m\]:\[\033[31m\]$(parse_vcs)\[\033[00;34m\]\w\[\033[00m\]\$ '
else
        PS1='${env_name:+\[\033[00;32m\](#${env_name})}\[\033[01;30m\]\u@\h\[\033[00m\]:\[\033[31m\]$(parse_vcs)\[\033[00;34m\]\w\[\033[00m\]\$ '
fi
