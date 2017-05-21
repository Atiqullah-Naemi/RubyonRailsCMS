# README

RubyonRailsCMS is an advanced CMS and blogging system. Download it for free and build awesome websites with it.
To download, configure and use RubyonRailsCMS follow the below steps:
1. Download Rubyinstaller
2. create a folder and name it anything you want, for example "MyWebsite"
3. install rubyinstaller in newly created folder (MyWebsite) - during installation check the check box "Add to Path"
4. download and install Devkit (create a devkit folder inside MyWebsite and install extract devkit there)
5. open command prompt and cd to devkit
6. follow Quick start and Test instalation in https://github.com/oneclick/rubyinstaller/wiki/Development-Kit
7. download and install NodeJS
8. install Rails by running "gem install rails"
9. clone the repository by running "git clone https://github.com/Atiqullah-Naemi/RubyonRailsCMS.git"
10. Once its done, cd into RubyonRailsCMS
11. Run "bundle install" and then "rails db:migrate"
12. Start the server by running "rails server" 
13. open a browser and type "localhost:30000"

If you get Bcrypt Load error after signup follow the below steps:
1. cd into gems root. It should be under RubyXY-xXY (XY is ruby version)/lib/ruby/gems/x.y.z (x.y.z is your ruby version)/gems
2. cd into bcrypt-x.y.z-mingw32 (x.y.z is bcrypt version)/ext/mri
3. Run "ruby extconf.rb", then run "make" and then "make install"
If make not recognized do:
1. cd into devkit 
2. Run "devkitvars.bat"
3. again cd into RubyXY-xXY (XY is ruby version)/lib/ruby/gems/x.y.z (x.y.z is your ruby version)/gems/bcrypt-x.y.z-mingw32 (x.y.z is bcrypt version)/ext/mri
4. Run "make" and "make install"
5. Start Rails Server again by runing "rails server", open a browser and type "localhost:3000"


