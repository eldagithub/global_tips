get_distribution() {
        lsb_dist=""
        # Every system that we officially support has /etc/os-release
        if [ -r /etc/os-release ]; then
                lsb_dist="$(. /etc/os-release && echo "$ID")"
        fi
        # Returning an empty string here should be alright since the
        # case statements don't act unless you provide an actual value
        echo "$lsb_dist"
}


lsb_dist=$( get_distribution )
lsb_dist="$(echo "$lsb_dist" | tr '[:upper:]' '[:lower:]')"

        case "$lsb_dist" in

                ubuntu)
                         apt-get update
			 apt-get upgrade
			 apt-get install git-all
                ;;

                debian|raspbian)
                         apt-get update
			 apt-get upgrade
                         apt-get install git-all
                ;;

                centos|rhel)
                         yum update
			 yum install git		
                ;;

                *)
                        echo "OS DISTRIB NOT SUPPORTED"
			echo 100
                ;;

        esac

