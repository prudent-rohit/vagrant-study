Workaround to get the lab working.

1) Comment out the synced_folder line in Vagrant file - when you provision the vagrant VM - initially
2) When the VM is up - ssh into it
   1) mv all the contents of /var/www/ to your vagrant home directory
3) Uncomment the synced_folder line from the Vagrantfile
4) Create an empty folder in project home by the name www
5) vagrant reload - this will map the /var/www/ folder in the Guest to www folder on the Host
6) Now ssh into the VM - move back the folder copied out of /var/www/ back to their original space
   1) chmod -R 777 /var/www/myProject/storage
   2) sudo apachectl restart

Reason: When we attempt to create a synch between an empty folder on Host to a folder with contents on the Guest
The Guest folder is overwritten - this destroys the application built during provisioning.

By doing this workaroudn we're able to get a 2 way synch going so development can be done on Host and Testing on Guest
