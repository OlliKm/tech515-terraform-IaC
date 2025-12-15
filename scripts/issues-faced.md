# while making the [""](/db_app.yml)

some issues I faced was the /posts page was not working.

this was because in my script I previously ran everything as become being it was all in root, I changed my script so the repo clone, npm install, pm2 stop & pm2 start were not running as become as they didn't need to.
* I also had to go into my app node and kill the parent node of the running app as it didn't allow me to run the app.
i did this by checking what was running in 
the **ps aux** on the app then
> ansible web -a "sudo kill (ID) 

to kill it I also had to remove the repo that was made on the app with
> ansible web -a "sudo rm -r repo"

which deleted the rooted folder
<br>
after all that was sorted I was able to run my script again which run things correctly allowing me to view the posts page. 