#!/bin/sh

installing_aws_cli=false
sign_in_to_aws=false
terminating_old_instance=false
create_new_instance=false
query_aws=true
query_linux=true



aws_image_templates=("amazon_linux" "ubuntu_linux")
aws_image_templates=("ubuntu-linux")
aws_image_templates=("amazon_linux")





startTimeOnMasterScript=$(date +%s)



if [ "$installing_aws_cli" = true ] ; then
    echo "======================================================================="
    echo ============     script 01 - installing aws cli     ============
    echo "======================================================================="
    dt=$(date '+%d/%m/%Y %H:%M:%S');
    echo ... at timestamp ... $dt 
    ./script-01-install-aws-linux-cli.sh
    read -p "... linux cli installed ... press any key to continue ..."
else
    echo "======================================================================="
    echo ============     script 01 - installing aws cli - skipped  ============
    echo "======================================================================="
fi


if [ "$sign_in_to_aws" = true ] ; then
    echo "======================================================================="
    echo ============     script 02 - sign in to aws         ============
    echo "======================================================================="
    dt=$(date '+%d/%m/%Y %H:%M:%S');
    echo ... at timestamp ... $dt 
    echo ... a ... prints out aws config
    echo ... b ... prints out ssh config
    echo ... c ... logs in to aws
    echo ... d ... prints out access token
    ./script-02-sign-in-to-aws.sh
    sleepTime=1
    echo sleep $sleepTime second ...
    sleep $sleepTime 
    echo "... signing in to aws cli complete ... press any key to continue ..."
    read proceed
else
    echo "======================================================================="
    echo ============ script 02 - sign in to aws  - skipped     ============
    echo "======================================================================="
fi





clear
workingDirectory=~/github/scripts/aws/awsLinux
cd $workingDirectory









if [ "$terminating_old_instance" = true ] ; then
    echo "======================================================================="
    echo ============ script 99 - terminating running instances =========
    echo "======================================================================="
    dt=$(date '+%d/%m/%Y %H:%M:%S');
    echo $dt 
    echo terminating instance now ...
    ./script-99-terminate-aws-instances.sh
    currentTimeOnMasterScript=$(date +%s)
    timeToDeleteOldInstances=$(($currentTimeOnMasterScript-$startTimeOnMasterScript))
    echo "old instances finished terminating at master script elapsed time $timeToDeleteOldInstances"
    echo 
    echo 
    echo 
fi






echo "======================================================================="
echo ============     script 03 - aws templates in use ==============
echo "======================================================================="
for aws_image_template in ${aws_image_templates[@]}; do
  echo $aws_image_template
done
echo
echo
echo





for aws_image_template in ${aws_image_templates[@]}; do 
    if [ "$create_new_instance" = true ] ; then
        echo "======================================================================="
        echo =====             loop ... spin up aws template                      =======       
        echo ===================  "$aws_image_template"       
        echo "======================================================================="
        dt=$(date '+%H:%M:%S');
        echo spinning up new instance at $dt
        if [ "$aws_image_template" = "amazon_linux" ] ; then
            ./script-03-spin-up-aws-instance-amazon-linux.sh
        elif [ "$aws_image_template" = "ubuntu-linux" ] ; then
            ./script-03-spin-up-aws-instance-ubuntu.sh
        fi
        pauseAfterInstanceCreation=45
        echo aws instance created - pause for $pauseAfterInstanceCreation seconds to allow it fully to come online ...
        sleep $pauseAfterInstanceCreation
        echo aws instance is now online
        echo '\n\n\n\n\n\n\n\n\n\n'
    fi

    currentTimeOnMasterScript=$(date +%s)
    timeToCreateNewInstance=$(($currentTimeOnMasterScript-$startTimeOnMasterScript))
    echo "new instances finished being created at master script elapsed time $timeToCreateNewInstance"






    echo ================================================
    echo ============     get public ip         =========
    echo ================================================

    instance_public_ip=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)

    echo instance public ip is $instance_public_ip for instance $aws_image_template
    echo \n\n\n\n works on mac ... 
    echo '\n\n\n\n'



 
    if [ "$query_aws" = true ] ; then
        echo "======================================================================="
        echo =============== script 04 - query ec2 instance - $aws_image_template  =================
        echo "======================================================================="
        ./script-04-query-aws.sh
        echo '\n\n\n\n'
    fi

    if [ "$query_linux" = true ] ; then
        echo "======================================================================="
        echo =============== script 04 - upgrade and query linux  =================
        echo "======================================================================="
        ./script-04a-launch.sh
        echo '\n\n\n\n'
    fi
    printf "\n\n\n"
done
printf "\n\n\n press any key to proceed"
read proceed







