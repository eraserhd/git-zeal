# git-zeal

Zealously run your tests (on every commit)

## Installing

    $ sudo make install

## SYNOPSIS

    git zeal status
    git zeal build [<commit>]
    git zeal run
    git zeal next
    git zeal clear-build-result <commit>
    git zeal set-build-result [--exit <exit-code>] [--log <build-log>] <commit>
    git zeal show-build-status [--vars] [--log] [--shell] <commit>

## COMMANDS

     status
         Prints the status of all local branches.  Tries to go back to
         the last good commit, but won't go back further than 10 commits.
         Each line has a status in square brackets, which is "OK" to
         indicate the build was good, "XX" to indicate it was bad, and
         "??" to indicate we don't know the result yet.

     build <commit>
         Checks out a detached worktree, runs zeal.build-command, records
         the build result, and cleans up.

     run
         Polls for new commits and builds them smartly (see `next' for
         a description on how this works).  Clears the screen and displays
         the results of `git zeal status` while building and polling.

     next
         Print the next best commit to test.  Newer commits are
         prioritized over older commits, and branch tips are prioritized
         over deeper commits.  Zeal assumes that we don't care about
         the result of deeper commits if we have shallower commits which
         are OK.  If the branch is broken, the next commit is effectively
         the commit which would bisect the branch to isolate the broken
         commit.

     clear-build-result <commit>
         Remove data about the result of building <commit>.

     set-build-result [-e|--exit <exit-code>] [-l|--log <build-log>]
     [-v|--variable <varname>=<value>] <commit>
         Record a build result for use by `next' and `status'.

     show-build-result [--vars|--log] [--var-prefix=<prefix>] [--shell]
     <commit>
         Show the recorded result of a build.  If --vars is supplied,
         print only the variables (including the exit code).  If --log
         is supplied, show only the build log.  If neither is supplied,
         show the variables, a blank line, then the build log.

         If --shell is provided, escape the variables for evaluation by
         the shell.  If <prefix> is supplied, prepend it to the variable
         names.
