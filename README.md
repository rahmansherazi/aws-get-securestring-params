When working with AWS Parameter Stores, it's easy to find Standard values which are visible, but not easy with SecureString, where you must clik on toggle button to show values.
If you are in AWS Console, and open an AWS Cloud Shell, and run this script (it must be executable so change it with chmod +x mylist.sh), it will collect all the parameter stores values (SecureString) and store them to a file list.txt
You can download that list.txt file using this same AWS Cloud Shell, delete this session so no foot steps are left.

Be careful with that list.txt file as it will have all SecureString values decrypted, so remove all those values once not needed.
Don't leave that list.txt file unsecured.
