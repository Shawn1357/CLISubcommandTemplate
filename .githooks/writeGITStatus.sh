#!/bin/bash

#
# Regenerates metadata information about the Git Repo State so that
# that information can be compiled into the the applications.
#.
#

GIT_TZ=America/Toronto


REPO_ROOT=$(git rev-parse --show-toplevel)
THIS_DIR=$REPO_ROOT/.githooks
TARGET_FILE_BASE_NAME=GitRepoState
JAVA_PACKAGE_NAME=ca.bdenim

NOW_TIMESTAMP=$(date +'%Y-%m-%d %H:%M:%S %z')
GIT_COMMIT_AUTHOR_NAME="$(git log -1 --pretty=format:'%cn')"
GIT_COMMIT_AUTHOR_EMAIL="$(git log -1 --pretty=format:'%ce')"
GIT_COMMIT_TIMESTAMP_UNIX="$(git log -1 --pretty=format:'%ct')"
GIT_COMMIT_TIMESTAMP_UTC="$(TZ=UTC      date -d@$GIT_COMMIT_TIMESTAMP_UNIX +'%Y-%m-%d %H:%M:%S %z')"
GIT_COMMIT_TIMESTAMP_TZ="$(TZ=${GIT_TZ} date -d@$GIT_COMMIT_TIMESTAMP_UNIX +'%Y-%m-%d %H:%M:%S %z')"
GIT_COMMIT_TIMESTAMP_LOCAL="$(git log -1 --pretty=format:'%cd' --date=iso-local)"
GIT_COMMIT_LONG_HASH="$(git log -1  --pretty=format:'%H')"
GIT_COMMIT_SHORT_HASH="$(git log -1 --pretty=format:'%h')"
GIT_BRANCH_NAME="$(git rev-parse --abbrev-ref HEAD)"

# echo "THIS_DIR                   is $THIS_DIR"
# echo "REPO_ROOT                  is $REPO_ROOT"
# echo "git GIT_COMMIT_AUTHOR      is $GIT_COMMIT_AUTHOR_NAME"
# echo "GIT_COMMIT_AUTHOR_EMAIL    is $GIT_COMMIT_AUTHOR_EMAIL"
# echo "GIT_COMMIT_TIMESTAMP_UNIX  is $GIT_COMMIT_TIMESTAMP_UNIX"
# echo "GIT_TZ                     is $GIT_TZ"
# echo "GIT_COMMIT_TIMESTAMP_TZ    is $GIT_COMMIT_TIMESTAMP_TZ"
# echo "GIT_COMMIT_TIMESTAMP_UTC   is $GIT_COMMIT_TIMESTAMP_UTC"
# echo "GIT_COMMIT_TIMESTAMP_LOCAL is $GIT_COMMIT_TIMESTAMP_LOCAL"
# echo "GIT_COMMIT_LONG_HASH       is $GIT_COMMIT_LONG_HASH"
# echo "GIT COMMIT_SHORT_HASH      is $GIT_COMMIT_SHORT_HASH"
# echo "GIT_BRANCH_NAME            is $GIT_BRANCH_NAME"


cat << EOPROPS > "$THIS_DIR/$TARGET_FILE_BASE_NAME.properties"
#
# Automatically generated file.
# Source of this file is: $0
# Do not make changes here ass they will be overwritten.
#
# File generated at: $NOW_TIMESTAMP
#
# This file is generated as a result of the following git hooks being
# called:
#    - post-checkout
#    - post-commit
#    - post-merge
#    - post-rewrite
#    - post-update
#
# Properties:
#    - git.repo.selected.timezone
#      Identifies a particular timezone to translate timestamps
#      to in addition to UTC and the local time zone.
#
#    - git.repo.last.commit.ts.unix
#      The UNIX Epoch timestamp (seconds from Jan 1, 1970).
#
#    - git.repo.last.commit.ts.utc
#      The last commit timestamp expressed in UTC timezone.
#
#    - git.repo.last.commit.ts.local
#      The last commit timestamp expressed as the timezone of
#      the computer where this script was executed.
#
#    - git.repo.last.commit.ts.tz
#      The last commit timestamp expressed as the selected
#      timezone in the 'git.repo.selected.timezone' property.
#
#    - git.repo.last.commit.longhash
#    - git.repo.last.commit.shorthash
#      Refer to: https://git-scm.com/book/en/v2/Git-Tools-Revision-Selection
#
#    - git.repo.last.commit.branchname
#      The name of the branch in which the current commit was
#      made in.
#
#    - git.repo.last.commit.authorname
#    - git.repo.last.commit.authoremail
#      The commit author's name and email address as configured
#      in either the git repository or in git global config.
#
#

git.repo.selected.timezone       = $GIT_TZ
git.repo.last.commit.ts.unix     = $GIT_COMMIT_TIMESTAMP_UNIX
git.repo.last.commit.ts.utc      = $GIT_COMMIT_TIMESTAMP_UTC
git.repo.last.commit.ts.local    = $GIT_COMMIT_TIMESTAMP_LOCAL
git.repo.last.commit.ts.tz       = $GIT_COMMIT_TIMESTAMP_TZ
git.repo.last.commit.longhash    = $GIT_COMMIT_LONG_HASH
git.repo.last.commit.shorthash   = $GIT_COMMIT_SHORT_HASH
git.repo.last.commit.branchname  = $GIT_BRANCH_NAME
git.repo.last.commit.authorname  = $GIT_COMMIT_AUTHOR_NAME
git.repo.last.commit.authoremail = $GIT_COMMIT_AUTHOR_EMAIL

# End of File.
EOPROPS

cat << EOJAVA > "$THIS_DIR/$TARGET_FILE_BASE_NAME.java"
/*
 * Automatically generated file.
 * Source of this file is: $0
 * Do not make changes here as they will be overwritten.
 *
 * File generated at: $NOW_TIMESTAMP
 *
 * This file is generated as a result of the following git hooks being
 * called:
 *    - post-checkout
 *    - post-commit
 *    - post-merge
 *    - post-rewrite
 *    - post-update
 *
 */
 
package $JAVA_PACKAGE_NAME;

 
public final class $TARGET_FILE_BASE_NAME
{
public static final String      TIME_ZONE                = "$GIT_TZ";
public static final Integer     LAST_COMMIT_TS_UNIX      = $GIT_COMMIT_TIMESTAMP_UNIX;
public static final String      LAST_COMMIT_TS_UTC       = "$GIT_COMMIT_TIMESTAMP_UTC";
public static final String      LAST_COMMIT_TS_LOCAL     = "$GIT_COMMIT_TIMESTAMP_LOCAL";
public static final String      LAST_COMMIT_TS_TZ        = "$GIT_COMMIT_TIMESTAMP_TZ";
public static final String      LAST_COMMIT_LONG_HASH    = "$GIT_COMMIT_LONG_HASH";
public static final String      LAST_COMMIT_SHORT_HASH   = "$GIT_COMMIT_SHORT_HASH";
public static final String      LAST_COMMIT_AUTHOR_NAME  = "$GIT_COMMIT_AUTHOR_NAME";
public static final String      LAST_COMMIT_AUTHOR_EMAIL = "$GIT_COMMIT_AUTHOR_EMAIL";
public static final String      CURRENT_BRANCH_NAME      = "$GIT_BRANCH_NAME";
}

EOJAVA