do_this_loop=0
while [ $do_this_loop -eq 1 ]
do



    echo "======================================================================="
    echo =============== install and run apache web server  =================
    echo "======================================================================="
    ./script-05-launch.sh


    echo
    echo
    echo "======================================================================="
    echo ===============       status update       =================
    echo "======================================================================="
    echo linux os updated to latest ✓
    echo apache web server installed and running on port 80 ✓	
    currentTimeOnMasterScript=$(date +%s)
    currentScriptDuration=$(($currentTimeOnMasterScript-$startTimeOnMasterScript))
    echo "apache web server install finished and running on port 80 at elapsed time $currentScriptDuration"
    echo 
    echo 
    echo echo next : install node, express, vue, bun then run the web servers
    echo 
    echo 
    echo 
    sleep 15
    echo 
    echo 
    echo 
    echo "======================================================================="
    echo =================== install node, vue, bun libraries    =================
    echo "======================================================================="
    ./script-06-install-node-libraries-launcher.sh
    echo 
    echo 
    echo 
    echo "======================================================================="
    echo ===============       status update       =================
    echo "======================================================================="
    echo linux os updated to latest ✓
    echo apache, node, git, express, bun, vue installed ✓
    echo apache running port 80 ✓	
    currentTimeOnMasterScript=$(date +%s)
    currentScriptDuration=$(($currentTimeOnMasterScript-$startTimeOnMasterScript))
    echo "node libraries installation finished at elapsed time $currentScriptDuration"
    echo 
    echo 
    echo 
    echo 
    echo 
    echo 
    echo next ... run web servers ...
    echo
    echo
    echo
    echo 


    sleep 15



    echo "======================================================================="
    echo =============== run node web server       =================
    echo "======================================================================="
    open -a Terminal ./script-06-launch.sh







    echo "======================================================================="
    echo =============== run bun  web server       =================
    echo "======================================================================="
    open -a Terminal ./script-07-launch.sh










    echo "======================================================================="
    echo ================== run vue web server  ======================
    echo "======================================================================="
    open -a Terminal ./script-10-launch.sh
    echo
    echo
    echo



    echo "======================================================================="
    echo ===============       status update       =================
    echo "======================================================================="
    echo linux os updated to latest ✓
    echo apache, node, git, express, bun, vue installed ✓
    echo apache running port 80 ✓	
    echo node, express, bun, vue web servers now running
    echo
    echo
    echo
    echo 
    echo "======================================================================="
    echo ===============       pause before testing      =================
    echo "======================================================================="
    echo pausing for seconds to allow all servers to fully come online before testing ...
    for timerCount in {1..60} 
    do
        sleep 1
        printf '.. '
    done
    echo
    echo
    echo
    echo "======================================================================="
    echo ===============       testing - from localhost         =================
    echo "======================================================================="
    instance_public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
    userName=ec2-user
    sshLoginUsername=$userName@$instance_public_ip
    certificatePath='~/.ssh/alpine.pem'
    cd ~/github/scripts/aws/awsLinux
    echo '\n\n\n'
    echo running script to test web servers
    ssh -i $certificatePath $sshLoginUsername 'bash -s' < test-web-servers-from-ec2-instance.sh



    echo
    echo
    echo
    echo "======================================================================="
    echo ===============       testing - public ip and port       =================
    echo "======================================================================="
    ./test-servers.sh



    echo
    echo
    echo "======================================================================="
    echo ===============       status update       =================
    echo *** make this dynamic not fixed !!! 
    echo "======================================================================="
    echo linux update - sudo/apt/yum/dnf not recognised      ✗
    echo apache, node, git, express, bun, vue installed            ✓
    echo node, express, bun, vue web servers installed             ✓
    echo testing web servers using curl localhost                  ✓
    echo testing web servers using curl public ip                  ✓
    echo localhost apache server : 80                              ✓
    echo public ip apache server : 80                              ✓
    echo public ip apache server : 8080                     ✗
    echo public ip apache server : https : 80               ✗
    echo public ip apache server : https : 8080             ✗
    echo localhost node   server : 3006                            ✓
    echo public ip node   server : 3006                     ✗
    echo localhost bun    server : 3007                            ✓
    echo public ip bun    server : 3007                            ✓
    echo localhost vue    server : 3010                     ✗
    echo public ip vue    server : 3010                     ✗
    echo react too slow ...                                 ✗
    echo
    echo ways to develop this script
    echo 1 install the above web servers on different flavours of linux
    echo     a amazon ec2 linux
    echo     b ubuntu linux
    echo     c centos linux
    echo     d red hat linux
    echo     e alpine linux ... mini distribution
    echo 2 use docker to run all the same above servers ...
    echo 3 use windows to run all the same above servers ...
    echo 4 use kubernetes to install multiple copies of the same web server as a cluster?
    echo 5 use yaml to build a web server to perform the same task
    echo 6 develop use of networks on amazon - internal networks, internal firewalls and external networks and firewalls just so i become an expert in hiding and exposing the right ports
    echo 7. sockets - can i install 2 linux instances and just open a socket between them
    echo 8. metasploit - can i install this and do some network scans automatically
    echo 9. can i install some exe or .sh on a machine and run it, by downloading remotely ? 
    echo ...
    echo 
    echo 
    echo
    echo end of loop $loop_counter ...
    ((loop_counter++))
    echo
    echo
    echo
done



terminating_instances=true
if [ "$terminating_instances" = true ] ; then
    echo "======================================================================="
    echo ===============      terminating instances       =================
    echo "======================================================================="
    echo after 1 minute the instance will be terminated
    for timerCount in {1..60} 
    do
        sleep 1
        printf .
    done
    echo
    ./script-99-terminate-aws-instances.sh
    echo instance has been terminated ...
else
    echo "======================================================================="
    echo ===============    not terminating instances       =================
    echo "======================================================================="
fi
echo
echo
echo end of scriptMaster
echo finish ...
