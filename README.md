This script shows the validity period of the cryptopro license in the running Kubernetes cluster pods. In the script itself, you must specify the name of the pod (one of the first characters to identify it) in which cryptopro is running.

On any VM where the kubectl utility is installed (if necessary, it can be installed on any VM), we create a script, for example in the home directory:
vi ~/cryptopro_view_license.sh

Copy the contents of the script into it and save it.

Making the script executable:
chmod +x ~/cryptopro_view_license.sh

Running the script:
~/cryptopro_view_license.sh
