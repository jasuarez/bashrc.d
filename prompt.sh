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

if [ -n "$CONTAINER_NAME" ]; then
        chroot_name=$CONTAINER_NAME
fi

if [ -n "$UNDER_JHBUILD" ]; then
        env_name="jhbuild"
fi

chroot_env_names="${chroot_name}${env_name}"

PS1='${chroot_env_names:+(}${chroot_name:+\[\033[01;37m\]${chroot_name}\[\033[00m\]}${env_name:+${chroot_name:+#}\[\033[00;32m\]${env_name}\[\033[00m\]}${chroot_env_names:+)}\[\e[38;5;208m\]\u\[\033[00m\]@\[\e[38;5;208m\]\h\[\033[00m\]:\[\033[31m\]$(parse_vcs)\[\e[38;5;39m\]\w\[\033[00m\]$ '

