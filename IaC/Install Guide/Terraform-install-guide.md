# How to Install terraform on windows

1. Go onto their website [Terraform](https://developer.hashicorp.com/terraform/install)
2. Click download on the AMD64 version of either Windows 
3. It should then install to your computer as a ZIP file, unzip it in a relevant folder 
4. Once unzipped you want to copy the file path to the folder with the terraform application, e.g.
> E:\code\cmd-line-tools\Terraform
1. once you have the file path copied you want to go into your settings
2. once in settings search up path and there should be an option to for **Edit the system environmental variables** if so click on that.
3. You then want to click the **Environment Variables** button in the bottom right of system properties window that pops up
4. This should display a list of user variable and system variables we want to look under the **System Variables** for something called **Path**
5. Select where it says path and below the options there should be an **EDIT** button you can click on
6. Once on this page you want to click the **New** button on the side of the screen and then paste in the file path that you copied earlier.
7. Once done click **OK** then **OK** again to save those and finally click **OK** one more time on the system properties page and then you're done
8. to Test if it works open a terminal, Preferably **Git Bash** And then type in "terraform --version"
* and it should come up with something like:
```
terraform --version
Terraform vX.X.X
on windows_amd64
```