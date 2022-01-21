#!/bin/bash

CUR_PROGRESS=0
TOTAL_STATE=1

# Global Define : Color
cRed='\e[31m'
cBlue='\e[34m'
cGreen='\e[32m'
cYellow='\e[33m'
cWhite='\e[37m'
cSky='\e[36m'
cDim='\e[2m'
cBold='\e[1m'
cLine='\e[4m'
cReset='\e[0m'

# Global Define : Prefix
RUN="${cBold}[ ${cGreen}RUN${cReset} ${cBold}]${cReset}"
SET="${cBold}[ ${cBlue}SET${cReset} ${cBold}]${cReset}"
ERROR="${cBold}[ ${cRed}ERROR${cReset} ${cBold}]${cReset}"
NOTICE="${cBold}[ ${cYellow}NOTICE${cReset} ${cBold}]${cReset}"
DONE="${cBold}[ ${cGreen}DONE${cReset} ${cBold}]${cReset}"


function start_script() {
    echo
    echo -e "# ===================================================== #"
    echo -e "#                GNET Setting Script RUN                #"
    echo -e "# ===================================================== #"
    echo -e "#   Version : 1.0.0                                     #"
    echo -e "#   Date    : 22/01/21                                  #"
    echo -e "#   Author  : So Byung Jun                              #"
    echo -e "# ===================================================== #"
    echo

    local curDir=`pwd`
    local ProgressLogFile=${curDir}/curProgress.log

    if [ -e ${ProgressLogFile} ]
    then
        CUR_PROGRESS=`cat ${ProgressLogFile}`
        echo -e "${SET} Current Progress [ ${CUR_PROGRESS} / ${TOTAL_STATE} ]"

    else
        echo -e "${SET} Current Progress [ 0 / ${TOTAL_STATE} ]"
        touch ${ProgressLogFile}
        echo 0 > ${ProgressLogFile}
    fi
}

function save_cur_progress() {
    local curDir=`pwd`
    local ProgressLogFile=${curDir}/curProgress.log

    echo ${CUR_PROGRESS} > ${ProgressLogFile}
}

function HEAD() { 
	echo -e -n "${cBold}[ $1 ]${cReset}" 
}

function check_installed_package() {
	$1 --version &>/dev/null
}

function download_mkTool() {
    check_installed_package git

	if [ $? -gt 0 ]
	then
		echo -e "${ERROR} git package not installed."
        echo -e "  ================================================================="
        echo -e "  - apt-get install git"
        echo -e "  ================================================================="
        CUR_PROGRESS=0
        save_cur_progress
		return 1
	fi

    # git clone https://github.com/so686so/MkTool

	# if [ $? -gt 0 ]
	# then
	# 	echo -e "${ERROR} install MkTool Failed."
    #     CUR_PROGRESS=0
    #     save_cur_progress
	# 	return 1
	# fi

    ### 여기부터 작업해야함!
    # 순서 예상

    # 1. mkTool 받고
    # 2. 사용자 이름으로 bashrc 바꿔주고
    # 3. Todo.txt 참조

    CUR_PROGRESS=1
    save_cur_progress
}

function run_script() {

    if [ ${CUR_PROGRESS} -eq 0 ]
    then
        download_mkTool
        test $? -gt 0 && return
    fi

    if [ ${CUR_PROGRESS} -eq 1 ]
    then
        echo "WOW!"
    fi
}


# RUN Part
start_script
run_script