mycd_func()
{
    nowpwd=`pwd`
    if [ $# == 0 ];then
        cd
    else
        mycd=$1
        if [ ${mycd:0:1} = "/" ]; then
            cd $mycd
            mycd_new=$mycd
        elif [ $mycd = "-" ]; then
            cd $mycd > /dev/null 2>&1
            mycd_new=$OLDPWD
        else
            cd $mycd
            mycd_new="$nowpwd/$mycd"
        fi
    fi

    if [ $# == 0 ];then
        ls
    else
        if [ -d $mycd_new ];then
            if [ `ls -l | wc -l` -eq '1' ]; then
                echo "Eric: No file in this directory."
            elif [ `ls -l | wc -l` -le '81' ]; then
                ls
            else
                echo "Eric: File nember > 80"
            fi
        fi
    fi
}

function aliasf()
{
    aliascmd=""
    cdcmd=""
    for value in {1..20}
    do
        aliascmd="${aliascmd}f"
        cdcmd="${cdcmd}../"
        alias ${aliascmd}="cd ${cdcmd}"
    done
}

aliasf
alias cd=mycd_func
